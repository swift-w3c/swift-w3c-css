import Testing

@testable import W3C_CSS_Compositing

enum `Compositing Tests` {}

extension `Compositing Tests` {
    typealias Color = Compositing.Color<Double>
    typealias Straight = Compositing.Straight<Double>
    typealias Premultiplied = Compositing.Premultiplied<Double>

    static let levels: [Double] = [0, 0.125, 0.25, 0.5, 0.75, 1]

    static let colors: [Color] = [
        .black, .white, .init(gray: 0.5),
        .init(red: 1, green: 0, blue: 0), .init(red: 0, green: 1, blue: 0), .init(red: 0, green: 0, blue: 1),
        .init(red: 0.25, green: 0.5, blue: 0.75), .init(red: 0.9, green: 0.1, blue: 0.4),
        .init(red: 0.2, green: 0.2, blue: 0.7),
    ]

    static let pixels: [Straight] = colors.enumerated().map { index, color in
        .init(color: color, alpha: levels[(index * 5 + 2) % levels.count])
    }

    static let separable: [BlendMode] = BlendMode.allModes.filter(\.isSeparable)

    static func close(_ a: Double, _ b: Double, within tolerance: Double = 1e-12) -> Bool {
        abs(a - b) <= tolerance
    }

    static func close(_ a: Color, _ b: Color, within tolerance: Double = 1e-12) -> Bool {
        close(a.red, b.red, within: tolerance) && close(a.green, b.green, within: tolerance)
            && close(a.blue, b.blue, within: tolerance)
    }

    static func close(_ a: Premultiplied, _ b: Premultiplied, within tolerance: Double = 1e-12) -> Bool {
        close(a.color, b.color, within: tolerance) && close(a.alpha, b.alpha, within: tolerance)
    }
}

extension BlendMode {
    fileprivate static let allModes: [BlendMode] = [
        .normal, .multiply, .screen, .overlay, .darken, .lighten, .colorDodge, .colorBurn, .hardLight, .softLight,
        .difference, .exclusion, .hue, .saturation, .color, .luminosity,
    ]
}

extension `Compositing Tests` {
    @Suite
    struct `Simple alpha compositing` {
        typealias Tests = `Compositing Tests`

        @Test
        func `An opaque shape over an empty backdrop is the shape`() {
            let source = Straight(color: .init(red: 1, green: 0, blue: 0), alpha: 1)
            let result = Premultiplied(source).composited(over: .transparent)
            #expect(result == Premultiplied(color: .init(red: 1, green: 0, blue: 0), alpha: 1))
        }

        @Test
        func `An opaque shape over an opaque backdrop hides it`() {
            let source = Straight(color: .init(red: 0, green: 0, blue: 1), alpha: 1)
            let backdrop = Straight(color: .init(red: 1, green: 0, blue: 0), alpha: 1)
            let result = source.composited(over: backdrop)
            #expect(result == Straight(color: .init(red: 0, green: 0, blue: 1), alpha: 1))
        }

        @Test
        func `A half transparent shape over an opaque backdrop is their average`() {
            let source = Straight(color: .init(red: 0, green: 0, blue: 1), alpha: 0.5)
            let backdrop = Straight(color: .init(red: 1, green: 0, blue: 0), alpha: 1)
            let premultiplied = Premultiplied(source).composited(over: Premultiplied(backdrop))
            #expect(premultiplied == Premultiplied(color: .init(red: 0.5, green: 0, blue: 0.5), alpha: 1))
            #expect(source.composited(over: backdrop) == Straight(color: .init(red: 0.5, green: 0, blue: 0.5), alpha: 1))
        }

        @Test
        func `A half transparent shape over a half transparent backdrop`() {
            let source = Straight(color: .init(red: 0, green: 0, blue: 1), alpha: 0.5)
            let backdrop = Straight(color: .init(red: 1, green: 0, blue: 0), alpha: 0.5)
            let premultiplied = Premultiplied(source).composited(over: Premultiplied(backdrop))
            #expect(premultiplied == Premultiplied(color: .init(red: 0.25, green: 0, blue: 0.5), alpha: 0.75))
            let straight = source.composited(over: backdrop)
            #expect(straight.alpha == 0.75)
            #expect(Tests.close(straight.color, .init(red: 1.0 / 3, green: 0, blue: 2.0 / 3)))
        }

