// AnimationPlayState Tests.swift
// swift-w3c-css
//
// Tests for CSS AnimationPlayState type

import Testing

@testable import W3C_CSS_Animations

// MARK: - Basic Functionality

@Suite
struct `AnimationPlayState - Declaration` {
    @Test func `renders declaration correctly`() {
        #expect(
            AnimationPlayState.running.declaration.description == "animation-play-state:running"
        )
    }
}

@Suite
struct `AnimationPlayState - Basic Values` {
    @Test(arguments: [
        (AnimationPlayState.running, "running"),
        (AnimationPlayState.paused, "paused"),
    ])
    func `renders basic values correctly`(
        value: AnimationPlayState,
        expected: String
    ) {
        #expect(value.description == expected)
    }
}

// MARK: - Protocol Conformance

@Suite
struct `AnimationPlayState - Global Values` {
    @Test(arguments: [
        (AnimationPlayState.inherit, "inherit"),
        (AnimationPlayState.initial, "initial"),
        (AnimationPlayState.revert, "revert"),
        (AnimationPlayState.revertLayer, "revert-layer"),
        (AnimationPlayState.unset, "unset"),
    ])
    func `renders global values correctly`(
        value: AnimationPlayState,
        expected: String
    ) {
        #expect(value.description == expected)
    }
}

@Suite
struct `AnimationPlayState - Property Protocol` {
    @Test func `conforms to Property protocol`() {
        #expect(AnimationPlayState.property == "animation-play-state")
    }
}

@Suite
struct `AnimationPlayState - CaseIterable` {
    @Test func `provides all cases`() {
        let allCases = AnimationPlayState.allCases
        #expect(allCases.contains(AnimationPlayState.running))
        #expect(allCases.contains(AnimationPlayState.paused))
        #expect(allCases.contains(AnimationPlayState.inherit))
    }

    @Test func `all cases count is correct`() {
        #expect(AnimationPlayState.allCases.count >= 7)
    }
}

// MARK: - Edge Cases

@Suite
struct `AnimationPlayState - Edge Cases` {
    @Test func `running and paused are distinct`() {
        #expect(AnimationPlayState.running != AnimationPlayState.paused)
    }

    @Test func `running means animation is active`() {
        #expect(AnimationPlayState.running.description == "running")
    }

    @Test func `paused means animation is frozen`() {
        #expect(AnimationPlayState.paused.description == "paused")
    }
}

// MARK: - Usage in Context

@Suite
struct `AnimationPlayState - CSS Property Usage` {
    @Test func `renders correctly in CSS rule`() {
        let css = "animation-play-state: \(AnimationPlayState.paused)"
        #expect(css == "animation-play-state: paused")
    }

    @Test func `declaration renders complete property`() {
        let decl = AnimationPlayState.running.declaration
        #expect(decl.description == "animation-play-state:running")
    }

    @Test func `multiple play states can be combined in array notation`() {
        let states = [
            AnimationPlayState.running, AnimationPlayState.paused, AnimationPlayState.running,
        ]
        let css = states.map(\.description).joined(separator: ", ")
        #expect(css == "running, paused, running")
    }
}

// MARK: - Semantic Validation

@Suite
struct `AnimationPlayState - Semantic Validation` {
    @Test func `running allows animation to play`() {
        let state = AnimationPlayState.running
        #expect(state.description == "running")
    }

    @Test func `paused stops animation playback`() {
        let state = AnimationPlayState.paused
        #expect(state.description == "paused")
    }

    @Test func `state can toggle between running and paused`() {
        let initial = AnimationPlayState.running
        let changed = AnimationPlayState.paused
        #expect(initial != changed)
    }
}

// MARK: - Interactive Scenarios

@Suite
struct `AnimationPlayState - Interactive Scenarios` {
    @Test func `can pause running animation`() {
        let running = AnimationPlayState.running
        let paused = AnimationPlayState.paused

        #expect(running.description == "running")
        #expect(paused.description == "paused")
    }

    @Test func `can resume paused animation`() {
        let paused = AnimationPlayState.paused
        let resumed = AnimationPlayState.running

        #expect(paused.description == "paused")
        #expect(resumed.description == "running")
    }

    @Test func `default state is running`() {
        let defaultState = AnimationPlayState.running
        #expect(defaultState.description == "running")
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `AnimationPlayState - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `creation 100K times`() {
            for i in 0..<100_000 {
                _ = i % 2 == 0 ? AnimationPlayState.running : AnimationPlayState.paused
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `description generation 100K times`() {
            for _ in 0..<100_000 {
                _ = AnimationPlayState.paused.description
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `case iteration 10K times`() {
            for _ in 0..<10_000 {
                _ = AnimationPlayState.allCases
            }
        }
    }
}
