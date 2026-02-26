// AnimationComposition Tests.swift
// swift-w3c-css
//
// Tests for CSS AnimationComposition type

import Testing

@testable import W3C_CSS_Animations

// MARK: - Basic Functionality

@Suite
struct `AnimationComposition - Declaration` {
    @Test func `renders declaration correctly`() {
        #expect(
            AnimationComposition.replace.declaration.description == "animation-composition:replace"
        )
    }
}

@Suite
struct `AnimationComposition - Basic Values` {
    @Test(arguments: [
        (AnimationComposition.replace, "replace"),
        (AnimationComposition.add, "add"),
        (AnimationComposition.accumulate, "accumulate"),
    ])
    func `renders basic values correctly`(
        value: AnimationComposition,
        expected: String
    ) {
        #expect(value.description == expected)
    }
}

// MARK: - Protocol Conformance

@Suite
struct `AnimationComposition - Global Values` {
    @Test(arguments: [
        (AnimationComposition.inherit, "inherit"),
        (AnimationComposition.initial, "initial"),
        (AnimationComposition.revert, "revert"),
        (AnimationComposition.revertLayer, "revert-layer"),
        (AnimationComposition.unset, "unset"),
    ])
    func `renders global values correctly`(
        value: AnimationComposition,
        expected: String
    ) {
        #expect(value.description == expected)
    }
}

@Suite
struct `AnimationComposition - Property Protocol` {
    @Test func `conforms to Property protocol`() {
        #expect(AnimationComposition.property == "animation-composition")
    }
}

@Suite
struct `AnimationComposition - CaseIterable` {
    @Test func `provides all cases`() {
        let allCases = AnimationComposition.allCases
        #expect(allCases.contains(AnimationComposition.replace))
        #expect(allCases.contains(AnimationComposition.add))
        #expect(allCases.contains(AnimationComposition.accumulate))
        #expect(allCases.contains(AnimationComposition.inherit))
    }

    @Test func `all cases count is correct`() {
        #expect(AnimationComposition.allCases.count >= 8)
    }
}

// MARK: - Edge Cases

@Suite
struct `AnimationComposition - Edge Cases` {
    @Test func `all composition modes are distinct`() {
        #expect(AnimationComposition.replace != AnimationComposition.add)
        #expect(AnimationComposition.add != AnimationComposition.accumulate)
        #expect(AnimationComposition.accumulate != AnimationComposition.replace)
    }

    @Test func `global values work with composition types`() {
        let inherit = AnimationComposition.inherit
        #expect(inherit.description == "inherit")
    }
}

// MARK: - Usage in Context

@Suite
struct `AnimationComposition - CSS Property Usage` {
    @Test func `renders correctly in CSS rule`() {
        let css = "animation-composition: \(AnimationComposition.replace)"
        #expect(css == "animation-composition: replace")
    }

    @Test func `declaration renders complete property`() {
        let decl = AnimationComposition.add.declaration
        #expect(decl.description == "animation-composition:add")
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `AnimationComposition - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `creation 100K times`() {
            for _ in 0..<100_000 {
                _ = AnimationComposition.replace
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `description generation 100K times`() {
            for _ in 0..<100_000 {
                _ = AnimationComposition.add.description
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `case iteration 10K times`() {
            for _ in 0..<10_000 {
                _ = AnimationComposition.allCases
            }
        }
    }
}
