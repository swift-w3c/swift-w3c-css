// NamedColor Tests.swift
// swift-w3c-css
//
// Tests for CSS NamedColor type

import Testing
import W3C_CSS_Values

@testable import W3C_CSS_Color

// MARK: - Basic Named Colors

@Suite
struct `NamedColor - Basic Colors` {
    @Test(arguments: [
        (NamedColor.red, "red"),
        (.blue, "blue"),
        (.green, "green"),
        (.black, "black"),
        (.white, "white"),
    ])
    func `basic named colors render correctly`(
        color: NamedColor,
        expected: String
    ) {
        #expect(color.description == expected)
    }
}

@Suite
struct `NamedColor - Extended Colors` {
    @Test(arguments: [
        (NamedColor.cornflowerblue, "cornflowerblue"),
        (.rebeccapurple, "rebeccapurple"),
        (.hotpink, "hotpink"),
        (.mediumseagreen, "mediumseagreen"),
    ])
    func `extended named colors render correctly`(
        color: NamedColor,
        expected: String
    ) {
        #expect(color.description == expected)
    }
}

// MARK: - Special Color Values

@Suite
struct `NamedColor - Special Values` {
    @Test(arguments: [
        (NamedColor.transparent, "transparent"),
        (.currentColor, "currentColor"),
        (.current, "currentColor"),
    ])
    func `special color values render correctly`(
        color: NamedColor,
        expected: String
    ) {
        #expect(color.description == expected)
    }

    @Test func `current and currentColor are equivalent`() {
        #expect(NamedColor.current == NamedColor.currentColor)
    }
}

// MARK: - Protocol Conformance

@Suite
struct `NamedColor - CaseIterable Conformance` {
    @Test func `all cases can be iterated`() {
        var count = 0
        for _ in NamedColor.allCases {
            count += 1
        }
        #expect(count > 100)
    }

    @Test(arguments: [
        NamedColor.red,
        .transparent,
        .rebeccapurple,
    ])
    func `specific colors are in all cases`(color: NamedColor) {
        #expect(NamedColor.allCases.contains(color))
    }
}

@Suite
struct `NamedColor - Hashable Conformance` {
    @Test func `equal named colors are equal`() {
        let red1 = NamedColor.red
        let red2 = NamedColor.red
        #expect(red1 == red2)
    }

    @Test func `different named colors are not equal`() {
        let red = NamedColor.red
        let blue = NamedColor.blue
        #expect(red != blue)
    }
}

// MARK: - Raw Value

@Suite
struct `NamedColor - Raw Value` {
    @Test func `description matches raw value for all cases`() {
        for color in NamedColor.allCases {
            #expect(color.description == color.rawValue)
        }
    }
}

// MARK: - Usage in CSS Context

@Suite
struct `NamedColor - CSS Context Usage` {
    @Test(arguments: [
        (NamedColor.blue, "color: blue"),
        (.transparent, "background-color: transparent"),
        (.currentColor, "border-color: currentColor"),
    ])
    func `named color is used correctly in CSS properties`(
        color: NamedColor,
        expected: String
    ) {
        let property = expected.split(separator: ":")[0]
        let result = "\(property): \(color)"
        #expect(result == expected)
    }
}

// MARK: - Edge Cases

@Suite
struct `NamedColor - Edge Cases` {
    @Test func `transparent color value`() {
        #expect(NamedColor.transparent.description == "transparent")
    }

    @Test func `currentColor preserves capitalization`() {
        #expect(NamedColor.currentColor.description == "currentColor")
    }

    @Test func `all cases are unique`() {
        let allCases = NamedColor.allCases
        let uniqueCases = Set(allCases)
        #expect(allCases.count == uniqueCases.count)
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `NamedColor - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `named color description access 100K times`() {
            for i in 0..<100_000 {
                let color = NamedColor.allCases[i % NamedColor.allCases.count]
                _ = color.description
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `named color comparison 100K times`() {
            let color1 = NamedColor.red
            let color2 = NamedColor.blue
            for _ in 0..<100_000 {
                _ = color1 == color2
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `iterate over all cases 1000 times`() {
            for _ in 0..<1000 {
                for _ in NamedColor.allCases {
                    // Iterate through all cases
                }
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `raw value access 100K times`() {
            for i in 0..<100_000 {
                let color = NamedColor.allCases[i % NamedColor.allCases.count]
                _ = color.rawValue
            }
        }
    }
}
