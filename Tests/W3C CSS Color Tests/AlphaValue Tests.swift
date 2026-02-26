// AlphaValue Tests.swift
// swift-w3c-css
//
// Tests for CSS AlphaValue type

import Testing
import W3C_CSS_Values

@testable import W3C_CSS_Color

// MARK: - Number Values

@Suite
struct `AlphaValue - Number Format` {
    @Test(arguments: [
        (0, "0"),
        (0.5, "0.5"),
        (1, "1"),
        (1.5, "1.5"),
        (-0.2, "-0.2"),
    ])
    func `number alpha values render correctly`(
        value: Double,
        expected: String
    ) {
        let alpha = AlphaValue.number(Number(value))
        #expect(alpha.description == expected)
    }
}

// MARK: - Percentage Values

@Suite
struct `AlphaValue - Percentage Format` {
    @Test(arguments: [
        (0, "0%"),
        (50, "50%"),
        (100, "100%"),
        (33.33, "33.33%"),
        (120, "120%"),
        (-10, "-10%"),
    ])
    func `percentage alpha values render correctly`(
        value: Double,
        expected: String
    ) {
        let alpha = AlphaValue.percentage(Percentage(value))
        #expect(alpha.description == expected)
    }
}

// MARK: - Literal Conversion

@Suite
struct `AlphaValue - Integer Literal Conversion` {
    @Test(arguments: [
        (0, 0.0),
        (1, 1.0),
    ])
    func `integer literal conversion works correctly`(
        literal: Int,
        expectedValue: Double
    ) {
        let transparent: AlphaValue = 0
        let opaque: AlphaValue = 1

        let alpha = literal == 0 ? transparent : opaque

        if case .number(let value) = alpha {
            #expect(value.value == expectedValue)
        } else {
            #expect(Bool(false), "Expected .number case")
        }
    }

    @Test func `integer literal creates number case`() {
        let alpha: AlphaValue = 1
        if case .number = alpha {
            // Success
        } else {
            #expect(Bool(false), "Expected .number case")
        }
    }
}

@Suite
struct `AlphaValue - Float Literal Conversion` {
    @Test(arguments: [
        (0.5, 0.5),
        (0.95, 0.95),
    ])
    func `float literal conversion works correctly`(
        literal: Double,
        expectedValue: Double
    ) {
        let alpha: AlphaValue = 0.5
        let almostOpaque: AlphaValue = 0.95

        let testAlpha = literal == 0.5 ? alpha : almostOpaque

        if case .number(let value) = testAlpha {
            #expect(value.value == expectedValue)
        } else {
            #expect(Bool(false), "Expected .number case")
        }
    }

    @Test func `float literal creates number case`() {
        let alpha: AlphaValue = 0.5
        if case .number = alpha {
            // Success
        } else {
            #expect(Bool(false), "Expected .number case")
        }
    }
}

// MARK: - Protocol Conformance

@Suite
struct `AlphaValue - Hashable Conformance` {
    @Test func `equal number values are equal`() {
        let number1 = AlphaValue.number(0.5)
        let number2 = AlphaValue.number(0.5)
        #expect(number1 == number2)
    }

    @Test func `different number values are not equal`() {
        let number1 = AlphaValue.number(0.5)
        let number3 = AlphaValue.number(0.7)
        #expect(number1 != number3)
    }

    @Test func `equal percentage values are equal`() {
        let percent1 = AlphaValue.percentage(50)
        let percent2 = AlphaValue.percentage(50)
        #expect(percent1 == percent2)
    }

    @Test func `different percentage values are not equal`() {
        let percent1 = AlphaValue.percentage(50)
        let percent3 = AlphaValue.percentage(70)
        #expect(percent1 != percent3)
    }

    @Test func `equivalent number and percentage are not equal`() {
        let number = AlphaValue.number(0.5)
        let percent = AlphaValue.percentage(50)
        #expect(number != percent)
    }
}

// MARK: - Edge Cases

@Suite
struct `AlphaValue - Edge Cases` {
    @Test func `zero as number`() {
        let alpha = AlphaValue.number(0)
        #expect(alpha.description == "0")
    }

    @Test func `one as number`() {
        let alpha = AlphaValue.number(1)
        #expect(alpha.description == "1")
    }

    @Test func `zero as percentage`() {
        let alpha = AlphaValue.percentage(0)
        #expect(alpha.description == "0%")
    }

    @Test func `one hundred as percentage`() {
        let alpha = AlphaValue.percentage(100)
        #expect(alpha.description == "100%")
    }

    @Test func `values over 1 are not clamped in output`() {
        let alpha = AlphaValue.number(1.5)
        #expect(alpha.description == "1.5")
    }

    @Test func `negative values are not clamped in output`() {
        let alpha = AlphaValue.number(-0.2)
        #expect(alpha.description == "-0.2")
    }

    @Test func `percentages over 100 are not clamped in output`() {
        let alpha = AlphaValue.percentage(120)
        #expect(alpha.description == "120%")
    }

    @Test func `negative percentages are not clamped in output`() {
        let alpha = AlphaValue.percentage(-10)
        #expect(alpha.description == "-10%")
    }

    @Test func `very small number values`() {
        let alpha = AlphaValue.number(0.001)
        #expect(alpha.description == "0.001")
    }

    @Test func `very precise percentage values`() {
        let alpha = AlphaValue.percentage(33.333333)
        #expect(alpha.description == "33.333333%")
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `AlphaValue - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `alpha value creation with number 100K times`() {
            for i in 0..<100_000 {
                let value = Double(i % 100) / 100.0
                _ = AlphaValue.number(Number(value))
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `alpha value creation with percentage 100K times`() {
            for i in 0..<100_000 {
                let value = Double(i % 100)
                _ = AlphaValue.percentage(Percentage(value))
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `alpha value comparison 100K times`() {
            let alpha1 = AlphaValue.number(0.5)
            let alpha2 = AlphaValue.percentage(50)
            for _ in 0..<100_000 {
                _ = alpha1 == alpha2
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `alpha value description access 100K times`() {
            for i in 0..<100_000 {
                let value = Double(i % 100) / 100.0
                let alpha = AlphaValue.number(Number(value))
                _ = alpha.description
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `alpha value literal conversion 100K times`() {
            for i in 0..<100_000 {
                let value = Double(i % 100) / 100.0
                let alpha: AlphaValue = AlphaValue.number(Number(value))
                _ = alpha
            }
        }
    }
}
