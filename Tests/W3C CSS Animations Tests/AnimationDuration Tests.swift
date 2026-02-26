// AnimationDuration Tests.swift
// swift-w3c-css
//
// Tests for CSS AnimationDuration type

import Testing
import W3C_CSS_Values

@testable import W3C_CSS_Animations

// MARK: - Basic Functionality

@Suite
struct `AnimationDuration - Declaration` {
    @Test func `renders declaration correctly`() {
        #expect(AnimationDuration.auto.declaration.description == "animation-duration:auto")
    }
}

@Suite
struct `AnimationDuration - Auto Value` {
    @Test func `renders auto value correctly`() {
        #expect(AnimationDuration.auto.description == "auto")
    }
}

@Suite
struct `AnimationDuration - Time Values` {
    @Test(arguments: [
        (AnimationDuration.s(3), "3s"),
        (AnimationDuration.ms(750), "750ms"),
        (AnimationDuration.zero, "0s"),
        (AnimationDuration.s(0.5), "0.5s"),
    ])
    func `renders time values correctly`(
        value: AnimationDuration,
        expected: String
    ) {
        #expect(value.description == expected)
    }

    @Test func `zero constant has correct value`() {
        #expect(AnimationDuration.zero.description == "0s")
    }
}

@Suite
struct `AnimationDuration - Non-Negative Values` {
    @Test(arguments: [
        (AnimationDuration.s(-1), "0s"),
        (AnimationDuration.ms(-500), "0ms"),
        (AnimationDuration.s(-0.5), "0s"),
    ])
    func `enforces non-negative values`(
        value: AnimationDuration,
        expected: String
    ) {
        #expect(value.description == expected)
    }

    @Test func `negative values clamp to zero`() {
        #expect(AnimationDuration.s(-10).description == "0s")
        #expect(AnimationDuration.ms(-1000).description == "0ms")
    }
}

@Suite
struct `AnimationDuration - Time Objects` {
    @Test(arguments: [
        (Time.s(2.5), "2.5s"),
        (Time.ms(250), "250ms"),
        (Time.s(0), "0s"),
    ])
    func `renders Time objects correctly`(
        time: Time,
        expected: String
    ) {
        #expect(AnimationDuration.time(time).description == expected)
    }
}

// MARK: - Protocol Conformance

@Suite
struct `AnimationDuration - Global Values` {
    @Test(arguments: [
        (AnimationDuration.inherit, "inherit"),
        (AnimationDuration.initial, "initial"),
        (AnimationDuration.revert, "revert"),
        (AnimationDuration.revertLayer, "revert-layer"),
        (AnimationDuration.unset, "unset"),
    ])
    func `renders global values correctly`(
        value: AnimationDuration,
        expected: String
    ) {
        #expect(value.description == expected)
    }
}

@Suite
struct `AnimationDuration - Property Protocol` {
    @Test func `conforms to Property protocol`() {
        #expect(AnimationDuration.property == "animation-duration")
    }
}

// MARK: - Edge Cases

@Suite
struct `AnimationDuration - Edge Cases` {
    @Test func `handles very large durations`() {
        let largeDuration = AnimationDuration.s(999999)
        #expect(largeDuration.description == "999999s")
    }

    @Test func `handles very small durations`() {
        let smallDuration = AnimationDuration.ms(1)
        #expect(smallDuration.description == "1ms")
    }

    @Test func `handles fractional seconds`() {
        #expect(AnimationDuration.s(1.25).description == "1.25s")
        #expect(AnimationDuration.s(0.1).description == "0.1s")
    }

    @Test func `zero can be expressed in different units`() {
        #expect(AnimationDuration.s(0).description == "0s")
        #expect(AnimationDuration.ms(0).description == "0ms")
    }

    @Test func `auto is distinct from numeric values`() {
        #expect(AnimationDuration.auto.description != AnimationDuration.s(0).description)
    }
}

// MARK: - Usage in Context

@Suite
struct `AnimationDuration - CSS Property Usage` {
    @Test func `renders correctly in CSS rule`() {
        let css = "animation-duration: \(AnimationDuration.s(2))"
        #expect(css == "animation-duration: 2s")
    }

    @Test func `declaration renders complete property`() {
        let decl = AnimationDuration.ms(500).declaration
        #expect(decl.description == "animation-duration:500ms")
    }

    @Test func `auto renders correctly in CSS rule`() {
        let css = "animation-duration: \(AnimationDuration.auto)"
        #expect(css == "animation-duration: auto")
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `AnimationDuration - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `creation 100K times`() {
            for i in 0..<100_000 {
                _ = AnimationDuration.ms(Double(i))
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `description generation 100K times`() {
            let duration = AnimationDuration.s(3)
            for _ in 0..<100_000 {
                _ = duration.description
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `Time object creation 100K times`() {
            for i in 0..<100_000 {
                _ = AnimationDuration.time(Time.s(Double(i)))
            }
        }
    }
}