        @Test
        func `Premultiplying multiplies the color by alpha and unpremultiplying divides it back`() {
            let straight = Straight(color: .init(red: 0.25, green: 0.5, blue: 1), alpha: 0.5)
            let premultiplied = Premultiplied(straight)
            #expect(premultiplied == Premultiplied(color: .init(red: 0.125, green: 0.25, blue: 0.5), alpha: 0.5))
            #expect(Straight(premultiplied) == straight)
            #expect(Straight(Premultiplied(color: .init(gray: 0.5), alpha: 0)) == .transparent)
        }
    }
}

extension `Compositing Tests` {
    @Suite
    struct `Porter Duff operators` {
        typealias Tests = `Compositing Tests`

        @Test
        func `The keywords are the specification's`() {
            #expect(
                Compositing.Operator.allCases.map(\.description) == [
                    "clear", "copy", "destination", "source-over", "destination-over", "source-in", "destination-in",
                    "source-out", "destination-out", "source-atop", "destination-atop", "xor", "lighter",
                ]
            )
        }

        @Test(arguments: Tests.levels, Tests.levels)
        func `Every operator has the specification's coefficients and alpha`(source: Double, backdrop: Double) {
            let expected: [(Compositing.Operator, Double, Double)] = [
                (.clear, 0, 0), (.copy, 1, 0), (.destination, 0, 1),
                (.sourceOver, 1, 1 - source), (.destinationOver, 1 - backdrop, 1),
                (.sourceIn, backdrop, 0), (.destinationIn, 0, source),
                (.sourceOut, 1 - backdrop, 0), (.destinationOut, 0, 1 - source),
                (.sourceAtop, backdrop, 1 - source), (.destinationAtop, 1 - backdrop, source),
                (.xor, 1 - backdrop, 1 - source), (.lighter, 1, 1),
            ]
            #expect(expected.count == Compositing.Operator.allCases.count)
            for (mode, fa, fb) in expected {
                let factor = mode.coefficients(source: source, backdrop: backdrop)
                #expect(factor == .init(source: fa, backdrop: fb))
                #expect(mode.alpha(source: source, backdrop: backdrop) == source * fa + backdrop * fb)
            }
        }

        @Test(arguments: Compositing.Operator.allCases)
        func `The premultiplied result is the coefficients applied to both premultiplied values`(
            mode: Compositing.Operator
        ) {
            for source in Tests.pixels.map(Premultiplied.init) {
                for backdrop in Tests.pixels.map(Premultiplied.init) {
                    let factor = mode.coefficients(source: source.alpha, backdrop: backdrop.alpha)
                    let result = source.composited(over: backdrop, operator: mode)
                    let expected = Premultiplied(
                        color: source.color.combined(with: backdrop.color) { factor.source * $0 + factor.backdrop * $1 },
                        alpha: factor.source * source.alpha + factor.backdrop * backdrop.alpha
                    )
                    #expect(Tests.close(result, expected))
                }
            }
        }

        @Test
        func `Clear, copy and destination give nothing, the source and the backdrop`() {
            for source in Tests.pixels.map(Premultiplied.init) {
                for backdrop in Tests.pixels.map(Premultiplied.init) {
                    #expect(source.composited(over: backdrop, operator: .clear) == .transparent)
                    #expect(source.composited(over: backdrop, operator: .copy) == source)
                    #expect(source.composited(over: backdrop, operator: .destination) == backdrop)
                }
            }
        }

        @Test(arguments: [
            (Compositing.Operator.sourceOver, Compositing.Operator.destinationOver),
            (.sourceIn, .destinationIn), (.sourceOut, .destinationOut), (.sourceAtop, .destinationAtop),
            (.copy, .destination), (.xor, .xor), (.lighter, .lighter), (.clear, .clear),
        ])
        func `A destination operator is its source operator with the operands exchanged`(
            source: Compositing.Operator,
            destination: Compositing.Operator
        ) {
            for a in Tests.pixels.map(Premultiplied.init) {
                for b in Tests.pixels.map(Premultiplied.init) {
                    let forward = a.composited(over: b, operator: destination)
                    let exchanged = b.composited(over: a, operator: source)
                    #expect(Tests.close(forward, exchanged))
                }
            }
        }

        @Test
        func `Source over is associative and transparent black is its identity`() {
            let pixels = Tests.pixels.map(Premultiplied.init)
            for a in pixels {
                #expect(a.composited(over: .transparent) == a)
                #expect(Premultiplied.transparent.composited(over: a) == a)
                for b in pixels {
                    for c in pixels {
                        let left = a.composited(over: b).composited(over: c)
                        let right = a.composited(over: b.composited(over: c))
                        #expect(Tests.close(left, right))
                    }
                }
            }
        }

