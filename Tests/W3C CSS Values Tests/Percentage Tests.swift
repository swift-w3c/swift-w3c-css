// Percentage Tests.swift
// swift-w3c-css
//
// Tests for CSS Percentage type

import Testing

@testable import W3C_CSS_Values

// MARK: - Basic Functionality

@Suite
struct `Percentage - Initialization` {
    @Test(arguments: [
        (50.0, "50%"),
        (0.0, "0%"),
        (-10.0, "-10%"),
        (33.3, "33.3%"),
        (0.5, "0.5%"),
        (-12.5, "-12.5%"),
        (75.0, "75%"),
    ])
    func `percentage initializes with correct value and description`(
        value: Double,
        expected: String
    ) {
        let percentage = Percentage(value)
        #expect(percentage.description == expected)
        #expect(percentage.value == value)
    }

    @Test func `percentage provides zero constant`() {
        #expect(Percentage.zero.description == "0%")
        #expect(Percentage.zero.value == 0)
    }

    @Test func `percentage provides half constant`() {
        #expect(Percentage.half.description == "50%")
        #expect(Percentage.half.value == 50)
    }

    @Test func `percentage provides full constant`() {
        #expect(Percentage.full.description == "100%")
        #expect(Percentage.full.value == 100)
    }
}

// MARK: - Literal Conformance

@Suite
struct `Percentage - Integer Literal` {
    @Test func `integer literal creates percentage`() {
        let percentage: Percentage = 75
        #expect(percentage.description == "75%")
        #expect(percentage.value == 75)
    }
}

@Suite
struct `Percentage - Float Literal` {
    @Test func `float literal creates percentage`() {
        let percentage: Percentage = 42.5
        #expect(percentage.description == "42.5%")
        #expect(percentage.value == 42.5)
    }
}

// MARK: - Protocol Conformance

@Suite
struct `Percentage - Comparable Conformance` {
    @Test func `smaller value is less than larger value`() {
        #expect(Percentage(25) < Percentage(50))
        #expect(Percentage(33.3) < Percentage(33.4))
    }

    @Test func `larger value is greater than smaller value`() {
        #expect(Percentage(75) > Percentage(50))
    }

    @Test func `equal values are not less than each other`() {
        #expect(!(Percentage(50) < Percentage(50)))
    }
}

// MARK: - Arithmetic Operations

@Suite
struct `Percentage - Addition` {
    @Test func `addition with integer percentages`() {
        #expect((Percentage(25) + Percentage(25)).description == "50%")
    }

    @Test func `addition with decimal percentages`() {
        #expect((Percentage(33.3) + Percentage(33.3)).description == "66.6%")
    }
}

@Suite
struct `Percentage - Subtraction` {
    @Test func `subtraction with integer percentages`() {
        #expect((Percentage(75) - Percentage(25)).description == "50%")
    }

    @Test func `subtraction with decimal percentages`() {
        #expect((Percentage(100) - Percentage(33.3)).description == "66.7%")
    }
}

@Suite
struct `Percentage - Multiplication` {
    @Test func `multiplication by integer`() {
        #expect((Percentage(50) * 2).description == "100%")
    }

    @Test func `multiplication by decimal`() {
        #expect((Percentage(25) * 0.5).description == "12.5%")
    }
}

@Suite
struct `Percentage - Division` {
    @Test func `division by integer`() {
        #expect((Percentage(100) / 2).description == "50%")
        #expect((Percentage(25) / 5).description == "5%")
    }
}

// MARK: - Special Methods

@Suite
struct `Percentage - Fraction Method` {
    @Test(arguments: [
        (100.0, 0.5, "50%"),
        (100.0, 0.25, "25%"),
        (100.0, 1.5, "150%"),
        (50.0, 0.5, "25%"),
    ])
    func `fraction method calculates correctly`(
        base: Double,
        fraction: Double,
        expected: String
    ) {
        let percentage = Percentage(base)
        #expect(percentage.fraction(fraction).description == expected)
    }
}

// MARK: - Numeric Extensions

@Suite
struct `Percentage - Int Extensions` {
    @Test func `int percentage extension creates correct percentage`() {
        #expect(50.percentage.description == "50%")
        #expect(50.percent.description == "50%")
    }
}

@Suite
struct `Percentage - Double Extensions` {
    @Test func `double percentage extension creates correct percentage`() {
        #expect(33.3.percentage.description == "33.3%")
        #expect(33.3.percent.description == "33.3%")
    }
}

// MARK: - Usage in Context

@Suite
struct `Percentage - CSS Property Usage` {
    @Test func `percentage renders correctly in width property`() {
        let width = "width: \(Percentage(50))"
        #expect(width == "width: 50%")
    }

    @Test func `percentage renders correctly in margin property`() {
        let margin = "margin-left: \(Percentage(20))"
        #expect(margin == "margin-left: 20%")
    }

    @Test func `percentage renders correctly in font-size property`() {
        let fontSize = "font-size: \(Percentage(150))"
        #expect(fontSize == "font-size: 150%")
    }
}

// MARK: - Edge Cases

@Suite
struct `Percentage - Edge Cases` {
    @Test func `zero percentage renders correctly`() {
        #expect(Percentage(0).description == "0%")
        #expect(Percentage.zero.description == "0%")
    }

    @Test func `negative percentages render correctly`() {
        #expect(Percentage(-10).description == "-10%")
        #expect(Percentage(-50.5).description == "-50.5%")
    }

    @Test func `very small percentages preserve precision`() {
        #expect(Percentage(0.001).description == "0.001%")
        #expect(Percentage(0.0001).description == "0.0001%")
    }

    @Test func `very large percentages render correctly`() {
        #expect(Percentage(1000).description == "1000%")
        #expect(Percentage(9999.99).description == "9999.99%")
    }

    @Test func `percentages over 100 are valid`() {
        #expect(Percentage(150).description == "150%")
        #expect(Percentage(200).description == "200%")
    }

    @Test func `whole number decimals render without fractional part`() {
        #expect(Percentage(75.0).description == "75%")
        #expect(Percentage(100.0).description == "100%")
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `Percentage - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `percentage creation 100K times`() {
            for i in 0..<100_000 {
                _ = Percentage(Double(i))
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `percentage arithmetic 100K times`() {
            for i in 0..<100_000 {
                _ = Percentage(Double(i)) + Percentage(Double(i + 1))
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `percentage comparison 100K times`() {
            let p1 = Percentage(50)
            for i in 0..<100_000 {
                _ = Percentage(Double(i)) < p1
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `percentage extension 100K times`() {
            for i in 0..<100_000 {
                _ = Double(i).percent
            }
        }
    }
}
