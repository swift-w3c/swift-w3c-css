// AnimationDirection Tests.swift
// swift-w3c-css
//
// Tests for CSS AnimationDirection type

import Testing

@testable import W3C_CSS_Animations

// MARK: - Basic Functionality

@Suite
struct `AnimationDirection - Declaration` {
    @Test func `renders declaration correctly`() {
        #expect(AnimationDirection.normal.declaration.description == "animation-direction:normal")
    }
}

@Suite
struct `AnimationDirection - Basic Values` {
    @Test(arguments: [
        (AnimationDirection.normal, "normal"),
        (AnimationDirection.reverse, "reverse"),
        (AnimationDirection.alternate, "alternate"),
        (AnimationDirection.alternateReverse, "alternate-reverse"),
    ])
    func `renders basic values correctly`(
        value: AnimationDirection,
        expected: String
    ) {
        #expect(value.description == expected)
    }
}

// MARK: - Protocol Conformance

@Suite
struct `AnimationDirection - Global Values` {
    @Test(arguments: [
        (AnimationDirection.inherit, "inherit"),
        (AnimationDirection.initial, "initial"),
        (AnimationDirection.revert, "revert"),
        (AnimationDirection.revertLayer, "revert-layer"),
        (AnimationDirection.unset, "unset"),
    ])
    func `renders global values correctly`(
        value: AnimationDirection,
        expected: String
    ) {
        #expect(value.description == expected)
    }
}

@Suite
struct `AnimationDirection - Property Protocol` {
    @Test func `conforms to Property protocol`() {
        #expect(AnimationDirection.property == "animation-direction")
    }
}

@Suite
struct `AnimationDirection - CaseIterable` {
    @Test func `provides all cases`() {
        let allCases = AnimationDirection.allCases
        #expect(allCases.contains(AnimationDirection.normal))
        #expect(allCases.contains(AnimationDirection.reverse))
        #expect(allCases.contains(AnimationDirection.alternate))
        #expect(allCases.contains(AnimationDirection.alternateReverse))
        #expect(allCases.contains(AnimationDirection.inherit))
    }

    @Test func `all cases count is correct`() {
        #expect(AnimationDirection.allCases.count >= 9)
    }
}

// MARK: - Edge Cases

@Suite
struct `AnimationDirection - Edge Cases` {
    @Test func `all direction values are distinct`() {
        #expect(AnimationDirection.normal != AnimationDirection.reverse)
        #expect(AnimationDirection.alternate != AnimationDirection.alternateReverse)
        #expect(AnimationDirection.normal != AnimationDirection.alternate)
    }

    @Test func `alternate-reverse has hyphenated format`() {
        #expect(AnimationDirection.alternateReverse.description == "alternate-reverse")
    }
}

// MARK: - Usage in Context

@Suite
struct `AnimationDirection - CSS Property Usage` {
    @Test func `renders correctly in CSS rule`() {
        let css = "animation-direction: \(AnimationDirection.alternate)"
        #expect(css == "animation-direction: alternate")
    }

    @Test func `declaration renders complete property`() {
        let decl = AnimationDirection.reverse.declaration
        #expect(decl.description == "animation-direction:reverse")
    }

    @Test func `multiple directions can be combined in array notation`() {
        let directions = [
            AnimationDirection.normal, AnimationDirection.reverse, AnimationDirection.alternate,
        ]
        let css = directions.map(\.description).joined(separator: ", ")
        #expect(css == "normal, reverse, alternate")
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `AnimationDirection - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `creation 100K times`() {
            for _ in 0..<100_000 {
                _ = AnimationDirection.normal
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `description generation 100K times`() {
            for _ in 0..<100_000 {
                _ = AnimationDirection.alternate.description
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `case iteration 10K times`() {
            for _ in 0..<10_000 {
                _ = AnimationDirection.allCases
            }
        }
    }
}
