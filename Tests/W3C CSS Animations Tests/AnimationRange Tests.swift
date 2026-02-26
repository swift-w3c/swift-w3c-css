// AnimationRange Tests.swift
// swift-w3c-css
//
// Tests for CSS AnimationRange type

import Testing
import W3C_CSS_Values

@testable import W3C_CSS_Animations

// MARK: - Basic Functionality

@Suite
struct `AnimationRange - Declaration` {
    @Test func `renders declaration correctly`() {
        #expect(AnimationRange.normal.declaration.description == "animation-range:normal")
    }
}

@Suite
struct `AnimationRange - Normal Value` {
    @Test(arguments: [
        (AnimationRange.normal, "normal"),
        (AnimationRange.single(.normal), "normal"),
    ])
    func `renders normal value correctly`(
        value: AnimationRange,
        expected: String
    ) {
        #expect(value.description == expected)
    }
}

@Suite
struct `AnimationRange - Named Range Values` {
    @Test(arguments: [
        (AnimationRange.namedRange(.cover), "cover"),
        (AnimationRange.namedRange(.contain), "contain"),
        (AnimationRange.namedRange(.entry), "entry"),
        (AnimationRange.namedRange(.exit), "exit"),
        (AnimationRange.namedRange(.entryCrossing), "entry-crossing"),
        (AnimationRange.namedRange(.exitCrossing), "exit-crossing"),
    ])
    func `renders named range values correctly`(
        value: AnimationRange,
        expected: String
    ) {
        #expect(value.description == expected)
    }
}

@Suite
struct `AnimationRange - Percentage Values` {
    @Test(arguments: [
        (AnimationRange.percentage(20), "20%"),
        (AnimationRange.single(.percentage(50)), "50%"),
        (AnimationRange.percentage(0), "0%"),
        (AnimationRange.percentage(100), "100%"),
    ])
    func `renders percentage values correctly`(
        value: AnimationRange,
        expected: String
    ) {
        #expect(value.description == expected)
    }
}

@Suite
struct `AnimationRange - Named Range with Percentage` {
    @Test(arguments: [
        (AnimationRange.single(.namedRange(.entry, 10)), "entry 10%"),
        (AnimationRange.single(.namedRange(.contain, 75)), "contain 75%"),
        (AnimationRange.single(.namedRange(.exit, 50)), "exit 50%"),
    ])
    func `renders named range with percentage values correctly`(
        value: AnimationRange,
        expected: String
    ) {
        #expect(value.description == expected)
    }
}

// MARK: - Start-End Range

@Suite
struct `AnimationRange - Start-End Range` {
    @Test func `renders start-end with normal and named range`() {
        #expect(AnimationRange.startEnd(.normal, .namedRange(.exit)).description == "normal exit")
    }

    @Test func `renders start-end with named range and percentage`() {
        #expect(
            AnimationRange.startEnd(.namedRange(.entry), .percentage(50)).description == "entry 50%"
        )
    }

    @Test func `renders start-end with two named ranges with percentages`() {
        #expect(
            AnimationRange.startEnd(.namedRange(.entry, 10), .namedRange(.contain, 75)).description
                == "entry 10% contain 75%"
        )
    }

    @Test func `renders start-end with percentages only`() {
        #expect(
            AnimationRange.startEnd(.percentage(25), .percentage(75)).description == "25% 75%"
        )
    }
}

// MARK: - Protocol Conformance

@Suite
struct `AnimationRange - Global Values` {
    @Test(arguments: [
        (AnimationRange.inherit, "inherit"),
        (AnimationRange.initial, "initial"),
        (AnimationRange.revert, "revert"),
        (AnimationRange.revertLayer, "revert-layer"),
        (AnimationRange.unset, "unset"),
    ])
    func `renders global values correctly`(
        value: AnimationRange,
        expected: String
    ) {
        #expect(value.description == expected)
    }
}

@Suite
struct `AnimationRange - Property Protocol` {
    @Test func `conforms to Property protocol`() {
        #expect(AnimationRange.property == "animation-range")
    }
}

// MARK: - Edge Cases

@Suite
struct `AnimationRange - Edge Cases` {
    @Test func `named ranges with hyphens render correctly`() {
        #expect(AnimationRange.namedRange(.entryCrossing).description == "entry-crossing")
        #expect(AnimationRange.namedRange(.exitCrossing).description == "exit-crossing")
    }

    @Test func `percentage values can be 0 or 100`() {
        #expect(AnimationRange.percentage(0).description == "0%")
        #expect(AnimationRange.percentage(100).description == "100%")
    }

    @Test func `fractional percentages render correctly`() {
        #expect(AnimationRange.percentage(25.5).description == "25.5%")
        #expect(AnimationRange.single(.percentage(33.33)).description == "33.33%")
    }

    @Test func `start-end can have same named range with different percentages`() {
        #expect(
            AnimationRange.startEnd(.namedRange(.entry, 10), .namedRange(.entry, 90)).description
                == "entry 10% entry 90%"
        )
    }
}

// MARK: - Usage in Context

@Suite
struct `AnimationRange - CSS Property Usage` {
    @Test func `renders correctly in CSS rule`() {
        let css = "animation-range: \(AnimationRange.namedRange(.cover))"
        #expect(css == "animation-range: cover")
    }

    @Test func `declaration renders complete property`() {
        let decl = AnimationRange.normal.declaration
        #expect(decl.description == "animation-range:normal")
    }

    @Test func `complex range renders correctly`() {
        let css =
            "animation-range: \(AnimationRange.startEnd(.namedRange(.entry, 10), .namedRange(.exit, 90)))"
        #expect(css == "animation-range: entry 10% exit 90%")
    }
}

// MARK: - Semantic Validation

@Suite
struct `AnimationRange - Semantic Validation` {
    @Test func `cover represents full scroll range`() {
        let range = AnimationRange.namedRange(.cover)
        #expect(range.description == "cover")
    }

    @Test func `contain represents contained range`() {
        let range = AnimationRange.namedRange(.contain)
        #expect(range.description == "contain")
    }

    @Test func `entry represents entry phase`() {
        let range = AnimationRange.namedRange(.entry)
        #expect(range.description == "entry")
    }

    @Test func `exit represents exit phase`() {
        let range = AnimationRange.namedRange(.exit)
        #expect(range.description == "exit")
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `AnimationRange - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `creation 100K times`() {
            for i in 0..<100_000 {
                _ = AnimationRange.percentage(Percentage(Double(i % 100)))
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `description generation 100K times`() {
            let range = AnimationRange.namedRange(.cover)
            for _ in 0..<100_000 {
                _ = range.description
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `complex range creation 100K times`() {
            for i in 0..<100_000 {
                _ = AnimationRange.startEnd(
                    .namedRange(.entry, Percentage(Double(i % 50))),
                    .namedRange(.exit, Percentage(50 + Double(i % 50)))
                )
            }
        }
    }
}
