// Number Tests.swift
// swift-w3c-css
//
// Tests for CSS Number type

import Testing

@testable import W3C_CSS_Values

// MARK: - Basic Functionality

@Suite
struct `Number - Initialization` {
    @Test(arguments: [
        (5.0, "5"),
        (0.0, "0"),
        (-10.0, "-10"),
        (3.5, "3.5"),
        (0.25, "0.25"),
        (-1.75, "-1.75"),
        (2.0, "2"),
    ])
    func `number initializes with correct value and description`(
        value: Double,
        expected: String
    ) {
        let number = Number(value)
        #expect(number.description == expected)
        #expect(number.value == value)
    }

    @Test func `number provides static zero constant`() {
        #expect(Number.zero.description == "0")
        #expect(Number.zero.value == 0)
    }

    @Test func `number provides static one constant`() {
        #expect(Number.one.description == "1")
        #expect(Number.one.value == 1)
    }
}

// MARK: - Literal Conformance

@Suite
struct `Number - Integer Literal` {
    @Test func `integer literal creates number`() {
        let number: Number = 42
        #expect(number.description == "42")
        #expect(number.value == 42)
    }

    @Test func `negative integer literal creates number`() {
        let number: Number = -10
        #expect(number.description == "-10")
        #expect(number.value == -10)
    }
}

@Suite
struct `Number - Float Literal` {
    @Test func `float literal creates number`() {
        let number: Number = 3.14
        #expect(number.description == "3.14")
        #expect(number.value == 3.14)
    }

    @Test func `negative float literal creates number`() {
        let number: Number = -2.5
        #expect(number.description == "-2.5")
        #expect(number.value == -2.5)
    }
}

// MARK: - Protocol Conformance

@Suite
struct `Number - Comparable Conformance` {
    @Test func `smaller value is less than larger value`() {
        #expect(Number(5) < Number(10))
        #expect(Number(3.5) < Number(4))
    }

    @Test func `larger value is greater than smaller value`() {
        #expect(Number(10) > Number(5))
    }

    @Test func `equal values are not less than each other`() {
        #expect(!(Number(5) < Number(5)))
    }
}

// MARK: - Arithmetic Operations

@Suite
struct `Number - Addition` {
    @Test func `addition with integer numbers`() {
        let sum = Number(5) + Number(10)
        #expect(sum.description == "15")
        #expect(sum.value == 15)
    }

    @Test func `addition with decimal numbers`() {
        let sum = Number(2.5) + Number(3.5)
        #expect(sum.description == "6")
        #expect(sum.value == 6)
    }
}

@Suite
struct `Number - Subtraction` {
    @Test func `subtraction with integer numbers`() {
        let diff = Number(10) - Number(5)
        #expect(diff.description == "5")
        #expect(diff.value == 5)
    }

    @Test func `subtraction with decimal numbers`() {
        let diff = Number(5.5) - Number(2.5)
        #expect(diff.description == "3")
        #expect(diff.value == 3)
    }
}

@Suite
struct `Number - Multiplication` {
    @Test func `multiplication with integer numbers`() {
        let product = Number(5) * Number(2)
        #expect(product.description == "10")
        #expect(product.value == 10)
    }

    @Test func `multiplication with decimal numbers`() {
        let product = Number(2.5) * Number(2)
        #expect(product.description == "5")
        #expect(product.value == 5)
    }
}

@Suite
struct `Number - Division` {
    @Test func `division with integer numbers`() {
        let quotient = Number(10) / Number(2)
        #expect(quotient.description == "5")
        #expect(quotient.value == 5)
    }

    @Test func `division with decimal numbers`() {
        let quotient = Number(5) / Number(2)
        #expect(quotient.description == "2.5")
        #expect(quotient.value == 2.5)
    }
}

@Suite
struct `Number - Negation` {
    @Test func `negation produces correct result`() {
        let negative = -Number(5)
        #expect(negative.description == "-5")
        #expect(negative.value == -5)
    }

    @Test func `double negation returns positive`() {
        let positive = -Number(-3)
        #expect(positive.description == "3")
        #expect(positive.value == 3)
    }
}

// MARK: - Manipulation Methods

@Suite
struct `Number - Absolute Value` {
    @Test func `absolute value of positive number is unchanged`() {
        let abs = Number(5).absolute
        #expect(abs.description == "5")
        #expect(abs.value == 5)
    }

    @Test func `absolute value of negative number is positive`() {
        let abs = Number(-5).absolute
        #expect(abs.description == "5")
        #expect(abs.value == 5)
    }
}

@Suite
struct `Number - Rounding` {
    @Test(arguments: [
        (3.2, "3"),
        (3.8, "4"),
        (-2.7, "-3"),
    ])
    func `rounded returns nearest integer`(
        value: Double,
        expected: String
    ) {
        let rounded = Number(value).rounded
        #expect(rounded.description == expected)
    }
}

@Suite
struct `Number - Floor` {
    @Test(arguments: [
        (3.2, "3"),
        (3.8, "3"),
        (-2.2, "-3"),
    ])
    func `floor returns largest integer less than or equal to number`(
        value: Double,
        expected: String
    ) {
        let floor = Number(value).floor
        #expect(floor.description == expected)
    }
}

@Suite
struct `Number - Ceiling` {
    @Test(arguments: [
        (3.2, "4"),
        (3.8, "4"),
        (-2.7, "-2"),
    ])
    func `ceil returns smallest integer greater than or equal to number`(
        value: Double,
        expected: String
    ) {
        let ceil = Number(value).ceil
        #expect(ceil.description == expected)
    }
}

// MARK: - Usage in Context

@Suite
struct `Number - CSS Property Usage` {
    @Test func `number renders correctly in opacity property`() {
        let opacity = "opacity: \(Number(0.5))"
        #expect(opacity == "opacity: 0.5")
    }

    @Test func `number renders correctly in line-height property`() {
        let lineHeight = "line-height: \(Number(1.2))"
        #expect(lineHeight == "line-height: 1.2")
    }

    @Test func `number renders correctly in animation-iteration-count property`() {
        let iterations = "animation-iteration-count: \(Number(3))"
        #expect(iterations == "animation-iteration-count: 3")
    }
}

// MARK: - Edge Cases

@Suite
struct `Number - Edge Cases` {
    @Test func `zero renders correctly`() {
        #expect(Number(0).description == "0")
        #expect(Number.zero.description == "0")
    }

    @Test func `negative numbers render correctly`() {
        #expect(Number(-10).description == "-10")
        #expect(Number(-0.5).description == "-0.5")
    }

    @Test func `very small numbers preserve precision`() {
        #expect(Number(0.001).description == "0.001")
        #expect(Number(0.0001).description == "0.0001")
    }

    @Test func `very large numbers render correctly`() {
        #expect(Number(999999).description == "999999")
        #expect(Number(1_000_000).description == "1000000")
    }

    @Test func `whole number decimals render without fractional part`() {
        #expect(Number(5.0).description == "5")
        #expect(Number(100.0).description == "100")
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `Number - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `number creation 100K times`() {
            for i in 0..<100_000 {
                _ = Number(Double(i))
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `number arithmetic 100K times`() {
            for i in 0..<100_000 {
                _ = Number(Double(i)) + Number(Double(i + 1))
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `number comparison 100K times`() {
            let n1 = Number(50)
            for i in 0..<100_000 {
                _ = Number(Double(i)) < n1
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `number manipulation 100K times`() {
            for i in 0..<100_000 {
                _ = Number(Double(i)).absolute
            }
        }
    }
}
