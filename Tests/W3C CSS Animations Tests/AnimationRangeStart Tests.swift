// AnimationRangeStart Tests.swift
// swift-w3c-css
//
// Tests for CSS AnimationRangeStart type

import Testing
import W3C_CSS_Values

@testable import W3C_CSS_Animations

// MARK: - Basic Functionality

@Suite
struct `AnimationRangeStart - Declaration` {
    @Test func `renders declaration correctly`() {
        #expect(
            AnimationRangeStart.normal.declaration.description == "animation-range-start:normal"
        )
    }
}

@Suite
struct `AnimationRangeStart - Normal Value` {
    @Test func `renders normal value correctly`() {
        #expect(AnimationRangeStart.normal.description == "normal")
    }
}

@Suite
struct `AnimationRangeStart - Named Range Values` {
    @Test(arguments: [
        (AnimationRangeStart.namedRange(.cover), "cover"),
        (AnimationRangeStart.namedRange(.contain), "contain"),
        (AnimationRangeStart.namedRange(.entry), "entry"),
        (AnimationRangeStart.namedRange(.exit), "exit"),
        (AnimationRangeStart.namedRange(.entryCrossing), "entry-crossing"),
        (AnimationRangeStart.namedRange(.exitCrossing), "exit-crossing"),
    ])
    func `renders named range values correctly`(
        value: AnimationRangeStart,
        expected: String
    ) {
        #expect(value.description == expected)
    }
}

@Suite
struct `AnimationRangeStart - Percentage Values` {
    @Test(arguments: [
        (AnimationRangeStart.percentage(20), "20%"),
        (AnimationRangeStart.percentage(0), "0%"),
        (AnimationRangeStart.percentage(50), "50%"),
    ])
    func `renders percentage values correctly`(
        value: AnimationRangeStart,
        expected: String
    ) {
        #expect(value.description == expected)
    }
}

@Suite
struct `AnimationRangeStart - Named Range with Percentage` {
    @Test(arguments: [
        (AnimationRangeStart.namedRange(.entry, 25), "entry 25%"),
        (AnimationRangeStart.namedRange(.contain, 10), "contain 10%"),
        (AnimationRangeStart.namedRange(.cover, 0), "cover 0%"),
    ])
    func `renders named range with percentage values correctly`(
        value: AnimationRangeStart,
        expected: String
    ) {
        #expect(value.description == expected)
    }
}

// MARK: - Protocol Conformance

@Suite
struct `AnimationRangeStart - Global Values` {
    @Test(arguments: [
        (AnimationRangeStart.inherit, "inherit"),
        (AnimationRangeStart.initial, "initial"),
        (AnimationRangeStart.revert, "revert"),
        (AnimationRangeStart.revertLayer, "revert-layer"),
        (AnimationRangeStart.unset, "unset"),
    ])
    func `renders global values correctly`(
        value: AnimationRangeStart,
        expected: String
    ) {
        #expect(value.description == expected)
    }
}

@Suite
struct `AnimationRangeStart - Property Protocol` {
    @Test func `conforms to Property protocol`() {
        #expect(AnimationRangeStart.property == "animation-range-start")
    }
}

// MARK: - TimelineRangeName Validation

@Suite
struct `AnimationRangeStart - TimelineRangeName` {
    @Test func `TimelineRangeName provides expected cases`() {
        let allCases = TimelineRangeName.allCases
        #expect(allCases.contains(.cover))
        #expect(allCases.contains(.contain))
        #expect(allCases.contains(.entry))
        #expect(allCases.contains(.exit))
        #expect(allCases.contains(.entryCrossing))
        #expect(allCases.contains(.exitCrossing))
    }

    @Test(arguments: [
        (TimelineRangeName.cover, "cover"),
        (TimelineRangeName.contain, "contain"),
        (TimelineRangeName.entry, "entry"),
        (TimelineRangeName.exit, "exit"),
        (TimelineRangeName.entryCrossing, "entry-crossing"),
        (TimelineRangeName.exitCrossing, "exit-crossing"),
    ])
    func `TimelineRangeName has correct raw values`(
        name: TimelineRangeName,
        expected: String
    ) {
        #expect(name.rawValue == expected)
    }
}

// MARK: - Edge Cases

