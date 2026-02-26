// AnimationDelay Tests.swift
// swift-w3c-css
//
// Tests for CSS AnimationDelay type

import Testing
import W3C_CSS_Values

@testable import W3C_CSS_Animations

// MARK: - Basic Functionality

@Suite
struct `AnimationDelay - Declaration` {
    @Test func `renders declaration correctly`() {
        #expect(AnimationDelay.s(2).declaration.description == "animation-delay:2s")
    }
}

@Suite
struct `AnimationDelay - Time Values` {
    @Test(arguments: [
        (AnimationDelay.s(2), "2s"),
        (AnimationDelay.ms(500), "500ms"),
        (AnimationDelay.s(-1), "-1s"),
        (AnimationDelay.zero, "0s"),
    ])
    func `renders time values correctly`(
        value: AnimationDelay,
        expected: String
    ) {
        #expect(value.description == expected)
    }

    @Test func `zero constant has correct value`() {
        #expect(AnimationDelay.zero.description == "0s")
    }

    @Test func `supports negative delays`() {
        #expect(AnimationDelay.s(-2.5).description == "-2.5s")
        #expect(AnimationDelay.ms(-100).description == "-100ms")
    }
}

@Suite
struct `AnimationDelay - Time Objects` {
    @Test(arguments: [
        (Time.s(3.5), "3.5s"),
        (Time.ms(250), "250ms"),
        (Time.s(0), "0s"),
        (Time.ms(-500), "-500ms"),
    ])
    func `renders Time objects correctly`(
        time: Time,
        expected: String
    ) {
        #expect(AnimationDelay.time(time).description == expected)
    }
}

// MARK: - Protocol Conformance

@Suite
struct `AnimationDelay - Global Values` {
    @Test(arguments: [
        (AnimationDelay.inherit, "inherit"),
        (AnimationDelay.initial, "initial"),
        (AnimationDelay.revert, "revert"),
        (AnimationDelay.revertLayer, "revert-layer"),
        (AnimationDelay.unset, "unset"),
    ])
    func `renders global values correctly`(
        value: AnimationDelay,
        expected: String
    ) {
        #expect(value.description == expected)
    }
}

@Suite
struct `AnimationDelay - Property Protocol` {
    @Test func `conforms to Property protocol`() {
        #expect(AnimationDelay.property == "animation-delay")
    }
}

// MARK: - Edge Cases

@Suite
struct `AnimationDelay - Edge Cases` {
    @Test func `handles very large delays`() {
        let largeDelay = AnimationDelay.s(999999)
        #expect(largeDelay.description == "999999s")
    }

    @Test func `handles very small delays`() {
        let smallDelay = AnimationDelay.ms(1)
        #expect(smallDelay.description == "1ms")
    }

    @Test func `handles fractional seconds`() {
        #expect(AnimationDelay.s(0.5).description == "0.5s")
        #expect(AnimationDelay.s(1.25).description == "1.25s")
    }

    @Test func `zero can be expressed in different units`() {
        #expect(AnimationDelay.s(0).description == "0s")
        #expect(AnimationDelay.ms(0).description == "0ms")
    }
}

// MARK: - Usage in Context

@Suite
struct `AnimationDelay - CSS Property Usage` {
    @Test func `renders correctly in CSS rule`() {
        let css = "animation-delay: \(AnimationDelay.s(1))"
        #expect(css == "animation-delay: 1s")
    }

    @Test func `declaration renders complete property`() {
        let decl = AnimationDelay.ms(500).declaration
        #expect(decl.description == "animation-delay:500ms")
    }

    @Test func `negative delay renders correctly`() {
        let css = "animation-delay: \(AnimationDelay.s(-0.5))"
        #expect(css == "animation-delay: -0.5s")
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `AnimationDelay - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `creation 100K times`() {
            for i in 0..<100_000 {
                _ = AnimationDelay.ms(Double(i))
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `description generation 100K times`() {
            let delay = AnimationDelay.s(2)
            for _ in 0..<100_000 {
                _ = delay.description
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `Time object creation 100K times`() {
            for i in 0..<100_000 {
                _ = AnimationDelay.time(Time.s(Double(i)))
            }
        }
    }
}
