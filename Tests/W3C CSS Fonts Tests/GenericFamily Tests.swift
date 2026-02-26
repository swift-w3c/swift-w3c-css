// GenericFamily Tests.swift
// swift-w3c-css
//
// Tests for CSS GenericFamily type

import Testing

@testable import W3C_CSS_Fonts

// MARK: - Basic Functionality

@Suite
struct `GenericFamily - Traditional Families` {
    @Test(arguments: [
        (GenericFamily.serif, "serif"),
        (.sansSerif, "sans-serif"),
        (.monospace, "monospace"),
        (.cursive, "cursive"),
        (.fantasy, "fantasy"),
    ])
    func `traditional generic families have correct raw values`(
        family: GenericFamily,
        expected: String
    ) {
        #expect(family.rawValue == expected)
        #expect(family.description == expected)
    }
}

@Suite
struct `GenericFamily - UI-Related Families` {
    @Test(arguments: [
        (GenericFamily.systemUi, "system-ui"),
        (.uiSerif, "ui-serif"),
        (.uiSansSerif, "ui-sans-serif"),
        (.uiMonospace, "ui-monospace"),
        (.uiRounded, "ui-rounded"),
    ])
    func `UI-related generic families have correct raw values`(
        family: GenericFamily,
        expected: String
    ) {
        #expect(family.rawValue == expected)
        #expect(family.description == expected)
    }
}

@Suite
struct `GenericFamily - Special Purpose Families` {
    @Test(arguments: [
        (GenericFamily.math, "math"),
        (.emoji, "emoji"),
        (.fangsong, "fangsong"),
    ])
    func `special purpose generic families have correct raw values`(
        family: GenericFamily,
        expected: String
    ) {
        #expect(family.rawValue == expected)
        #expect(family.description == expected)
    }
}

// MARK: - Protocol Conformance

@Suite
struct `GenericFamily - Hashable Conformance` {
    @Test func `equal generic families are equal`() {
        let family1 = GenericFamily.sansSerif
        let family2 = GenericFamily.sansSerif
        #expect(family1 == family2)
    }

    @Test func `different generic families are not equal`() {
        let sansSerif = GenericFamily.sansSerif
        let monospace = GenericFamily.monospace
        #expect(sansSerif != monospace)
    }
}

@Suite
struct `GenericFamily - RawRepresentable Conformance` {
    @Test(arguments: [
        ("serif", GenericFamily.serif),
        ("sans-serif", .sansSerif),
        ("monospace", .monospace),
        ("system-ui", .systemUi),
        ("ui-serif", .uiSerif),
        ("math", .math),
    ])
    func `generic family can be created from raw value`(rawValue: String, expected: GenericFamily) {
        #expect(GenericFamily(rawValue: rawValue) == expected)
    }

    @Test func `invalid raw value returns nil`() {
        #expect(GenericFamily(rawValue: "invalid") == nil)
    }
}

// MARK: - CSS Specification Compliance

@Suite
struct `GenericFamily - CSS Specification` {
    @Test func `traditional families match CSS specification`() {
        // Fonts with serifs
        #expect(GenericFamily.serif.description == "serif")
        // Fonts without serifs
        #expect(GenericFamily.sansSerif.description == "sans-serif")
        // Fixed-width fonts
        #expect(GenericFamily.monospace.description == "monospace")
        // Handwriting fonts
        #expect(GenericFamily.cursive.description == "cursive")
        // Decorative fonts
        #expect(GenericFamily.fantasy.description == "fantasy")
    }

    @Test func `UI families match CSS specification`() {
        // System UI font
        #expect(GenericFamily.systemUi.description == "system-ui")
        // System serif font
        #expect(GenericFamily.uiSerif.description == "ui-serif")
        // System sans-serif font
        #expect(GenericFamily.uiSansSerif.description == "ui-sans-serif")
        // System monospace font
        #expect(GenericFamily.uiMonospace.description == "ui-monospace")
        // System rounded font
        #expect(GenericFamily.uiRounded.description == "ui-rounded")
    }

    @Test func `special purpose families match CSS specification`() {
        // Mathematical fonts
        #expect(GenericFamily.math.description == "math")
        // Emoji fonts
        #expect(GenericFamily.emoji.description == "emoji")
        // Chinese Fangsong fonts
        #expect(GenericFamily.fangsong.description == "fangsong")
    }
}

