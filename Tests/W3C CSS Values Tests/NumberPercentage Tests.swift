// NumberPercentage Tests.swift
// swift-w3c-css
//
// Tests for CSS NumberPercentage type

import Testing

@testable import W3C_CSS_Values

// MARK: - Basic Functionality

@Suite
struct `NumberPercentage - Number Values` {
    @Test(arguments: [
        (10, "10"),
        (2.5, "2.5"),
        (0, "0"),
        (42, "42"),
        (3.14, "3.14"),
    ])
    func `number value renders correctly`(
        value: Double,
        expected: String
    ) {
        let number = NumberPercentage.number(Number(value))
        #expect(number.description == expected)
    }
}

@Suite
struct `NumberPercentage - Percentage Values` {
    @Test(arguments: [
        (50, "50%"),
        (75, "75%"),
        (33.333, "33.333%"),
        (100, "100%"),
        (0, "0%"),
    ])
    func `percentage value renders correctly`(
        value: Double,
        expected: String
    ) {
        let percentage = NumberPercentage.percentage(Percentage(value))
        #expect(percentage.description == expected)
    }
}

// MARK: - Literal Conformance

@Suite
struct `NumberPercentage - Integer Literal` {
    @Test func `integer literal creates number`() {
        let intLiteral: NumberPercentage = 42
        #expect(intLiteral.description == "42")
    }

    @Test func `integer literal creates correct case`() {
        let intLiteral: NumberPercentage = 42
        if case .number(let num) = intLiteral {
            #expect(num.value == 42)
        } else {
            #expect(Bool(false), "Should be a number case")
        }
    }
}

@Suite
struct `NumberPercentage - Float Literal` {
    @Test func `float literal creates number`() {
        let floatLiteral: NumberPercentage = 3.14
        #expect(floatLiteral.description == "3.14")
    }

    @Test func `float literal creates correct case`() {
        let floatLiteral: NumberPercentage = 3.14
        if case .number(let num) = floatLiteral {
            #expect(num.value == 3.14)
        } else {
            #expect(Bool(false), "Should be a number case")
        }
    }
}

// MARK: - Protocol Conformance

@Suite
struct `NumberPercentage - Hashable Conformance` {
    @Test func `equal number values are equal`() {
        let num1 = NumberPercentage.number(Number(10))
        let num2 = NumberPercentage.number(Number(10))
        #expect(num1 == num2)
    }

    @Test func `different number values are not equal`() {
        let num1 = NumberPercentage.number(Number(10))
        let num3 = NumberPercentage.number(Number(20))
        #expect(num1 != num3)
    }

    @Test func `equal percentage values are equal`() {
        let percent1 = NumberPercentage.percentage(Percentage(75))
        let percent2 = NumberPercentage.percentage(Percentage(75))
        #expect(percent1 == percent2)
    }

    @Test func `different percentage values are not equal`() {
        let percent1 = NumberPercentage.percentage(Percentage(75))
        let percent3 = NumberPercentage.percentage(Percentage(60))
        #expect(percent1 != percent3)
    }

    @Test func `number and percentage are not equal`() {
        let num1 = NumberPercentage.number(Number(10))
        let percent1 = NumberPercentage.percentage(Percentage(75))
        #expect(num1 != percent1)
    }

    @Test func `literal equals number equivalent`() {
        let literal: NumberPercentage = 10
        let num1 = NumberPercentage.number(Number(10))
        #expect(literal == num1)
    }
}

// MARK: - Convertible Protocols

@Suite
struct `NumberPercentage - Number and Percentage Convertible` {
    @Test func `number convertible works correctly`() {
        let number: NumberPercentage = .number(Number(15))
        #expect(number.description == "15")
    }

    @Test func `percentage convertible works correctly`() {
        let percentage: NumberPercentage = .percentage(Percentage(80))
        #expect(percentage.description == "80%")
    }
}

// MARK: - Usage in Context

@Suite
struct `NumberPercentage - CSS Property Usage` {
    @Test func `number renders correctly in opacity property`() {
        let opacity = "opacity: \(NumberPercentage.number(Number(0.5)))"
        #expect(opacity == "opacity: 0.5")
    }

    @Test func `percentage renders correctly in width property`() {
        let width = "width: \(NumberPercentage.percentage(Percentage(100)))"
        #expect(width == "width: 100%")
    }

    @Test func `number renders correctly in z-index property`() {
        let zIndex = "z-index: \(NumberPercentage.number(Number(10)))"
        #expect(zIndex == "z-index: 10")
    }

    @Test func `percentage renders correctly in transform scale`() {
        let scale = "transform: scale(\(NumberPercentage.percentage(Percentage(120))))"
        #expect(scale == "transform: scale(120%)")
    }
}

// MARK: - Edge Cases

@Suite
struct `NumberPercentage - Edge Cases` {
    @Test func `zero values render correctly`() {
        #expect(NumberPercentage.number(Number(0)).description == "0")
        #expect(NumberPercentage.percentage(Percentage(0)).description == "0%")
    }

    @Test func `negative values render correctly`() {
        #expect(NumberPercentage.number(Number(-10)).description == "-10")
        #expect(NumberPercentage.percentage(Percentage(-25)).description == "-25%")
    }

    @Test func `very small values preserve precision`() {
        #expect(NumberPercentage.number(Number(0.001)).description == "0.001")
        #expect(NumberPercentage.percentage(Percentage(0.1)).description == "0.1%")
    }

    @Test func `very large values render correctly`() {
        #expect(NumberPercentage.number(Number(999999)).description == "999999")
        #expect(NumberPercentage.percentage(Percentage(1000)).description == "1000%")
    }

    @Test func `decimal precision is maintained`() {
        #expect(NumberPercentage.number(Number(10.123456)).description == "10.123456")
        #expect(NumberPercentage.percentage(Percentage(33.333333)).description == "33.333333%")
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `NumberPercentage - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `number percentage creation 100K times`() {
            for i in 0..<100_000 {
                _ = NumberPercentage.number(Number(Double(i)))
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `percentage creation 100K times`() {
            for i in 0..<100_000 {
                _ = NumberPercentage.percentage(Percentage(Double(i)))
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `number percentage comparison 100K times`() {
            let np1 = NumberPercentage.number(Number(50))
            for i in 0..<100_000 {
                _ = NumberPercentage.number(Number(Double(i))) == np1
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `literal creation 100K times`() {
            for i in 0..<100_000 {
                let _: NumberPercentage = NumberPercentage(i)
            }
        }
    }
}
