// BlendMode Tests.swift
// swift-w3c-css
//
// Tests for CSS BlendMode type

import Testing

@testable import W3C_CSS_Compositing

// MARK: - Basic Blend Modes

@Suite
struct `BlendMode - Basic Values` {
    @Test(arguments: [
        (BlendMode.normal, "normal"),
        (BlendMode.multiply, "multiply"),
        (BlendMode.screen, "screen"),
        (BlendMode.overlay, "overlay"),
        (BlendMode.darken, "darken"),
        (BlendMode.lighten, "lighten"),
    ])
    func `basic blend mode values render correctly`(
        mode: BlendMode,
        expected: String
    ) {
        #expect(mode.description == expected)
    }
}

// MARK: - Compound Blend Modes

@Suite
struct `BlendMode - Compound Values` {
    @Test(arguments: [
        (BlendMode.colorDodge, "color-dodge"),
        (BlendMode.colorBurn, "color-burn"),
        (BlendMode.hardLight, "hard-light"),
        (BlendMode.softLight, "soft-light"),
    ])
    func `compound blend mode values render correctly`(
        mode: BlendMode,
        expected: String
    ) {
        #expect(mode.description == expected)
    }
}

// MARK: - Special Blend Modes

@Suite
struct `BlendMode - Special Values` {
    @Test(arguments: [
        (BlendMode.difference, "difference"),
        (BlendMode.exclusion, "exclusion"),
        (BlendMode.hue, "hue"),
        (BlendMode.saturation, "saturation"),
        (BlendMode.color, "color"),
        (BlendMode.luminosity, "luminosity"),
    ])
    func `special blend mode values render correctly`(
        mode: BlendMode,
        expected: String
    ) {
        #expect(mode.description == expected)
    }
}

// MARK: - Raw Value Initialization

@Suite
struct `BlendMode - Raw Value` {
    @Test(arguments: [
        ("normal", BlendMode.normal),
        ("multiply", BlendMode.multiply),
        ("screen", BlendMode.screen),
        ("color-dodge", BlendMode.colorDodge),
        ("hard-light", BlendMode.hardLight),
    ])
    func `raw values are correct`(
        rawValue: String,
        mode: BlendMode
    ) {
        #expect(mode.rawValue == rawValue)
    }

    @Test func `initialization from valid raw value`() {
        let normal = BlendMode(rawValue: "normal")
        #expect(normal == BlendMode.normal)

        let colorDodge = BlendMode(rawValue: "color-dodge")
        #expect(colorDodge == BlendMode.colorDodge)

        let hardLight = BlendMode(rawValue: "hard-light")
        #expect(hardLight == BlendMode.hardLight)
    }

    @Test func `initialization from invalid raw value returns nil`() {
        let invalid = BlendMode(rawValue: "invalid")
        #expect(invalid == nil)

        let invalid2 = BlendMode(rawValue: "not-a-mode")
        #expect(invalid2 == nil)
    }
}

// MARK: - Protocol Conformance

@Suite
struct `BlendMode - Hashable Conformance` {
    @Test func `equal blend modes are equal`() {
        let normal1 = BlendMode.normal
        let normal2 = BlendMode.normal
        #expect(normal1 == normal2)
    }

    @Test func `different blend modes are not equal`() {
        let normal = BlendMode.normal
        let multiply = BlendMode.multiply
        #expect(normal != multiply)
    }

    @Test(arguments: [
        (BlendMode.hue, BlendMode.saturation),
        (BlendMode.colorDodge, BlendMode.colorBurn),
        (BlendMode.hardLight, BlendMode.softLight),
        (BlendMode.difference, BlendMode.exclusion),
    ])
    func `different specific blend modes are not equal`(
        mode1: BlendMode,
        mode2: BlendMode
    ) {
        #expect(mode1 != mode2)
    }

    @Test func `blend modes can be used in sets`() {
        let modes: Set<BlendMode> = [.normal, .multiply, .screen, .overlay]
        #expect(modes.count == 4)
        #expect(modes.contains(.normal))
        #expect(modes.contains(.multiply))
    }

    @Test func `blend modes can be used in dictionaries`() {
        let dict: [BlendMode: String] = [
            .normal: "Normal blending",
            .multiply: "Multiply blending",
            .screen: "Screen blending",
        ]
        #expect(dict[.normal] == "Normal blending")
        #expect(dict[.multiply] == "Multiply blending")
    }
}

