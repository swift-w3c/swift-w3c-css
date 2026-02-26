// AnimationFillMode Tests.swift
// swift-w3c-css
//
// Tests for CSS AnimationFillMode type

import Testing

@testable import W3C_CSS_Animations

// MARK: - Basic Functionality

@Suite
struct `AnimationFillMode - Declaration` {
    @Test func `renders declaration correctly`() {
        #expect(AnimationFillMode.none.declaration.description == "animation-fill-mode:none")
    }
}

@Suite
struct `AnimationFillMode - Basic Values` {
    @Test(arguments: [
        (AnimationFillMode.none, "none"),
        (AnimationFillMode.forwards, "forwards"),
        (AnimationFillMode.backwards, "backwards"),
        (AnimationFillMode.both, "both"),
    ])
    func `renders basic values correctly`(
        value: AnimationFillMode,
        expected: String
    ) {
        #expect(value.description == expected)
    }
}

// MARK: - Protocol Conformance

@Suite
struct `AnimationFillMode - Global Values` {
    @Test(arguments: [
        (AnimationFillMode.inherit, "inherit"),
        (AnimationFillMode.initial, "initial"),
        (AnimationFillMode.revert, "revert"),
        (AnimationFillMode.revertLayer, "revert-layer"),
        (AnimationFillMode.unset, "unset"),
    ])
    func `renders global values correctly`(
        value: AnimationFillMode,
        expected: String
    ) {
        #expect(value.description == expected)
    }
}

@Suite
struct `AnimationFillMode - Property Protocol` {
    @Test func `conforms to Property protocol`() {
        #expect(AnimationFillMode.property == "animation-fill-mode")
    }
}

@Suite
struct `AnimationFillMode - CaseIterable` {
    @Test func `provides all cases`() {
        let allCases = AnimationFillMode.allCases
        #expect(allCases.contains(AnimationFillMode.none))
        #expect(allCases.contains(AnimationFillMode.forwards))
        #expect(allCases.contains(AnimationFillMode.backwards))
        #expect(allCases.contains(AnimationFillMode.both))
        #expect(allCases.contains(AnimationFillMode.inherit))
    }

    @Test func `all cases count is correct`() {
        #expect(AnimationFillMode.allCases.count >= 9)
    }
}

// MARK: - Edge Cases

@Suite
struct `AnimationFillMode - Edge Cases` {
    @Test func `all fill mode values are distinct`() {
        #expect(AnimationFillMode.none != AnimationFillMode.forwards)
        #expect(AnimationFillMode.backwards != AnimationFillMode.both)
        #expect(AnimationFillMode.forwards != AnimationFillMode.both)
    }

    @Test func `both combines forwards and backwards behavior`() {
        #expect(AnimationFillMode.both.description == "both")
    }

    @Test func `none means no fill behavior`() {
        #expect(AnimationFillMode.none.description == "none")
    }
}

// MARK: - Usage in Context

@Suite
struct `AnimationFillMode - CSS Property Usage` {
    @Test func `renders correctly in CSS rule`() {
        let css = "animation-fill-mode: \(AnimationFillMode.forwards)"
        #expect(css == "animation-fill-mode: forwards")
    }

    @Test func `declaration renders complete property`() {
        let decl = AnimationFillMode.both.declaration
        #expect(decl.description == "animation-fill-mode:both")
    }

    @Test func `multiple fill modes can be combined in array notation`() {
        let modes = [
            AnimationFillMode.forwards, AnimationFillMode.backwards, AnimationFillMode.both,
        ]
        let css = modes.map(\.description).joined(separator: ", ")
        #expect(css == "forwards, backwards, both")
    }
}

// MARK: - Semantic Validation

@Suite
struct `AnimationFillMode - Semantic Validation` {
    @Test func `forwards applies final keyframe after animation`() {
        let mode = AnimationFillMode.forwards
        #expect(mode.description == "forwards")
    }

    @Test func `backwards applies first keyframe before animation`() {
        let mode = AnimationFillMode.backwards
        #expect(mode.description == "backwards")
    }

    @Test func `both applies both forwards and backwards behavior`() {
        let mode = AnimationFillMode.both
        #expect(mode.description == "both")
    }

    @Test func `none removes fill behavior`() {
        let mode = AnimationFillMode.none
        #expect(mode.description == "none")
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `AnimationFillMode - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `creation 100K times`() {
            for _ in 0..<100_000 {
                _ = AnimationFillMode.forwards
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `description generation 100K times`() {
            for _ in 0..<100_000 {
                _ = AnimationFillMode.both.description
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `case iteration 10K times`() {
            for _ in 0..<10_000 {
                _ = AnimationFillMode.allCases
            }
        }
    }
}