        @Test
        func `Lighter is commutative and associative and is not clamped`() {
            let pixels = Tests.pixels.map(Premultiplied.init)
            for a in pixels {
                for b in pixels {
                    #expect(a.composited(over: b, operator: .lighter) == b.composited(over: a, operator: .lighter))
                    for c in pixels {
                        let left = a.composited(over: b, operator: .lighter).composited(over: c, operator: .lighter)
                        let right = a.composited(over: b.composited(over: c, operator: .lighter), operator: .lighter)
                        #expect(Tests.close(left, right))
                    }
                }
            }
            let opaque = Premultiplied(color: .white, alpha: 1)
            #expect(opaque.composited(over: opaque, operator: .lighter) == Premultiplied(color: .init(gray: 2), alpha: 2))
        }

        @Test
        func `Opaque operands reduce the operators to source, backdrop or nothing`() {
            let source = Premultiplied(color: .init(red: 0.25, green: 0.5, blue: 0.75), alpha: 1)
            let backdrop = Premultiplied(color: .init(red: 0.9, green: 0.1, blue: 0.4), alpha: 1)
            let sources: [Compositing.Operator] = [.copy, .sourceOver, .sourceIn, .sourceAtop]
            let backdrops: [Compositing.Operator] = [.destination, .destinationOver, .destinationIn, .destinationAtop]
            let nothing: [Compositing.Operator] = [.clear, .sourceOut, .destinationOut, .xor]
            for mode in sources { #expect(source.composited(over: backdrop, operator: mode) == source) }
            for mode in backdrops { #expect(source.composited(over: backdrop, operator: mode) == backdrop) }
            for mode in nothing { #expect(source.composited(over: backdrop, operator: mode) == .transparent) }
        }
    }
}

extension `Compositing Tests` {
    @Suite
    struct `General formula` {
        typealias Tests = `Compositing Tests`

        @Test(arguments: Compositing.Operator.allCases)
        func `Straight and premultiplied values give the same composite`(mode: Compositing.Operator) {
            for blend in BlendMode.allModes {
                for source in Tests.pixels {
                    for backdrop in Tests.pixels {
                        let straight = source.composited(over: backdrop, operator: mode, blend: blend, coverage: 0.5)
                        let premultiplied = Premultiplied(source)
                            .composited(over: Premultiplied(backdrop), operator: mode, blend: blend, coverage: 0.5)
                        #expect(Tests.close(Premultiplied(straight), premultiplied, within: 1e-9))
                    }
                }
            }
        }

        @Test(arguments: BlendMode.allModes)
        func `The composite is the specification's expansion of blend and source over`(blend: BlendMode) {
            for source in Tests.pixels {
                for backdrop in Tests.pixels {
                    let mixed = blend.blend(backdrop: backdrop.color, source: source.color)
                    let expected = Premultiplied(
                        color: .init(
                            red: Self.expand(source.color.red, backdrop.color.red, mixed.red, source.alpha, backdrop.alpha),
                            green: Self.expand(
                                source.color.green,
                                backdrop.color.green,
                                mixed.green,
                                source.alpha,
                                backdrop.alpha
                            ),
                            blue: Self.expand(source.color.blue, backdrop.color.blue, mixed.blue, source.alpha, backdrop.alpha)
                        ),
                        alpha: source.alpha + backdrop.alpha * (1 - source.alpha)
                    )
                    let result = Premultiplied(source).composited(over: Premultiplied(backdrop), blend: blend)
                    #expect(Tests.close(result, expected, within: 1e-9))
                }
            }
        }

        private static func expand(_ cs: Double, _ cb: Double, _ mixed: Double, _ a: Double, _ b: Double) -> Double {
            a * (1 - b) * cs + a * b * mixed + (1 - a) * b * cb
        }

        @Test(arguments: BlendMode.allModes)
        func `A transparent backdrop leaves the source unblended and an opaque one blends it fully`(blend: BlendMode) {
            for source in Tests.pixels {
                #expect(source.composited(over: .transparent, blend: blend) == Straight(Premultiplied(source)))
                for color in Tests.colors {
                    let opaque = Straight(color: source.color, alpha: 1)
                    let result = opaque.composited(over: Straight(color: color, alpha: 1), blend: blend)
                    #expect(Tests.close(result.color, blend.blend(backdrop: color, source: source.color)))
                    #expect(result.alpha == 1)
                }
            }
        }

        @Test(arguments: Compositing.Operator.allCases)
        func `Coverage multiplies the source alpha`(mode: Compositing.Operator) {
            for blend in [BlendMode.normal, .multiply, .hue] {
                for source in Tests.pixels {
                    for backdrop in Tests.pixels {
                        let full = source.composited(over: backdrop, operator: mode, blend: blend)
                        #expect(source.composited(over: backdrop, operator: mode, blend: blend, coverage: 1) == full)
                        let faded = Straight(color: source.color, alpha: source.alpha * 0.25)
                        let covered = source.composited(over: backdrop, operator: mode, blend: blend, coverage: 0.25)
                        #expect(covered == faded.composited(over: backdrop, operator: mode, blend: blend))
                        let none = source.composited(over: backdrop, operator: mode, blend: blend, coverage: 0)
                        let absent = Straight.transparent.composited(over: backdrop, operator: mode, blend: blend)
                        #expect(Tests.close(Premultiplied(none), Premultiplied(absent)))
                    }
                }
            }
        }

        @Test
        func `Source over with no coverage leaves the backdrop`() {
            for source in Tests.pixels.map(Premultiplied.init) {
                for backdrop in Tests.pixels.map(Premultiplied.init) {
                    #expect(source.composited(over: backdrop, coverage: 0) == backdrop)
                }
            }
        }
    }
}

extension `Compositing Tests` {
    @Suite
    struct `Separable blend modes` {
        typealias Tests = `Compositing Tests`

        @Test
        func `Twelve modes are separable and four are not`() {
            #expect(Tests.separable.count == 12)
            for mode in BlendMode.allModes {
                let value: Double? = mode.blend(backdrop: 0.25, source: 0.75)
                #expect((value != nil) == mode.isSeparable)
            }
        }

        @Test
        func `Known values`() {
            let expected: [(BlendMode, Double)] = [
                (.normal, 0.75), (.multiply, 0.1875), (.screen, 0.8125), (.overlay, 0.375), (.darken, 0.25),
                (.lighten, 0.75), (.colorDodge, 1), (.colorBurn, 0), (.hardLight, 0.625), (.softLight, 0.375),
                (.difference, 0.5), (.exclusion, 0.625),
            ]
            for (mode, value) in expected {
                #expect(mode.blend(backdrop: 0.25, source: 0.75) == value)
            }
            #expect(BlendMode.colorDodge.blend(backdrop: 0.25, source: 0.5) == 0.5)
            #expect(BlendMode.colorBurn.blend(backdrop: 0.75, source: 0.5) == 0.5)
            #expect(BlendMode.softLight.blend(backdrop: 0.25, source: 0.25) == 0.15625)
            #expect(BlendMode.softLight.blend(backdrop: 0.64, source: 1.0) == 0.8)
            #expect(BlendMode.softLight.blend(backdrop: 0.125, source: 1.0) == 0.34375)
        }

        @Test
        func `Normal selects the source`() {
            for backdrop in Tests.levels {
                for source in Tests.levels {
                    #expect(BlendMode.normal.blend(backdrop: backdrop, source: source) == source)
                }
            }
        }

        @Test(arguments: [BlendMode.multiply, .screen, .darken, .lighten, .difference, .exclusion])
        func `Multiply, screen, darken, lighten, difference and exclusion commute`(mode: BlendMode) {
            for a in Tests.levels {
                for b in Tests.levels {
                    let forward: Double? = mode.blend(backdrop: a, source: b)
                    #expect(forward == mode.blend(backdrop: b, source: a))
                }
            }
        }

        @Test
        func `White and black are the identities and annihilators the specification names`() {
            for value in Tests.levels {
                #expect(BlendMode.multiply.blend(backdrop: value, source: 1.0) == value)
                #expect(BlendMode.multiply.blend(backdrop: value, source: 0.0) == 0)
                #expect(BlendMode.screen.blend(backdrop: value, source: 0.0) == value)
                #expect(BlendMode.screen.blend(backdrop: value, source: 1.0) == 1)
                #expect(BlendMode.darken.blend(backdrop: value, source: 1.0) == value)
                #expect(BlendMode.lighten.blend(backdrop: value, source: 0.0) == value)
                #expect(BlendMode.colorDodge.blend(backdrop: value, source: 0.0) == value)
                #expect(BlendMode.colorBurn.blend(backdrop: value, source: 1.0) == value)
                #expect(BlendMode.difference.blend(backdrop: value, source: 0.0) == value)
                #expect(BlendMode.difference.blend(backdrop: value, source: 1.0) == 1 - value)
                #expect(BlendMode.exclusion.blend(backdrop: value, source: 0.0) == value)
                #expect(BlendMode.exclusion.blend(backdrop: value, source: 1.0) == 1 - value)
                #expect(BlendMode.hardLight.blend(backdrop: value, source: 0.0) == 0)
                #expect(BlendMode.hardLight.blend(backdrop: value, source: 1.0) == 1)
                #expect(BlendMode.softLight.blend(backdrop: value, source: 0.5) == value)
            }
        }

        @Test
        func `Color dodge and color burn follow their three cases`() {
            #expect(BlendMode.colorDodge.blend(backdrop: 0.0, source: 1.0) == 0)
            #expect(BlendMode.colorDodge.blend(backdrop: 0.5, source: 1.0) == 1)
            #expect(BlendMode.colorDodge.blend(backdrop: 0.75, source: 0.5) == 1)
            #expect(BlendMode.colorBurn.blend(backdrop: 1.0, source: 0.0) == 1)
            #expect(BlendMode.colorBurn.blend(backdrop: 0.5, source: 0.0) == 0)
            #expect(BlendMode.colorBurn.blend(backdrop: 0.25, source: 0.5) == 0)
        }

        @Test
        func `Overlay is hard light with the operands exchanged`() {
            for a in Tests.levels {
                for b in Tests.levels {
                    let overlay: Double? = BlendMode.overlay.blend(backdrop: a, source: b)
                    #expect(overlay == BlendMode.hardLight.blend(backdrop: b, source: a))
                }
            }
        }

        @Test
        func `Hard light and soft light are continuous where their formulas change`() {
            let step = 1e-9
            for backdrop in Tests.levels {
                let hardBelow = BlendMode.hardLight.blend(backdrop: backdrop, source: 0.5) ?? .nan
                let hardAbove = BlendMode.hardLight.blend(backdrop: backdrop, source: 0.5 + step) ?? .nan
                #expect(Tests.close(hardBelow, hardAbove, within: 1e-8))
                let softBelow = BlendMode.softLight.blend(backdrop: backdrop, source: 0.5) ?? .nan
                let softAbove = BlendMode.softLight.blend(backdrop: backdrop, source: 0.5 + step) ?? .nan
                #expect(Tests.close(softBelow, softAbove, within: 1e-8))
            }
            for source in Tests.levels {
                let below = BlendMode.softLight.blend(backdrop: 0.25, source: source) ?? .nan
                let above = BlendMode.softLight.blend(backdrop: 0.25 + step, source: source) ?? .nan
                #expect(Tests.close(below, above, within: 1e-8))
            }
        }

        @Test(arguments: Tests.separable)
        func `Every result is inside zero to one, also for operands outside it`(mode: BlendMode) {
            let operands = Tests.levels + [-0.5, 1.5]
            for backdrop in operands {
                for source in operands {
                    let value = mode.blend(backdrop: backdrop, source: source) ?? .nan
                    #expect((0...1).contains(value))
                }
            }
        }

        @Test(arguments: Tests.separable)
        func `On a color a separable mode blends each component alone`(mode: BlendMode) {
            for backdrop in Tests.colors {
                for source in Tests.colors {
                    let result = mode.blend(backdrop: backdrop, source: source)
                    #expect(result.red == mode.blend(backdrop: backdrop.red, source: source.red))
                    #expect(result.green == mode.blend(backdrop: backdrop.green, source: source.green))
                    #expect(result.blue == mode.blend(backdrop: backdrop.blue, source: source.blue))
                }
            }
        }

        @Test
        func `Single precision gives the same known values`() {
            #expect(BlendMode.multiply.blend(backdrop: Float(0.25), source: Float(0.75)) == Float(0.1875))
            #expect(BlendMode.softLight.blend(backdrop: Float(0.25), source: Float(0.25)) == Float(0.15625))
        }
    }
}

extension `Compositing Tests` {
    @Suite
    struct `Non-separable blend modes` {
        typealias Tests = `Compositing Tests`

        @Test
        func `Luminosity weighs red, green and blue by 0.3, 0.59 and 0.11`() {
            #expect(Tests.close(Color(red: 1, green: 0, blue: 0).luminosity, 0.3))
            #expect(Tests.close(Color(red: 0, green: 1, blue: 0).luminosity, 0.59))
            #expect(Tests.close(Color(red: 0, green: 0, blue: 1).luminosity, 0.11))
            #expect(Tests.close(Color.white.luminosity, 1))
            #expect(Color(red: 0.25, green: 0.5, blue: 0.75).saturation == 0.5)
        }

        @Test
        func `Known values`() {
            let backdrop = Color(red: 0.25, green: 0.5, blue: 0.75)
            let source = Color(red: 1, green: 0, blue: 0)
            let hue = BlendMode.hue.blend(backdrop: backdrop, source: source)
            #expect(Tests.close(hue, .init(red: 0.8025, green: 0.3025, blue: 0.3025)))
            let saturation = BlendMode.saturation.blend(backdrop: backdrop, source: source)
            #expect(Tests.close(saturation, .init(red: 0.079831932773, green: 0.539915966387, blue: 1), within: 1e-9))
            let color = BlendMode.color.blend(backdrop: backdrop, source: source)
            #expect(Tests.close(color, .init(red: 1, green: 0.217857142857, blue: 0.217857142857), within: 1e-9))
            let luminosity = BlendMode.luminosity.blend(backdrop: backdrop, source: source)
            #expect(Tests.close(luminosity, .init(red: 0.0975, green: 0.3475, blue: 0.5975)))
        }

        @Test
        func `Color keeps the backdrop's luminosity and luminosity takes the source's`() {
            for backdrop in Tests.colors {
                for source in Tests.colors {
                    let color = BlendMode.color.blend(backdrop: backdrop, source: source)
                    #expect(Tests.close(color.luminosity, backdrop.luminosity))
                    let hue = BlendMode.hue.blend(backdrop: backdrop, source: source)
                    #expect(Tests.close(hue.luminosity, backdrop.luminosity))
                    let saturation = BlendMode.saturation.blend(backdrop: backdrop, source: source)
                    #expect(Tests.close(saturation.luminosity, backdrop.luminosity))
                    let luminosity = BlendMode.luminosity.blend(backdrop: backdrop, source: source)
                    #expect(Tests.close(luminosity.luminosity, source.luminosity))
                }
            }
        }

        @Test
        func `Luminosity is color with the operands exchanged`() {
            for backdrop in Tests.colors {
                for source in Tests.colors {
                    let luminosity = BlendMode.luminosity.blend(backdrop: backdrop, source: source)
                    #expect(luminosity == BlendMode.color.blend(backdrop: source, source: backdrop))
                }
            }
        }

        @Test
        func `A color blended with itself is itself`() {
            for color in Tests.colors {
                for mode in [BlendMode.hue, .saturation, .color, .luminosity] {
                    #expect(Tests.close(mode.blend(backdrop: color, source: color), color))
                }
            }
        }

        @Test
        func `Saturation on a gray backdrop changes nothing`() {
            for source in Tests.colors {
                let gray = Color(gray: 0.5)
                #expect(Tests.close(BlendMode.saturation.blend(backdrop: gray, source: source), gray))
            }
        }

        @Test
        func `Hue and saturation give the saturation they are asked for when no clipping is needed`() {
            let color = Color(red: 0.25, green: 0.5, blue: 0.75)
            #expect(color.saturation(0.2).saturation == 0.2)
            #expect(color.saturation(0.2) == Color(red: 0, green: 0.1, blue: 0.2))
            #expect(Color(gray: 0.4).saturation(0.7) == .black)
        }

        @Test
        func `Setting a luminosity outside the gamut clips toward the luminosity`() {
            let bright = Color(red: 1, green: 0, blue: 0).luminosity(0.9)
            #expect(Tests.close(bright.luminosity, 0.9))
            #expect(Tests.close(max(bright.red, bright.green, bright.blue), 1))
            let dark = Color(red: 0, green: 1, blue: 1).luminosity(0.1)
            #expect(Tests.close(dark.luminosity, 0.1))
            #expect(Tests.close(min(dark.red, dark.green, dark.blue), 0))
        }

        @Test(arguments: [BlendMode.hue, .saturation, .color, .luminosity])
        func `Every result is inside zero to one`(mode: BlendMode) {
            for backdrop in Tests.colors {
                for source in Tests.colors {
                    let result = mode.blend(backdrop: backdrop, source: source)
                    for component in [result.red, result.green, result.blue] {
                        #expect((0...1).contains(component))
                    }
                }
            }
        }
    }
}
