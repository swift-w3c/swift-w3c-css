// Integer Tests.swift
// swift-w3c-css
//
// Tests for CSS Integer type

import Testing

@testable import W3C_CSS_Values

// MARK: - Basic Functionality

@Suite
struct `Integer - Initialization` {
    @Test(arguments: [
        (42, "42"),
        (-10, "-10"),
        (0, "0"),
        (100, "100"),
        (-50, "-50"),
    ])
    func `integer initializes with correct value and description`(
        value: Int,
        expected: String
    ) {
        let integer = Integer(value)
        #expect(integer.value == value)
        #expect(integer.description == expected)
    }

    @Test func `integer provides static zero constant`() {
        #expect(Integer.zero.value == 0)
        #expect(Integer.zero.description == "0")
    }

    @Test func `integer provides static one constant`() {
        #expect(Integer.one.value == 1)
        #expect(Integer.one.description == "1")
    }
}

@Suite
struct `Integer - Literal Initialization` {
    @Test func `integer supports integer literal initialization`() {
        let literalInt: Integer = 100
        #expect(literalInt.value == 100)
        #expect(literalInt.description == "100")
    }

    @Test func `negative integer literal initializes correctly`() {
        let negativeIntLiteral: Integer = -50
        #expect(negativeIntLiteral.value == -50)
        #expect(negativeIntLiteral.description == "-50")
    }
}

// MARK: - Protocol Conformance

@Suite
struct `Integer - Hashable Conformance` {
    @Test func `equal values are equal`() {
        let int1 = Integer(25)
        let int2 = Integer(25)
        #expect(int1 == int2)
    }

    @Test func `different values are not equal`() {
        let int1 = Integer(25)
        let int3 = Integer(26)
        #expect(int1 != int3)
    }

    @Test func `integer literal equals initialized value`() {
        let int1 = Integer(25)
        let int4: Integer = 25
        #expect(int1 == int4)
    }
}

@Suite
struct `Integer - Comparable Conformance` {
    @Test func `smaller value is less than larger value`() {
        let int1 = Integer(10)
        let int2 = Integer(20)
        #expect(int1 < int2)
        #expect(!(int2 < int1))
    }

    @Test func `equal values are not less than each other`() {
        let int1 = Integer(10)
        let int3 = Integer(10)
        #expect(!(int1 < int3))
        #expect(!(int3 < int1))
    }
}

// MARK: - Arithmetic Operations

@Suite
struct `Integer - Arithmetic` {
    @Test func `addition produces correct result`() {
        let sum = Integer(5) + Integer(10)
        #expect(sum.value == 15)
        #expect(sum == Integer(15))
    }

    @Test func `subtraction produces correct result`() {
        let difference = Integer(20) - Integer(8)
        #expect(difference.value == 12)
        #expect(difference == Integer(12))
    }

    @Test func `negation produces correct result`() {
        let negation = -Integer(7)
        #expect(negation.value == -7)
        #expect(negation == Integer(-7))
    }

    @Test func `absolute value of negative number is positive`() {
        let negative = Integer(-15)
        let abs = negative.absolute
        #expect(abs.value == 15)
        #expect(abs == Integer(15))
    }

    @Test func `absolute value of positive number is unchanged`() {
        let positive = Integer(15)
        let absPositive = positive.absolute
        #expect(absPositive.value == 15)
        #expect(absPositive == positive)
    }
}

// MARK: - Usage in Context

@Suite
struct `Integer - CSS Property Usage` {
    @Test func `integer renders correctly in z-index property`() {
        let zIndex = "z-index: \(Integer(5))"
        #expect(zIndex == "z-index: 5")
    }

    @Test func `negative integer renders correctly in z-index property`() {
        let negativeZIndex = "z-index: \(Integer(-1))"
        #expect(negativeZIndex == "z-index: -1")
    }

    @Test func `integer renders correctly in column-count property`() {
        let columnCount = "column-count: \(Integer(3))"
        #expect(columnCount == "column-count: 3")
    }

    @Test func `integer renders correctly in order property`() {
        let order = "order: \(Integer(2))"
        #expect(order == "order: 2")
    }
}

// MARK: - Edge Cases

@Suite
struct `Integer - Edge Cases` {
    @Test func `maximum integer value`() {
        let maxInt = Integer(Int.max)
        #expect(maxInt.value == Int.max)
        #expect(maxInt.description == "\(Int.max)")
    }

    @Test func `minimum integer value`() {
        let minInt = Integer(Int.min)
        #expect(minInt.value == Int.min)
        #expect(minInt.description == "\(Int.min)")
    }

    @Test func `zero is neither positive nor negative`() {
        let zero = Integer.zero
        #expect(zero.value == 0)
        #expect(zero.absolute == zero)
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `Integer - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `integer creation 100K times`() {
            for i in 0..<100_000 {
                _ = Integer(i)
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `integer arithmetic 100K times`() {
            for i in 0..<100_000 {
                _ = Integer(i) + Integer(i + 1)
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `integer comparison 100K times`() {
            let int1 = Integer(50)
            for i in 0..<100_000 {
                _ = Integer(i) < int1
            }
        }
    }
}
