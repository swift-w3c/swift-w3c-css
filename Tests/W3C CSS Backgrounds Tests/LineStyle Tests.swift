// LineStyle Tests.swift
// swift-w3c-css
//
// Tests for CSS LineStyle type

import Testing
import W3C_CSS_Values

@testable import W3C_CSS_Backgrounds

// MARK: - Basic Functionality

@Suite
struct `LineStyle - Enum Cases and Raw Values` {
    @Test(arguments: [
        (LineStyle.none, "none"),
        (.hidden, "hidden"),
        (.dotted, "dotted"),
        (.dashed, "dashed"),
        (.solid, "solid"),
        (.double, "double"),
        (.groove, "groove"),
        (.ridge, "ridge"),
        (.inset, "inset"),
        (.outset, "outset"),
    ])
    func `line style has correct raw value`(style: LineStyle, expected: String) {
        #expect(style.rawValue == expected)
    }

    @Test(arguments: [
        (LineStyle.none, "none"),
        (.hidden, "hidden"),
        (.dotted, "dotted"),
        (.dashed, "dashed"),
        (.solid, "solid"),
        (.double, "double"),
        (.groove, "groove"),
        (.ridge, "ridge"),
        (.inset, "inset"),
        (.outset, "outset"),
    ])
    func `line style description returns raw value`(style: LineStyle, expected: String) {
        #expect(style.description == expected)
    }
}

// MARK: - Protocol Conformance

@Suite
struct `LineStyle - Hashable Conformance` {
    @Test func `equal line styles are equal`() {
        let style1 = LineStyle.solid
        let style2 = LineStyle.solid
        #expect(style1 == style2)
    }

    @Test func `different line styles are not equal`() {
        let solid = LineStyle.solid
        let dashed = LineStyle.dashed
        #expect(solid != dashed)
    }
}

@Suite
struct `LineStyle - CaseIterable Conformance` {
    @Test func `all cases contains all line styles`() {
        let allCases = LineStyle.allCases
        #expect(allCases.count == 10)
        #expect(allCases.contains(.none))
        #expect(allCases.contains(.hidden))
        #expect(allCases.contains(.dotted))
        #expect(allCases.contains(.dashed))
        #expect(allCases.contains(.solid))
        #expect(allCases.contains(.double))
        #expect(allCases.contains(.groove))
        #expect(allCases.contains(.ridge))
        #expect(allCases.contains(.inset))
        #expect(allCases.contains(.outset))
    }
}

@Suite
struct `LineStyle - RawRepresentable Conformance` {
    @Test(arguments: [
        ("none", LineStyle.none),
        ("hidden", .hidden),
        ("dotted", .dotted),
        ("dashed", .dashed),
        ("solid", .solid),
        ("double", .double),
        ("groove", .groove),
        ("ridge", .ridge),
        ("inset", .inset),
        ("outset", .outset),
    ])
    func `line style can be created from raw value`(rawValue: String, expected: LineStyle) {
        #expect(LineStyle(rawValue: rawValue) == expected)
    }

    @Test func `invalid raw value returns nil`() {
        #expect(LineStyle(rawValue: "invalid") == nil)
    }
}

// MARK: - Properties

@Suite
struct `LineStyle - Is3D Property` {
    @Test(arguments: [
        (LineStyle.groove, true),
        (.ridge, true),
        (.inset, true),
        (.outset, true),
    ])
    func `3D styles are correctly identified`(style: LineStyle, expected: Bool) {
        #expect(style.is3D == expected)
    }

    @Test(arguments: [
        (LineStyle.none, false),
        (.hidden, false),
        (.dotted, false),
        (.dashed, false),
        (.solid, false),
        (.double, false),
    ])
    func `non-3D styles are correctly identified`(style: LineStyle, expected: Bool) {
        #expect(style.is3D == expected)
    }
}

