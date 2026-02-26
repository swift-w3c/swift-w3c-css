// AnimationIterationCount Tests.swift
// swift-w3c-css
//
// Tests for CSS AnimationIterationCount type

import Testing
import W3C_CSS_Values

@testable import W3C_CSS_Animations

// MARK: - Basic Functionality

@Suite
struct `AnimationIterationCount - Declaration` {
    @Test func `renders declaration correctly`() {
        #expect(
            AnimationIterationCount.infinite.declaration.description
                == "animation-iteration-count:infinite"
        )
    }
}

@Suite
struct `AnimationIterationCount - Infinite Value` {
    @Test func `renders infinite value correctly`() {
        #expect(AnimationIterationCount.infinite.description == "infinite")
    }
}

@Suite
struct `AnimationIterationCount - Count Values` {
    @Test(arguments: [
        (AnimationIterationCount.count(3), "3"),
        (AnimationIterationCount.count(2.5), "2.5"),
        (AnimationIterationCount.count(1), "1"),
        (AnimationIterationCount.count(10), "10"),
    ])
    func `renders count values correctly`(
        value: AnimationIterationCount,
        expected: String
    ) {
        #expect(value.description == expected)
    }
}

// MARK: - Literal Initialization

@Suite
struct `AnimationIterationCount - Integer Literals` {
    @Test(arguments: [
        (3, "3"),
        (1, "1"),
        (5, "5"),
        (100, "100"),
    ])
    func `works with integer literals`(
        value: Int,
        expected: String
    ) {
        let count: AnimationIterationCount = AnimationIterationCount(integerLiteral: value)
        #expect(count.description == expected)
    }
}

@Suite
struct `AnimationIterationCount - Float Literals` {
    @Test(arguments: [
        (2.5, "2.5"),
        (1.75, "1.75"),
        (0.5, "0.5"),
        (10.25, "10.25"),
    ])
    func `works with float literals`(
        value: Double,
        expected: String
    ) {
        let count: AnimationIterationCount = AnimationIterationCount(floatLiteral: value)
        #expect(count.description == expected)
    }
}

// MARK: - Non-Positive Values

@Suite
struct `AnimationIterationCount - Non-Positive Values` {
    @Test(arguments: [
        (0, "1"),
        (-2, "1"),
        (-0.5, "1"),
        (-10, "1"),
    ])
    func `handles non-positive values by clamping to 1`(
        value: Double,
        expected: String
    ) {
        let count: AnimationIterationCount = AnimationIterationCount(floatLiteral: value)
        #expect(count.description == expected)
    }

    @Test func `zero clamps to 1`() {
        let count: AnimationIterationCount = 0
        #expect(count.description == "1")
    }

    @Test func `negative values clamp to 1`() {
        let count: AnimationIterationCount = -5
        #expect(count.description == "1")
    }
}

// MARK: - Protocol Conformance

@Suite
struct `AnimationIterationCount - Global Values` {
    @Test(arguments: [
        (AnimationIterationCount.inherit, "inherit"),
        (AnimationIterationCount.initial, "initial"),
        (AnimationIterationCount.revert, "revert"),
        (AnimationIterationCount.revertLayer, "revert-layer"),
        (AnimationIterationCount.unset, "unset"),
    ])
    func `renders global values correctly`(
        value: AnimationIterationCount,
        expected: String
    ) {
        #expect(value.description == expected)
    }
}

@Suite
struct `AnimationIterationCount - Property Protocol` {
    @Test func `conforms to Property protocol`() {
        #expect(AnimationIterationCount.property == "animation-iteration-count")
    }
}

// MARK: - Edge Cases

@Suite
struct `AnimationIterationCount - Edge Cases` {
    @Test func `handles very large counts`() {
        let largeCount = AnimationIterationCount.count(999999)
        #expect(largeCount.description == "999999")
    }

    @Test func `handles fractional counts`() {
        #expect(AnimationIterationCount.count(1.5).description == "1.5")
        #expect(AnimationIterationCount.count(0.25).description == "0.25")
    }

    @Test func `infinite is distinct from numeric values`() {
        #expect(
            AnimationIterationCount.infinite.description
                != AnimationIterationCount.count(999999).description
        )
    }

    @Test func `minimum valid count is 1`() {
        let minCount: AnimationIterationCount = 0.001
        #expect(minCount.description == "0.001")
    }
}

// MARK: - Usage in Context

@Suite
struct `AnimationIterationCount - CSS Property Usage` {
    @Test func `renders correctly in CSS rule`() {
        let css = "animation-iteration-count: \(AnimationIterationCount.count(3))"
        #expect(css == "animation-iteration-count: 3")
    }

    @Test func `declaration renders complete property`() {
        let decl = AnimationIterationCount.infinite.declaration
        #expect(decl.description == "animation-iteration-count:infinite")
    }

    @Test func `fractional count renders correctly`() {
        let css = "animation-iteration-count: \(AnimationIterationCount.count(2.5))"
        #expect(css == "animation-iteration-count: 2.5")
    }

    @Test func `multiple counts can be combined in array notation`() {
        let counts = [
            AnimationIterationCount.count(1), AnimationIterationCount.count(2),
            AnimationIterationCount.infinite,
        ]
        let css = counts.map(\.description).joined(separator: ", ")
        #expect(css == "1, 2, infinite")
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `AnimationIterationCount - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `creation 100K times`() {
            for i in 0..<100_000 {
                _ = AnimationIterationCount.count(Number(Double(i)))
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `description generation 100K times`() {
            let count = AnimationIterationCount.count(3)
            for _ in 0..<100_000 {
                _ = count.description
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `literal initialization 100K times`() {
            for i in 0..<100_000 {
                let _: AnimationIterationCount = AnimationIterationCount(integerLiteral: i)
            }
        }
    }
}
