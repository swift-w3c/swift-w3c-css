import Testing

@testable import W3C_CSS_Compositing

enum `W3C.Compositing.BlendMode Tests` {}

extension `W3C.Compositing.BlendMode Tests` {
    @Suite
    struct `W3C.Compositing.BlendMode - Basic Values` {
        @Test(arguments: [
            (W3C.Compositing.BlendMode.normal, "normal"),
            (W3C.Compositing.BlendMode.multiply, "multiply"),
            (W3C.Compositing.BlendMode.screen, "screen"),
            (W3C.Compositing.BlendMode.overlay, "overlay"),
            (W3C.Compositing.BlendMode.darken, "darken"),
            (W3C.Compositing.BlendMode.lighten, "lighten"),
        ])
        func `basic blend mode values render correctly`(
            mode: W3C.Compositing.BlendMode,
            expected: String
        ) {
            #expect(mode.description == expected)
        }
    }
}

extension `W3C.Compositing.BlendMode Tests` {
    @Suite
    struct `W3C.Compositing.BlendMode - Compound Values` {
        @Test(arguments: [
            (W3C.Compositing.BlendMode.colorDodge, "color-dodge"),
            (W3C.Compositing.BlendMode.colorBurn, "color-burn"),
            (W3C.Compositing.BlendMode.hardLight, "hard-light"),
            (W3C.Compositing.BlendMode.softLight, "soft-light"),
        ])
        func `compound blend mode values render correctly`(
            mode: W3C.Compositing.BlendMode,
            expected: String
        ) {
            #expect(mode.description == expected)
        }
    }
}

extension `W3C.Compositing.BlendMode Tests` {
    @Suite
    struct `W3C.Compositing.BlendMode - Special Values` {
        @Test(arguments: [
            (W3C.Compositing.BlendMode.difference, "difference"),
            (W3C.Compositing.BlendMode.exclusion, "exclusion"),
            (W3C.Compositing.BlendMode.hue, "hue"),
            (W3C.Compositing.BlendMode.saturation, "saturation"),
            (W3C.Compositing.BlendMode.color, "color"),
            (W3C.Compositing.BlendMode.luminosity, "luminosity"),
        ])
        func `special blend mode values render correctly`(
            mode: W3C.Compositing.BlendMode,
            expected: String
        ) {
            #expect(mode.description == expected)
        }
    }
}

extension `W3C.Compositing.BlendMode Tests` {
    @Suite
    struct `W3C.Compositing.BlendMode - Raw Value` {
        @Test(arguments: [
            ("normal", W3C.Compositing.BlendMode.normal),
            ("multiply", W3C.Compositing.BlendMode.multiply),
            ("screen", W3C.Compositing.BlendMode.screen),
            ("color-dodge", W3C.Compositing.BlendMode.colorDodge),
            ("hard-light", W3C.Compositing.BlendMode.hardLight),
        ])
        func `raw values are correct`(
            rawValue: String,
            mode: W3C.Compositing.BlendMode
        ) {
            #expect(mode.rawValue == rawValue)
        }

        @Test func `initialization from valid raw value`() {
            let normal = W3C.Compositing.BlendMode(rawValue: "normal")
            #expect(normal == W3C.Compositing.BlendMode.normal)

            let colorDodge = W3C.Compositing.BlendMode(rawValue: "color-dodge")
            #expect(colorDodge == W3C.Compositing.BlendMode.colorDodge)

            let hardLight = W3C.Compositing.BlendMode(rawValue: "hard-light")
            #expect(hardLight == W3C.Compositing.BlendMode.hardLight)
        }

        @Test func `initialization from invalid raw value returns nil`() {
            let invalid = W3C.Compositing.BlendMode(rawValue: "invalid")
            #expect(invalid == nil)

            let invalid2 = W3C.Compositing.BlendMode(rawValue: "not-a-mode")
            #expect(invalid2 == nil)
        }
    }
}

extension `W3C.Compositing.BlendMode Tests` {
    @Suite
    struct `W3C.Compositing.BlendMode - Hashable Conformance` {
        @Test func `equal blend modes are equal`() {
            let normal1 = W3C.Compositing.BlendMode.normal
            let normal2 = W3C.Compositing.BlendMode.normal
            #expect(normal1 == normal2)
        }

        @Test func `different blend modes are not equal`() {
            let normal = W3C.Compositing.BlendMode.normal
            let multiply = W3C.Compositing.BlendMode.multiply
            #expect(normal != multiply)
        }

        @Test(arguments: [
            (W3C.Compositing.BlendMode.hue, W3C.Compositing.BlendMode.saturation),
            (W3C.Compositing.BlendMode.colorDodge, W3C.Compositing.BlendMode.colorBurn),
            (W3C.Compositing.BlendMode.hardLight, W3C.Compositing.BlendMode.softLight),
            (W3C.Compositing.BlendMode.difference, W3C.Compositing.BlendMode.exclusion),
        ])
        func `different specific blend modes are not equal`(
            mode1: W3C.Compositing.BlendMode,
            mode2: W3C.Compositing.BlendMode
        ) {
            #expect(mode1 != mode2)
        }

        @Test func `blend modes can be used in sets`() {
            let modes: Set<W3C.Compositing.BlendMode> = [.normal, .multiply, .screen, .overlay]
            #expect(modes.count == 4)
            #expect(modes.contains(.normal))
            #expect(modes.contains(.multiply))
        }

        @Test func `blend modes can be used in dictionaries`() {
            let dict: [W3C.Compositing.BlendMode: String] = [
                .normal: "Normal blending",
                .multiply: "Multiply blending",
                .screen: "Screen blending",
            ]
            #expect(dict[.normal] == "Normal blending")
            #expect(dict[.multiply] == "Multiply blending")
        }
    }
}