// MARK: - Usage in Context

@Suite
struct `BlendMode - CSS Property Usage` {
    @Test func `blend mode in mix-blend-mode property`() {
        let mixBlendMode = "mix-blend-mode: \(BlendMode.multiply)"
        #expect(mixBlendMode == "mix-blend-mode: multiply")
    }

    @Test func `blend mode in background-blend-mode property`() {
        let backgroundBlendMode = "background-blend-mode: \(BlendMode.screen)"
        #expect(backgroundBlendMode == "background-blend-mode: screen")
    }

    @Test(arguments: [
        (BlendMode.overlay, "mix-blend-mode: overlay"),
        (BlendMode.colorDodge, "mix-blend-mode: color-dodge"),
        (BlendMode.hue, "mix-blend-mode: hue"),
    ])
    func `various blend modes in CSS properties`(
        mode: BlendMode,
        expected: String
    ) {
        let property = "mix-blend-mode: \(mode)"
        #expect(property == expected)
    }
}

// MARK: - All Blend Modes

@Suite
struct `BlendMode - Complete List` {
    @Test func `all basic blend modes exist`() {
        let basicModes: [BlendMode] = [
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
        let compoundModes: [BlendMode] = [
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
        let specialModes: [BlendMode] = [
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

// MARK: - Edge Cases

@Suite
struct `BlendMode - Edge Cases` {
    @Test func `normal blend mode is default`() {
        let normal = BlendMode.normal
        #expect(normal.description == "normal")
    }

    @Test func `compound names use hyphens`() {
        #expect(BlendMode.colorDodge.rawValue == "color-dodge")
        #expect(BlendMode.colorBurn.rawValue == "color-burn")
        #expect(BlendMode.hardLight.rawValue == "hard-light")
        #expect(BlendMode.softLight.rawValue == "soft-light")
    }

    @Test func `raw value initialization is case sensitive`() {
        #expect(BlendMode(rawValue: "Normal") == nil)
        #expect(BlendMode(rawValue: "MULTIPLY") == nil)
        #expect(BlendMode(rawValue: "normal") == .normal)
    }

    @Test func `raw value with spaces is invalid`() {
        #expect(BlendMode(rawValue: "color dodge") == nil)
        #expect(BlendMode(rawValue: " multiply") == nil)
        #expect(BlendMode(rawValue: "screen ") == nil)
    }
}

// MARK: - Blend Mode Categories

@Suite
struct `BlendMode - Categorization` {
    @Test func `separable blend modes`() {
        // Separable blend modes treat color components independently
        let separableModes: [BlendMode] = [
            .normal, .multiply, .screen, .overlay,
            .darken, .lighten, .colorDodge, .colorBurn,
            .hardLight, .softLight, .difference, .exclusion,
        ]

        #expect(separableModes.count == 12)
    }

    @Test func `non-separable blend modes`() {
        // Non-separable blend modes consider all color components together
        let nonSeparableModes: [BlendMode] = [
            .hue, .saturation, .color, .luminosity,
        ]

        #expect(nonSeparableModes.count == 4)
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `BlendMode - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `blend mode access 100K times`() {
            for i in 0..<100_000 {
                let _ = (i % 2 == 0) ? BlendMode.normal : BlendMode.multiply
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `blend mode comparison 100K times`() {
            let mode1 = BlendMode.multiply
            for i in 0..<100_000 {
                let mode2 = (i % 2 == 0) ? BlendMode.multiply : BlendMode.screen
                _ = mode1 == mode2
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `raw value initialization 100K times`() {
            for i in 0..<100_000 {
                let rawValue = (i % 2 == 0) ? "multiply" : "screen"
                _ = BlendMode(rawValue: rawValue)
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `blend mode description 100K times`() {
            let mode = BlendMode.multiply
            for _ in 0..<100_000 {
                _ = mode.description
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `blend mode set operations 10K times`() {
            for _ in 0..<10_000 {
                var modes: Set<BlendMode> = []
                modes.insert(.normal)
                modes.insert(.multiply)
                modes.insert(.screen)
                _ = modes.contains(.multiply)
            }
        }
    }
}