// MARK: - Usage in Context

@Suite
struct `GenericFamily - CSS Property Usage` {
    @Test func `single generic family in font-family property`() {
        let monoFont = "font-family: \(GenericFamily.monospace)"
        #expect(monoFont == "font-family: monospace")
    }

    @Test func `generic family as fallback in font-family property`() {
        let fontsWithFallback = "font-family: 'Helvetica Neue', \(GenericFamily.sansSerif)"
        #expect(fontsWithFallback == "font-family: 'Helvetica Neue', sans-serif")
    }

    @Test func `multiple generic families in font-family property`() {
        let multipleFonts = "font-family: \(GenericFamily.uiSansSerif), \(GenericFamily.sansSerif)"
        #expect(multipleFonts == "font-family: ui-sans-serif, sans-serif")
    }

    @Test func `system UI font stack`() {
        let systemStack = "font-family: \(GenericFamily.systemUi), \(GenericFamily.sansSerif)"
        #expect(systemStack == "font-family: system-ui, sans-serif")
    }
}

// MARK: - Edge Cases

@Suite
struct `GenericFamily - Edge Cases` {
    @Test func `all traditional families are distinct`() {
        let traditionalFamilies: [GenericFamily] = [
            .serif, .sansSerif, .monospace, .cursive, .fantasy,
        ]
        for i in traditionalFamilies.indices {
            for j in traditionalFamilies.indices where i != j {
                #expect(traditionalFamilies[i] != traditionalFamilies[j])
            }
        }
    }

    @Test func `all UI families are distinct`() {
        let uiFamilies: [GenericFamily] = [
            .systemUi, .uiSerif, .uiSansSerif, .uiMonospace, .uiRounded,
        ]
        for i in uiFamilies.indices {
            for j in uiFamilies.indices where i != j {
                #expect(uiFamilies[i] != uiFamilies[j])
            }
        }
    }

    @Test func `all special purpose families are distinct`() {
        let specialFamilies: [GenericFamily] = [.math, .emoji, .fangsong]
        for i in specialFamilies.indices {
            for j in specialFamilies.indices where i != j {
                #expect(specialFamilies[i] != specialFamilies[j])
            }
        }
    }

    @Test func `raw values contain no uppercase characters`() {
        let allFamilies: [GenericFamily] = [
            .serif, .sansSerif, .monospace, .cursive, .fantasy,
            .systemUi, .uiSerif, .uiSansSerif, .uiMonospace, .uiRounded,
            .math, .emoji, .fangsong,
        ]
        for family in allFamilies {
            #expect(!family.rawValue.contains(where: { $0.isUppercase }))
        }
    }
}

// MARK: - Font Stack Patterns

@Suite
struct `GenericFamily - Common Font Stacks` {
    @Test func `modern system font stack`() {
        // Modern approach using system-ui
        let modernStack = "\(GenericFamily.systemUi), \(GenericFamily.sansSerif)"
        #expect(modernStack == "system-ui, sans-serif")
    }

    @Test func `monospace code font stack`() {
        // Common monospace stack for code
        let codeStack = "\(GenericFamily.uiMonospace), \(GenericFamily.monospace)"
        #expect(codeStack == "ui-monospace, monospace")
    }

    @Test func `serif reading font stack`() {
        // Traditional serif stack for body text
        let serifStack = "\(GenericFamily.uiSerif), \(GenericFamily.serif)"
        #expect(serifStack == "ui-serif, serif")
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `GenericFamily - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `generic family raw value access 100K times`() {
            let families: [GenericFamily] = [
                .serif, .sansSerif, .monospace, .systemUi, .math,
            ]
            for i in 0..<100_000 {
                _ = families[i % families.count].rawValue
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `generic family description generation 100K times`() {
            let family = GenericFamily.sansSerif
            for _ in 0..<100_000 {
                _ = family.description
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `generic family comparison 100K times`() {
            let sansSerif = GenericFamily.sansSerif
            let families: [GenericFamily] = [
                .serif, .sansSerif, .monospace, .systemUi, .math,
            ]
            for i in 0..<100_000 {
                _ = families[i % families.count] == sansSerif
            }
        }
    }
}
