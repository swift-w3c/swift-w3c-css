// AlignmentBaseline Tests.swift
// swift-w3c-css
//
// Tests for CSS alignment-baseline property

import Testing

@testable import W3C_CSS_Alignment

// MARK: - Basic Functionality

@Suite
struct `AlignmentBaseline - Property Protocol` {
    @Test func `alignment-baseline property name is correct`() {
        #expect(AlignmentBaseline.property == "alignment-baseline")
    }
}

@Suite
struct `AlignmentBaseline - Declaration Rendering` {
    @Test(arguments: [
        (AlignmentBaseline.baseline, "alignment-baseline:baseline"),
        (AlignmentBaseline.textTop, "alignment-baseline:text-top"),
        (AlignmentBaseline.alphabetic, "alignment-baseline:alphabetic"),
        (AlignmentBaseline.middle, "alignment-baseline:middle"),
        (AlignmentBaseline.auto, "alignment-baseline:auto"),
    ])
    func `declaration renders correctly`(
        value: AlignmentBaseline,
        expected: String
    ) {
        #expect(value.declaration.description == expected)
    }
}

// MARK: - Basic Values

@Suite
struct `AlignmentBaseline - Baseline Value` {
    @Test func `baseline value renders correctly`() {
        #expect(AlignmentBaseline.baseline.description == "baseline")
    }
}

// MARK: - Text Edge Values

@Suite
struct `AlignmentBaseline - Text Edge Values` {
    @Test(arguments: [
        (AlignmentBaseline.textTop, "text-top"),
        (AlignmentBaseline.textBottom, "text-bottom"),
    ])
    func `text edge values render correctly`(
        value: AlignmentBaseline,
        expected: String
    ) {
        #expect(value.description == expected)
    }
}

// MARK: - Main Alignment Values

@Suite
struct `AlignmentBaseline - Main Alignment Values` {
    @Test(arguments: [
        (AlignmentBaseline.alphabetic, "alphabetic"),
        (AlignmentBaseline.central, "central"),
        (AlignmentBaseline.ideographic, "ideographic"),
        (AlignmentBaseline.mathematical, "mathematical"),
        (AlignmentBaseline.middle, "middle"),
    ])
    func `main alignment values render correctly`(
        value: AlignmentBaseline,
        expected: String
    ) {
        #expect(value.description == expected)
    }
}

// MARK: - Deprecated Values

@Suite
struct `AlignmentBaseline - Deprecated Values` {
    @Test(arguments: [
        (AlignmentBaseline.auto, "auto"),
        (AlignmentBaseline.beforeEdge, "before-edge"),
        (AlignmentBaseline.afterEdge, "after-edge"),
        (AlignmentBaseline.hanging, "hanging"),
        (AlignmentBaseline.textBeforeEdge, "text-before-edge"),
        (AlignmentBaseline.textAfterEdge, "text-after-edge"),
    ])
    func `deprecated values render correctly`(
        value: AlignmentBaseline,
        expected: String
    ) {
        #expect(value.description == expected)
    }
}

// MARK: - Global Values

@Suite
struct `AlignmentBaseline - Global Values` {
    @Test(arguments: [
        (AlignmentBaseline.inherit, "inherit"),
        (AlignmentBaseline.initial, "initial"),
        (AlignmentBaseline.revert, "revert"),
        (AlignmentBaseline.revertLayer, "revert-layer"),
        (AlignmentBaseline.unset, "unset"),
    ])
    func `global values render correctly`(
        value: AlignmentBaseline,
        expected: String
    ) {
        #expect(value.description == expected)
    }
}

// MARK: - Edge Cases

@Suite
struct `AlignmentBaseline - Edge Cases` {
    @Test func `all text alignment values are distinct`() {
        let values = [
            AlignmentBaseline.alphabetic,
            AlignmentBaseline.central,
            AlignmentBaseline.ideographic,
            AlignmentBaseline.mathematical,
            AlignmentBaseline.middle,
        ]

        let descriptions = Set(values.map { $0.description })
        #expect(descriptions.count == values.count)
    }

    @Test func `deprecated edge values are properly formatted`() {
        #expect(AlignmentBaseline.beforeEdge.description.contains("-"))
        #expect(AlignmentBaseline.afterEdge.description.contains("-"))
        #expect(AlignmentBaseline.textBeforeEdge.description.contains("-"))
        #expect(AlignmentBaseline.textAfterEdge.description.contains("-"))
    }

    @Test func `text edge values use hyphenated format`() {
        #expect(AlignmentBaseline.textTop.description == "text-top")
        #expect(AlignmentBaseline.textBottom.description == "text-bottom")
        #expect(AlignmentBaseline.textBeforeEdge.description == "text-before-edge")
        #expect(AlignmentBaseline.textAfterEdge.description == "text-after-edge")
    }
}

// MARK: - Usage in Context

@Suite
struct `AlignmentBaseline - CSS Property Usage` {
    @Test func `alignment-baseline renders correctly in SVG context`() {
        let css = "alignment-baseline: \(AlignmentBaseline.middle)"
        #expect(css == "alignment-baseline: middle")
    }

    @Test func `alignment-baseline renders correctly with text-top`() {
        let css = "alignment-baseline: \(AlignmentBaseline.textTop)"
        #expect(css == "alignment-baseline: text-top")
    }

    @Test func `alignment-baseline renders correctly with alphabetic`() {
        let css = "alignment-baseline: \(AlignmentBaseline.alphabetic)"
        #expect(css == "alignment-baseline: alphabetic")
    }

    @Test func `alignment-baseline renders correctly with deprecated values`() {
        let css = "alignment-baseline: \(AlignmentBaseline.hanging)"
        #expect(css == "alignment-baseline: hanging")
    }
}

// MARK: - Categorization

@Suite
struct `AlignmentBaseline - Value Categories` {
    @Test func `current values are baseline, text-top, and text-bottom`() {
        let currentValues = [
            AlignmentBaseline.baseline,
            AlignmentBaseline.textTop,
            AlignmentBaseline.textBottom,
        ]

        for value in currentValues {
            #expect(!value.description.isEmpty)
        }
    }

    @Test func `main alignment values include alphabetic and ideographic`() {
        let mainValues = [
            AlignmentBaseline.alphabetic,
            AlignmentBaseline.central,
            AlignmentBaseline.ideographic,
            AlignmentBaseline.mathematical,
            AlignmentBaseline.middle,
        ]

        for value in mainValues {
            #expect(!value.description.isEmpty)
        }
    }

    @Test func `deprecated values include auto and edge values`() {
        let deprecatedValues = [
            AlignmentBaseline.auto,
            AlignmentBaseline.beforeEdge,
            AlignmentBaseline.afterEdge,
            AlignmentBaseline.hanging,
            AlignmentBaseline.textBeforeEdge,
            AlignmentBaseline.textAfterEdge,
        ]

        for value in deprecatedValues {
            #expect(!value.description.isEmpty)
        }
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `AlignmentBaseline - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `alignment-baseline creation 100K times`() {
            for _ in 0..<100_000 {
                _ = AlignmentBaseline.middle
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `alignment-baseline description rendering 100K times`() {
            let value = AlignmentBaseline.alphabetic
            for _ in 0..<100_000 {
                _ = value.description
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `alignment-baseline declaration rendering 100K times`() {
            let value = AlignmentBaseline.baseline
            for _ in 0..<100_000 {
                _ = value.declaration.description
            }
        }
    }
}
