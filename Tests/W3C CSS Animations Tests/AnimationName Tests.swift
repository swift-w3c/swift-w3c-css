// AnimationName Tests.swift
// swift-w3c-css
//
// Tests for CSS AnimationName type

import Testing

@testable import W3C_CSS_Animations

// MARK: - Basic Functionality

@Suite
struct `AnimationName - Declaration` {
    @Test func `renders declaration correctly`() {
        #expect(AnimationName.none.declaration.description == "animation-name:none")
    }
}

@Suite
struct `AnimationName - None Value` {
    @Test func `renders none value correctly`() {
        #expect(AnimationName.none.description == "none")
    }
}

@Suite
struct `AnimationName - Keyframe Names` {
    @Test(arguments: [
        ("slide-in", "slide-in"),
        ("bounce", "bounce"),
        ("fade-out", "fade-out"),
        ("rotate", "rotate"),
    ])
    func `renders keyframe names correctly`(
        name: String,
        expected: String
    ) {
        #expect(AnimationName.keyframes(.init(name)).description == expected)
    }
}

// MARK: - Literal Initialization

@Suite
struct `AnimationName - String Literals` {
    @Test(arguments: [
        ("slide-in", "slide-in"),
        ("bounce", "bounce"),
        ("none", "none"),
        ("fadeIn", "fadeIn"),
    ])
    func `works with string literals`(
        literal: String,
        expected: String
    ) {
        let name: AnimationName = AnimationName(stringLiteral: literal)
        #expect(name.description == expected)
    }
}

// MARK: - Protocol Conformance

@Suite
struct `AnimationName - Global Values` {
    @Test(arguments: [
        (AnimationName.inherit, "inherit"),
        (AnimationName.initial, "initial"),
        (AnimationName.revert, "revert"),
        (AnimationName.revertLayer, "revert-layer"),
        (AnimationName.unset, "unset"),
    ])
    func `renders global values correctly`(
        value: AnimationName,
        expected: String
    ) {
        #expect(value.description == expected)
    }
}

@Suite
struct `AnimationName - Property Protocol` {
    @Test func `conforms to Property protocol`() {
        #expect(AnimationName.property == "animation-name")
    }
}

// MARK: - Edge Cases

@Suite
struct `AnimationName - Edge Cases` {
    @Test func `none is distinct from quoted none`() {
        #expect(AnimationName.none.description == "none")
        let quoted: AnimationName = #""none""#
        #expect(quoted.description == #""none""#)
        #expect(AnimationName.none.description != quoted.description)
    }

    @Test func `handles hyphenated names`() {
        let name: AnimationName = "slide-in-from-left"
        #expect(name.description == "slide-in-from-left")
    }

    @Test func `handles camelCase names`() {
        let name: AnimationName = "fadeInOut"
        #expect(name.description == "fadeInOut")
    }

    @Test func `handles underscore names`() {
        let name: AnimationName = "fade_in"
        #expect(name.description == "fade_in")
    }

    @Test func `handles numeric suffixes`() {
        let name: AnimationName = "slide-in-1"
        #expect(name.description == "slide-in-1")
    }
}

// MARK: - Usage in Context

@Suite
struct `AnimationName - CSS Property Usage` {
    @Test func `renders correctly in CSS rule`() {
        let css = "animation-name: \(AnimationName.keyframes(.init("bounce")))"
        #expect(css == "animation-name: bounce")
    }

    @Test func `declaration renders complete property`() {
        let decl = AnimationName.keyframes(.init("slide-in")).declaration
        #expect(decl.description == "animation-name:slide-in")
    }

    @Test func `none renders correctly in CSS rule`() {
        let css = "animation-name: \(AnimationName.none)"
        #expect(css == "animation-name: none")
    }

    @Test func `multiple names can be combined in array notation`() {
        let names: [AnimationName] = ["slide-in", "fade-out", "bounce"]
        let css = names.map(\.description).joined(separator: ", ")
        #expect(css == "slide-in, fade-out, bounce")
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `AnimationName - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `creation 100K times`() {
            for i in 0..<100_000 {
                _ = AnimationName.keyframes(.init("animation-\(i)"))
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `description generation 100K times`() {
            let name: AnimationName = "slide-in"
            for _ in 0..<100_000 {
                _ = name.description
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `string literal initialization 100K times`() {
            for i in 0..<100_000 {
                let _: AnimationName = AnimationName(stringLiteral: "animation-\(i)")
            }
        }
    }
}
