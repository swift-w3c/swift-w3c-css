// Ratio Tests.swift
// swift-w3c-css
//
// Tests for CSS Ratio type

import Testing

@testable import W3C_CSS_Values

// MARK: - Basic Functionality

@Suite
struct `Ratio - Two Value Initialization` {
    @Test(arguments: [
        (16.0, 9.0, "16 / 9"),
        (185.0, 100.0, "185 / 100"),
        (4.0, 3.0, "4 / 3"),
        (21.0, 9.0, "21 / 9"),
    ])
    func `ratio with two values renders correctly`(
        width: Double,
        height: Double,
        expected: String
    ) throws {
        let ratio = try Ratio(width, height)
        #expect(ratio.description == expected)
        #expect(ratio.width == width)
        #expect(ratio.height == height)
    }

    @Test func `square ratio with height 1 renders as single value`() throws {
        let squareRatio = try Ratio(1, 1)
        #expect(squareRatio.description == "1")
    }
}

@Suite
struct `Ratio - Single Value Initialization` {
    @Test(arguments: [
        (1.5, "1.5"),
        (2.0, "2"),
        (1.78, "1.78"),
    ])
    func `ratio with single value renders correctly`(
        value: Double,
        expected: String
    ) throws {
        let ratio = try Ratio(value)
        #expect(ratio.description == expected)
        #expect(ratio.width == value)
        #expect(ratio.height == 1)
    }
}

// MARK: - Literal Conformance

@Suite
struct `Ratio - Integer Literal` {
    @Test func `integer literal creates ratio`() {
        let intRatio: Ratio = 4
        #expect(intRatio.description == "4")
        #expect(intRatio.width == 4)
        #expect(intRatio.height == 1)
    }
}

@Suite
struct `Ratio - Float Literal` {
    @Test func `float literal creates ratio`() {
        let floatRatio: Ratio = 1.78
        #expect(floatRatio.description == "1.78")
        #expect(floatRatio.width == 1.78)
        #expect(floatRatio.height == 1)
    }
}

// MARK: - Predefined Aspect Ratios

@Suite
struct `Ratio - Predefined Constants` {
    @Test func `square ratio is 1:1`() {
        #expect(Ratio.square.description == "1")
        #expect(Ratio.square.width == 1)
        #expect(Ratio.square.height == 1)
    }

    @Test func `tv ratio is 4:3`() {
        #expect(Ratio.tv.description == "4 / 3")
        #expect(Ratio.tv.width == 4)
        #expect(Ratio.tv.height == 3)
    }

    @Test func `widescreen ratio is 16:9`() {
        #expect(Ratio.widescreen.description == "16 / 9")
        #expect(Ratio.widescreen.width == 16)
        #expect(Ratio.widescreen.height == 9)
    }

    @Test func `ultrawide ratio is 21:9`() {
        #expect(Ratio.ultrawide.description == "21 / 9")
        #expect(Ratio.ultrawide.width == 21)
        #expect(Ratio.ultrawide.height == 9)
    }

    @Test func `movie ratio is 1.85:1`() {
        #expect(Ratio.movie.description == "185 / 100")
        #expect(Ratio.movie.width == 185)
        #expect(Ratio.movie.height == 100)
    }

    @Test func `cinemascope ratio is 2.39:1`() {
        #expect(Ratio.cinemascope.description == "239 / 100")
        #expect(Ratio.cinemascope.width == 239)
        #expect(Ratio.cinemascope.height == 100)
    }
}

// MARK: - Calculated Properties

@Suite
struct `Ratio - Quotient` {
    @Test func `quotient calculates correct value for two-value ratio`() throws {
        let ratio = try Ratio(16, 9)
        #expect(ratio.quotient == 16.0 / 9.0)
    }

    @Test func `quotient returns value for single-value ratio`() throws {
        let singleRatio = try Ratio(1.5)
        #expect(singleRatio.quotient == 1.5)
    }

    @Test func `quotient for predefined ratios`() {
        #expect(Ratio.widescreen.quotient.rounded(toPlaces: 2) == 1.78)
        #expect(Ratio.tv.quotient.rounded(toPlaces: 2) == 1.33)
    }
}

@Suite
struct `Ratio - Inverse` {
    @Test func `inverse swaps width and height`() throws {
        let ratio = try Ratio(16, 9)
        let inverse = ratio.inverse

        #expect(inverse.width == 9)
        #expect(inverse.height == 16)
        #expect(inverse.description == "9 / 16")
    }