extension `W3C.Compositing.BlendMode Tests` {
    @Suite
    struct `W3C.Compositing.BlendMode - CSS Property Usage` {
        @Test func `blend mode in mix-blend-mode property`() {
            let mixBlendMode = "mix-blend-mode: \(W3C.Compositing.BlendMode.multiply)"
            #expect(mixBlendMode == "mix-blend-mode: multiply")
        }

        @Test func `blend mode in background-blend-mode property`() {
            let backgroundBlendMode = "background-blend-mode: \(W3C.Compositing.BlendMode.screen)"
            #expect(backgroundBlendMode == "background-blend-mode: screen")
        }

        @Test(arguments: [
            (W3C.Compositing.BlendMode.overlay, "mix-blend-mode: overlay"),
            (W3C.Compositing.BlendMode.colorDodge, "mix-blend-mode: color-dodge"),
            (W3C.Compositing.BlendMode.hue, "mix-blend-mode: hue"),
        ])
        func `various blend modes in CSS properties`(
            mode: W3C.Compositing.BlendMode,
            expected: String
        ) {
            let property = "mix-blend-mode: \(mode)"
            #expect(property == expected)
        }
    }
}

extension `W3C.Compositing.BlendMode Tests` {
    @Suite
    struct `W3C.Compositing.BlendMode - Complete List` {
        @Test func `all basic blend modes exist`() {
            let basicModes: [W3C.Compositing.BlendMode] = [
                .normal,
                .multiply,
                .screen,
                .overlay,
                .darken,
                .lighten,
            ]

            for mode in basicModes {
                #expect(!mode.description.isEmpty)
            }
        }

        @Test func `all compound blend modes exist`() {
            let compoundModes: [W3C.Compositing.BlendMode] = [
                .colorDodge,
                .colorBurn,
                .hardLight,
                .softLight,
            ]

            for mode in compoundModes {
                #expect(mode.description.contains("-"))
            }
        }

        @Test func `all special blend modes exist`() {
            let specialModes: [W3C.Compositing.BlendMode] = [
                .difference,
                .exclusion,
                .hue,
                .saturation,
                .color,
                .luminosity,
            ]

            for mode in specialModes {
                #expect(!mode.description.isEmpty)
            }
        }
    }
}

extension `W3C.Compositing.BlendMode Tests` {
    @Suite
    struct `W3C.Compositing.BlendMode - Edge Cases` {
        @Test func `normal blend mode is default`() {
            let normal = W3C.Compositing.BlendMode.normal
            #expect(normal.description == "normal")
        }

        @Test func `compound names use hyphens`() {
            #expect(W3C.Compositing.BlendMode.colorDodge.rawValue == "color-dodge")
            #expect(W3C.Compositing.BlendMode.colorBurn.rawValue == "color-burn")
            #expect(W3C.Compositing.BlendMode.hardLight.rawValue == "hard-light")
            #expect(W3C.Compositing.BlendMode.softLight.rawValue == "soft-light")
        }

        @Test func `raw value initialization is case sensitive`() {
            #expect(W3C.Compositing.BlendMode(rawValue: "Normal") == nil)
            #expect(W3C.Compositing.BlendMode(rawValue: "MULTIPLY") == nil)
            #expect(W3C.Compositing.BlendMode(rawValue: "normal") == .normal)
        }

        @Test func `raw value with spaces is invalid`() {
            #expect(W3C.Compositing.BlendMode(rawValue: "color dodge") == nil)
            #expect(W3C.Compositing.BlendMode(rawValue: " multiply") == nil)
            #expect(W3C.Compositing.BlendMode(rawValue: "screen ") == nil)
        }
    }
}

extension `W3C.Compositing.BlendMode Tests` {
    @Suite
    struct `W3C.Compositing.BlendMode - Categorization` {
        @Test func `separable blend modes`() {

            let separableModes: [W3C.Compositing.BlendMode] = [
                .normal, .multiply, .screen, .overlay,
                .darken, .lighten, .colorDodge, .colorBurn,
                .hardLight, .softLight, .difference, .exclusion,
            ]

            #expect(separableModes.count == 12)
        }

        @Test func `non-separable blend modes`() {

            let nonSeparableModes: [W3C.Compositing.BlendMode] = [
                .hue, .saturation, .color, .luminosity,
            ]

            #expect(nonSeparableModes.count == 4)
        }
    }
}

extension `Performance Tests` {
    @Suite
    struct `W3C.Compositing.BlendMode - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `blend mode access 100K times`() {
            (0..<100_000).forEach { i in
                let _ = (i % 2 == 0) ? W3C.Compositing.BlendMode.normal : W3C.Compositing.BlendMode.multiply
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `blend mode comparison 100K times`() {
            let mode1 = W3C.Compositing.BlendMode.multiply
            (0..<100_000).forEach { i in
                let mode2 = (i % 2 == 0) ? W3C.Compositing.BlendMode.multiply : W3C.Compositing.BlendMode.screen
                _ = mode1 == mode2
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `raw value initialization 100K times`() {
            (0..<100_000).forEach { i in
                let rawValue = (i % 2 == 0) ? "multiply" : "screen"
                _ = W3C.Compositing.BlendMode(rawValue: rawValue)
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `blend mode description 100K times`() {
            let mode = W3C.Compositing.BlendMode.multiply
            for _ in 0..<100_000 {
                _ = mode.description
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `blend mode set operations 10K times`() {
            for _ in 0..<10_000 {
                var modes: Set<W3C.Compositing.BlendMode> = []
                modes.insert(.normal)
                modes.insert(.multiply)
                modes.insert(.screen)
                _ = modes.contains(.multiply)
            }
        }
    }
}