@Suite
struct `AnimationRangeStart - Edge Cases` {
    @Test func `named ranges with hyphens render correctly`() {
        #expect(AnimationRangeStart.namedRange(.entryCrossing).description == "entry-crossing")
        #expect(AnimationRangeStart.namedRange(.exitCrossing).description == "exit-crossing")
    }

    @Test func `percentage values can be 0 or 100`() {
        #expect(AnimationRangeStart.percentage(0).description == "0%")
        #expect(AnimationRangeStart.percentage(100).description == "100%")
    }

    @Test func `fractional percentages render correctly`() {
        #expect(AnimationRangeStart.percentage(25.5).description == "25.5%")
        #expect(AnimationRangeStart.percentage(0.01).description == "0.01%")
    }

    @Test func `entry range is commonly used for start`() {
        let start = AnimationRangeStart.namedRange(.entry)
        #expect(start.description == "entry")
    }
}

// MARK: - Usage in Context

@Suite
struct `AnimationRangeStart - CSS Property Usage` {
    @Test func `renders correctly in CSS rule`() {
        let css = "animation-range-start: \(AnimationRangeStart.namedRange(.entry))"
        #expect(css == "animation-range-start: entry")
    }

    @Test func `declaration renders complete property`() {
        let decl = AnimationRangeStart.percentage(0).declaration
        #expect(decl.description == "animation-range-start:0%")
    }

    @Test func `complex start value renders correctly`() {
        let css = "animation-range-start: \(AnimationRangeStart.namedRange(.entry, 10))"
        #expect(css == "animation-range-start: entry 10%")
    }
}

// MARK: - Semantic Validation

@Suite
struct `AnimationRangeStart - Semantic Validation` {
    @Test func `normal represents default start`() {
        let start = AnimationRangeStart.normal
        #expect(start.description == "normal")
    }

    @Test func `entry represents entry phase start`() {
        let start = AnimationRangeStart.namedRange(.entry)
        #expect(start.description == "entry")
    }

    @Test func `0 percent represents beginning`() {
        let start = AnimationRangeStart.percentage(0)
        #expect(start.description == "0%")
    }

    @Test func `named range with percentage provides precise control`() {
        let start = AnimationRangeStart.namedRange(.entry, 25)
        #expect(start.description == "entry 25%")
    }
}

// MARK: - Interaction with AnimationRangeEnd

@Suite
struct `AnimationRangeStart - Interaction with AnimationRangeEnd` {
    @Test func `start precedes end in animation timeline`() {
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

    @Test func `start and end can use same named range`() {
        let start = AnimationRangeStart.namedRange(.contain, 25)
        let end = AnimationRangeEnd.namedRange(.contain, 75)

        #expect(start.description == "contain 25%")
        #expect(end.description == "contain 75%")
    }
}

// MARK: - Complete Range Scenarios

@Suite
struct `AnimationRangeStart - Complete Range Scenarios` {
    @Test func `cover range from start to end`() {
        let start = AnimationRangeStart.namedRange(.cover, 0)
        let end = AnimationRangeEnd.namedRange(.cover, 100)

        #expect(start.description == "cover 0%")
        #expect(end.description == "cover 100%")
    }

    @Test func `entry to exit transition`() {
        let start = AnimationRangeStart.namedRange(.entry)
        let end = AnimationRangeEnd.namedRange(.exit)

        #expect(start.description == "entry")
        #expect(end.description == "exit")
    }

    @Test func `partial contain range`() {
        let start = AnimationRangeStart.namedRange(.contain, 20)
        let end = AnimationRangeEnd.namedRange(.contain, 80)

        #expect(start.description == "contain 20%")
        #expect(end.description == "contain 80%")
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `AnimationRangeStart - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `creation 100K times`() {
            for i in 0..<100_000 {
                _ = AnimationRangeStart.percentage(Percentage(Double(i % 100)))
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `description generation 100K times`() {
            let start = AnimationRangeStart.namedRange(.entry)
            for _ in 0..<100_000 {
                _ = start.description
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `named range with percentage creation 100K times`() {
            for i in 0..<100_000 {
                _ = AnimationRangeStart.namedRange(.entry, Percentage(Double(i % 50)))
            }
        }
    }
}