    @Test func `double inverse returns original ratio`() throws {
        let ratio = try Ratio(4, 3)
        let doubleInverse = ratio.inverse.inverse

        #expect(doubleInverse.width == ratio.width)
        #expect(doubleInverse.height == ratio.height)
    }
}

@Suite
struct `Ratio - Simplification` {
    @Test func `simplifies ratio with common divisor`() throws {
        let ratio = try Ratio(4, 2)
        let simplified = ratio.simplified()

        #expect(simplified.width == 2)
        #expect(simplified.height == 1)
        #expect(simplified.description == "2")
    }

    @Test func `simplifies larger ratio`() throws {
        let ratio = try Ratio(16, 4)
        let simplified = ratio.simplified()

        #expect(simplified.width == 4)
        #expect(simplified.height == 1)
        #expect(simplified.description == "4")
    }

    @Test func `already simplified ratio remains unchanged`() throws {
        let ratio = try Ratio(16, 9)
        let simplified = ratio.simplified()

        #expect(simplified.width == 16)
        #expect(simplified.height == 9)
    }
}

// MARK: - Protocol Conformance

@Suite
struct `Ratio - Comparable Conformance` {
    @Test func `comparison works correctly based on quotient`() throws {
        let ratio1 = try Ratio(4, 3)  // ~1.33
        let ratio2 = try Ratio(16, 9)  // ~1.78

        #expect(ratio1 < ratio2)
        #expect(ratio2 > ratio1)
        #expect(ratio1 != ratio2)
    }

    @Test func `equal ratios are equal`() throws {
        let ratio1 = try Ratio(4, 3)
        let ratio3 = try Ratio(4, 3)
        #expect(ratio1 == ratio3)
    }
}

// MARK: - Usage in Context

@Suite
struct `Ratio - CSS Property Usage` {
    @Test func `ratio renders correctly in aspect-ratio property`() throws {
        let aspectRatio = try "aspect-ratio: \(Ratio(16, 9))"
        #expect(aspectRatio == "aspect-ratio: 16 / 9")
    }

    @Test func `single value ratio renders in aspect-ratio property`() throws {
        let aspectRatio = try "aspect-ratio: \(Ratio(1.5))"
        #expect(aspectRatio == "aspect-ratio: 1.5")
    }

    @Test func `predefined ratio renders correctly`() {
        let aspectRatio = "aspect-ratio: \(Ratio.widescreen)"
        #expect(aspectRatio == "aspect-ratio: 16 / 9")
    }
}

// MARK: - Edge Cases

@Suite
struct `Ratio - Edge Cases` {
    @Test func `ratio of 1:1 renders as single value`() throws {
        let square = try Ratio(1, 1)
        #expect(square.description == "1")
    }

    @Test func `very wide ratios render correctly`() throws {
        let ultraWide = try Ratio(32, 9)
        #expect(ultraWide.description == "32 / 9")
    }

    @Test func `very tall ratios render correctly`() throws {
        let portrait = try Ratio(9, 16)
        #expect(portrait.description == "9 / 16")
    }

    @Test func `decimal ratios preserve precision`() throws {
        let ratio = try Ratio(1.777777, 1)
        #expect(ratio.description == "1.777777")
    }

    @Test func `whole number decimals render without fractional part`() throws {
        let ratio = try Ratio(2.0, 1.0)
        #expect(ratio.description == "2")
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `Ratio - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `ratio creation 100K times`() throws {
            for i in 0..<100_000 {
                _ = try Ratio(Double(i), 9)
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `ratio comparison 100K times`() throws {
            let ratio1 = Ratio.widescreen
            for i in 0..<100_000 {
                _ = try Ratio(Double(i), 9) < ratio1
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `ratio quotient calculation 100K times`() throws {
            for i in 0..<100_000 {
                let ratio = try Ratio(Double(i), 9)
                _ = ratio.quotient
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `ratio simplification 100K times`() throws {
            for i in 0..<100_000 {
                let ratio = try Ratio(Double(i * 2), Double(i + 1))
                _ = ratio.simplified()
            }
        }
    }
}

// MARK: - Helper Extensions

extension Double {
    func rounded(toPlaces places: Int) -> Double {
        // Compute 10^places using simple multiplication
        var divisor = 1.0
        for _ in 0..<places {
            divisor *= 10.0
        }
        return (self * divisor).rounded() / divisor
    }
}
