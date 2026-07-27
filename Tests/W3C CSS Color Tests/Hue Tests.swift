// Hue Tests.swift
// swift-w3c-css
//
// Tests for CSS Hue type

import Testing
import W3C_CSS_Values

@testable import W3C_CSS_Color

// MARK: - Number Hue

@Suite
struct `Hue - Number Format` {
    @Test(arguments: [
        (Number(120), "120"),
        (Number(240.5), "240.5"),
        (Number(0), "0"),
        (Number(360), "360"),
    ])
    func `hue with number renders correctly`(
        value: Number,
        expected: String
    ) {
        let hue = Hue.number(value)
        #expect(hue.description == expected)
    }
}

// MARK: - Angle Hue

@Suite
struct `Hue - Angle Format` {
    @Test(arguments: [
        (Angle.deg(120), "120deg"),
        (Angle.turn(0.5), "0.5turn"),
        (Angle.rad(3.14159), "3.14159rad"),
        (Angle.grad(100), "100grad"),
    ])
    func `hue with angle renders correctly`(
        angle: Angle,
        expected: String
    ) {
        let hue = Hue.angle(angle)
        #expect(hue.description == expected)
    }
}

// MARK: - Normalization

@Suite
struct `Hue - Normalization` {
    @Test(arguments: [
        (Hue.angle(.deg(120)), 120.0),
        (Hue.number(Number(240)), 240.0),
        (Hue.angle(.deg(0)), 0.0),
        (Hue.angle(.deg(360)), 0.0),
    ])
    func `basic hue normalization`(
        hue: Hue,
        expected: Double
    ) {
        #expect(hue.normalizedDegrees() == expected)
    }

    @Test(arguments: [
        (Hue.angle(.deg(420)), 60.0),
        (Hue.number(Number(540)), 180.0),
        (Hue.angle(.deg(720)), 0.0),
    ])
    func `hue over 360 wraps around`(
        hue: Hue,
        expected: Double
    ) {
        #expect(hue.normalizedDegrees() == expected)
    }

    @Test(arguments: [
        (Hue.angle(.deg(-120)), 240.0),
        (Hue.number(Number(-90)), 270.0),
        (Hue.angle(.deg(-360)), 0.0),
    ])
    func `negative hue wraps around`(
        hue: Hue,
        expected: Double
    ) {
        #expect(hue.normalizedDegrees() == expected)
    }
}

@Suite
struct `Hue - Angle Unit Normalization` {
    @Test func `turn to degrees normalization`() {
        #expect(Hue.angle(.turn(0.25)).normalizedDegrees() == 90)
        #expect(Hue.angle(.turn(1.5)).normalizedDegrees() == 180)
    }

    @Test func `radian to degrees normalization`() {
        #expect(Hue.angle(.rad(.pi)).normalizedDegrees() == 180)
    }

    @Test func `grad to degrees normalization`() {
        #expect(Hue.angle(.grad(400)).normalizedDegrees() == 0)
    }
}

// MARK: - Protocol Conformance

@Suite
struct `Hue - Hashable Conformance` {
    @Test func `equal number hues are equal`() {
        #expect(Hue.number(Number(120)) == Hue.number(Number(120)))
    }

    @Test func `equal angle hues are equal`() {
        #expect(Hue.angle(.deg(240)) == Hue.angle(.deg(240)))
    }

    @Test func `different number values are not equal`() {
        #expect(Hue.number(Number(120)) != Hue.number(Number(180)))
    }

    @Test func `different angle values are not equal`() {
        #expect(Hue.angle(.deg(120)) != Hue.angle(.deg(240)))
    }

    @Test func `number and angle types are not equal`() {
        #expect(Hue.number(Number(120)) != Hue.angle(.deg(120)))
    }

    @Test func `different angle units are not equal`() {
        #expect(Hue.angle(.deg(180)) != Hue.angle(.turn(0.5)))
    }
}

// MARK: - Usage in Color Functions

@Suite
struct `Hue - Color Function Usage` {
    @Test(arguments: [
        (Hue.angle(.deg(120)), "hsl(120deg, 100%, 50%)"),
        (Hue.angle(.turn(0.25)), "hwb(0.25turn 20% 0%)"),
        (Hue.number(Number(240)), "lch(50% 50 240)"),
    ])
    func `hue is used correctly in color function context`(
        hue: Hue,
        expected: String
    ) {
        let hslResult = "hsl(\(hue), 100%, 50%)"
        let hwbResult = "hwb(\(hue) 20% 0%)"
        let lchResult = "lch(50% 50 \(hue))"

        // Check if any match the expected format
        let results = [hslResult, hwbResult, lchResult]
        #expect(results.contains(expected))
    }
}

// MARK: - Edge Cases

@Suite
struct `Hue - Edge Cases` {
    @Test func `zero hue with number`() {
        #expect(Hue.number(Number(0)).description == "0")
    }

    @Test func `zero hue with degrees`() {
        #expect(Hue.angle(.deg(0)).description == "0deg")
    }

    @Test func `maximum standard hue`() {
        #expect(Hue.number(Number(360)).description == "360")
    }

    @Test func `very large hue value normalizes`() {
        let largeHue = Hue.number(Number(1080))
        #expect(largeHue.normalizedDegrees() == 0)
    }

    @Test func `very negative hue value normalizes`() {
        let negativeHue = Hue.angle(.deg(-720))
        #expect(negativeHue.normalizedDegrees() == 0)
    }

    @Test func `fractional degree values`() {
        #expect(Hue.angle(.deg(120.5)).description == "120.5deg")
    }

    @Test func `fractional number values`() {
        #expect(Hue.number(Number(240.75)).description == "240.75")
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `Hue - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `hue creation with number 100K times`() {
            for i in 0..<100_000 {
                let value = Double(i % 360)
                _ = Hue.number(Number(value))
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `hue creation with degrees 100K times`() {
            for i in 0..<100_000 {
                let value = Double(i % 360)
                _ = Hue.angle(.deg(value))
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `hue normalization 100K times`() {
            let hue = Hue.angle(.deg(420))
            for _ in 0..<100_000 {
                _ = hue.normalizedDegrees()
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `hue comparison 100K times`() {
            let hue1 = Hue.number(Number(120))
            let hue2 = Hue.angle(.deg(240))
            for _ in 0..<100_000 {
                _ = hue1 == hue2
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `hue description access 100K times`() {
            for i in 0..<100_000 {
                let value = Double(i % 360)
                let hue = Hue.angle(.deg(value))
                _ = hue.description
            }
        }
    }
}