@Suite
struct `LineStyle - IsVisible Property` {
    @Test(arguments: [
        (LineStyle.none, false),
        (.hidden, false),
    ])
    func `invisible styles are correctly identified`(style: LineStyle, expected: Bool) {
        #expect(style.isVisible == expected)
    }

    @Test(arguments: [
        (LineStyle.dotted, true),
        (.dashed, true),
        (.solid, true),
        (.double, true),
        (.groove, true),
        (.ridge, true),
        (.inset, true),
        (.outset, true),
    ])
    func `visible styles are correctly identified`(style: LineStyle, expected: Bool) {
        #expect(style.isVisible == expected)
    }
}

@Suite
struct `LineStyle - Opposite3D Property` {
    @Test(arguments: [
        (LineStyle.groove, LineStyle.ridge),
        (.ridge, .groove),
        (.inset, .outset),
        (.outset, .inset),
    ])
    func `3D styles have correct opposites`(style: LineStyle, expected: LineStyle) {
        #expect(style.opposite3D == expected)
    }

    @Test func `opposite3D is symmetric`() {
        #expect(LineStyle.groove.opposite3D?.opposite3D == LineStyle.groove)
        #expect(LineStyle.inset.opposite3D?.opposite3D == LineStyle.inset)
    }

    @Test(arguments: [
        LineStyle.none,
        .hidden,
        .dotted,
        .dashed,
        .solid,
        .double,
    ])
    func `non-3D styles return nil for opposite3D`(style: LineStyle) {
        #expect(style.opposite3D == nil)
    }
}

// MARK: - Usage in Context

@Suite
struct `LineStyle - CSS Property Usage` {
    @Test func `line style renders correctly in border-style property`() {
        let borderStyle = "border-style: \(LineStyle.solid)"
        #expect(borderStyle == "border-style: solid")
    }

    @Test func `line style renders correctly in border-top-style property`() {
        let borderTopStyle = "border-top-style: \(LineStyle.dashed)"
        #expect(borderTopStyle == "border-top-style: dashed")
    }

    @Test func `line style renders correctly in column-rule-style property`() {
        let columnRuleStyle = "column-rule-style: \(LineStyle.double)"
        #expect(columnRuleStyle == "column-rule-style: double")
    }

    @Test func `line style renders correctly in outline-style property`() {
        let outlineStyle = "outline-style: \(LineStyle.groove)"
        #expect(outlineStyle == "outline-style: groove")
    }
}

// MARK: - Edge Cases

@Suite
struct `LineStyle - Edge Cases` {
    @Test func `all visible 3D styles have opposites`() {
        for style in LineStyle.allCases where style.is3D {
            #expect(style.opposite3D != nil)
            #expect(style.isVisible == true)
        }
    }

    @Test func `invisible styles are not 3D`() {
        for style in LineStyle.allCases where !style.isVisible {
            #expect(style.is3D == false)
        }
    }

    @Test func `all case iteration order`() {
        let allCases = LineStyle.allCases
        // Verify order matches definition
        #expect(allCases[0] == .none)
        #expect(allCases[1] == .hidden)
        #expect(allCases[2] == .dotted)
        #expect(allCases[3] == .dashed)
        #expect(allCases[4] == .solid)
        #expect(allCases[5] == .double)
        #expect(allCases[6] == .groove)
        #expect(allCases[7] == .ridge)
        #expect(allCases[8] == .inset)
        #expect(allCases[9] == .outset)
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `LineStyle - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `line style raw value access 100K times`() {
            for i in 0..<100_000 {
                let style = LineStyle.allCases[i % LineStyle.allCases.count]
                _ = style.rawValue
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `line style property checks 100K times`() {
            for i in 0..<100_000 {
                let style = LineStyle.allCases[i % LineStyle.allCases.count]
                _ = style.is3D
                _ = style.isVisible
                _ = style.opposite3D
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `line style comparison 100K times`() {
            let solid = LineStyle.solid
            for i in 0..<100_000 {
                let style = LineStyle.allCases[i % LineStyle.allCases.count]
                _ = style == solid
            }
        }
    }
}
