// AnimationRangeEnd Tests.swift
// swift-w3c-css
//
// Tests for CSS AnimationRangeEnd type

import Testing
import W3C_CSS_Values

@testable import W3C_CSS_Animations

// MARK: - Basic Functionality

@Suite
struct `AnimationRangeEnd - Declaration` {
    @Test func `renders declaration correctly`() {
        #expect(AnimationRangeEnd.normal.declaration.description == "animation-range-end:normal")
    }
}

@Suite
struct `AnimationRangeEnd - Normal Value` {
    @Test func `renders normal value correctly`() {
        #expect(AnimationRangeEnd.normal.description == "normal")
    }
}

@Suite
struct `AnimationRangeEnd - Named Range Values` {
    @Test(arguments: [
        (AnimationRangeEnd.namedRange(.cover), "cover"),
        (AnimationRangeEnd.namedRange(.contain), "contain"),
        (AnimationRangeEnd.namedRange(.entry), "entry"),
        (AnimationRangeEnd.namedRange(.exit), "exit"),
        (AnimationRangeEnd.namedRange(.entryCrossing), "entry-crossing"),
        (AnimationRangeEnd.namedRange(.exitCrossing), "exit-crossing"),
    ])
    func `renders named range values correctly`(
        value: AnimationRangeEnd,
        expected: String
    ) {
        #expect(value.description == expected)
    }
}

@Suite
struct `AnimationRangeEnd - Percentage Values` {
    @Test(arguments: [
        (AnimationRangeEnd.percentage(75), "75%"),
        (AnimationRangeEnd.percentage(100), "100%"),
        (AnimationRangeEnd.percentage(50), "50%"),
        (AnimationRangeEnd.percentage(0), "0%"),
    ])
    func `renders percentage values correctly`(
        value: AnimationRangeEnd,
        expected: String
    ) {
        #expect(value.description == expected)
    }
}

@Suite
struct `AnimationRangeEnd - Named Range with Percentage` {
    @Test(arguments: [
        (AnimationRangeEnd.namedRange(.exit, 75), "exit 75%"),
        (AnimationRangeEnd.namedRange(.contain, 90), "contain 90%"),
        (AnimationRangeEnd.namedRange(.cover, 100), "cover 100%"),
    ])
    func `renders named range with percentage values correctly`(
        value: AnimationRangeEnd,
        expected: String
    ) {
        #expect(value.description == expected)
    }
}

// MARK: - Protocol Conformance

@Suite
struct `AnimationRangeEnd - Global Values` {
    @Test(arguments: [
        (AnimationRangeEnd.inherit, "inherit"),
        (AnimationRangeEnd.initial, "initial"),
        (AnimationRangeEnd.revert, "revert"),
        (AnimationRangeEnd.revertLayer, "revert-layer"),
        (AnimationRangeEnd.unset, "unset"),
    ])
    func `renders global values correctly`(
        value: AnimationRangeEnd,
        expected: String
    ) {
        #expect(value.description == expected)
    }
}

@Suite
struct `AnimationRangeEnd - Property Protocol` {
    @Test func `conforms to Property protocol`() {
        #expect(AnimationRangeEnd.property == "animation-range-end")
    }
}

// MARK: - Edge Cases

@Suite
struct `AnimationRangeEnd - Edge Cases` {
    @Test func `named ranges with hyphens render correctly`() {
        #expect(AnimationRangeEnd.namedRange(.entryCrossing).description == "entry-crossing")
        #expect(AnimationRangeEnd.namedRange(.exitCrossing).description == "exit-crossing")
    }

    @Test func `percentage values can be 0 or 100`() {
        #expect(AnimationRangeEnd.percentage(0).description == "0%")
        #expect(AnimationRangeEnd.percentage(100).description == "100%")
    }

    @Test func `fractional percentages render correctly`() {
        #expect(AnimationRangeEnd.percentage(75.5).description == "75.5%")
        #expect(AnimationRangeEnd.percentage(99.99).description == "99.99%")
    }

    @Test func `exit range is commonly used for end`() {
        let end = AnimationRangeEnd.namedRange(.exit)
        #expect(end.description == "exit")
    }
}

// MARK: - Usage in Context

@Suite
struct `AnimationRangeEnd - CSS Property Usage` {
    @Test func `renders correctly in CSS rule`() {
        let css = "animation-range-end: \(AnimationRangeEnd.namedRange(.exit))"
        #expect(css == "animation-range-end: exit")
    }

    @Test func `declaration renders complete property`() {
        let decl = AnimationRangeEnd.percentage(100).declaration
        #expect(decl.description == "animation-range-end:100%")
    }

    @Test func `complex end value renders correctly`() {
        let css = "animation-range-end: \(AnimationRangeEnd.namedRange(.exit, 90))"
        #expect(css == "animation-range-end: exit 90%")
    }
}

// MARK: - Semantic Validation

@Suite
struct `AnimationRangeEnd - Semantic Validation` {
    @Test func `normal represents default end`() {
        let end = AnimationRangeEnd.normal
        #expect(end.description == "normal")
    }

    @Test func `exit represents exit phase end`() {
        let end = AnimationRangeEnd.namedRange(.exit)
        #expect(end.description == "exit")
    }

    @Test func `100 percent represents full completion`() {
        let end = AnimationRangeEnd.percentage(100)
        #expect(end.description == "100%")
    }

    @Test func `named range with percentage provides precise control`() {
        let end = AnimationRangeEnd.namedRange(.exit, 75)
        #expect(end.description == "exit 75%")
    }
}

// MARK: - Interaction with AnimationRangeStart

@Suite
struct `AnimationRangeEnd - Interaction with AnimationRangeStart` {
    @Test func `end follows start in animation timeline`() {
        let start = AnimationRangeStart.namedRange(.entry)
        let end = AnimationRangeEnd.namedRange(.exit)

        #expect(start.description == "entry")
        #expect(end.description == "exit")
    }

    @Test func `percentage-based start and end create bounded range`() {
        let start = AnimationRangeStart.percentage(25)
        let end = AnimationRangeEnd.percentage(75)

        #expect(start.description == "25%")
        #expect(end.description == "75%")
    }

    @Test func `named ranges can be combined with percentages`() {
        let start = AnimationRangeStart.namedRange(.entry, 10)
        let end = AnimationRangeEnd.namedRange(.exit, 90)

        #expect(start.description == "entry 10%")
        #expect(end.description == "exit 90%")
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `AnimationRangeEnd - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `creation 100K times`() {
            for i in 0..<100_000 {
                _ = AnimationRangeEnd.percentage(Percentage(Double(i % 100)))
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `description generation 100K times`() {
            let end = AnimationRangeEnd.namedRange(.exit)
            for _ in 0..<100_000 {
                _ = end.description
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `named range with percentage creation 100K times`() {
            for i in 0..<100_000 {
                _ = AnimationRangeEnd.namedRange(.exit, Percentage(50 + Double(i % 50)))
            }
        }
    }
}
