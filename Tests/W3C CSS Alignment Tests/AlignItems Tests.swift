// AlignItems Tests.swift
// swift-w3c-css
//
// Tests for CSS align-items property

import Testing

@testable import W3C_CSS_Alignment

// MARK: - Basic Functionality

@Suite
struct `AlignItems - Property Protocol` {
    @Test func `align-items property name is correct`() {
        #expect(AlignItems.property == "align-items")
    }
}

@Suite
struct `AlignItems - Declaration Rendering` {
    @Test(arguments: [
        (AlignItems.normal, "align-items:normal"),
        (AlignItems.stretch, "align-items:stretch"),
        (AlignItems.center, "align-items:center"),
        (AlignItems.baseline, "align-items:baseline"),
        (AlignItems.safe(.center), "align-items:safe center"),
    ])
    func `declaration renders correctly`(
        value: AlignItems,
        expected: String
    ) {
        #expect(value.declaration.description == expected)
    }
}

// MARK: - Basic Values

@Suite
struct `AlignItems - Basic Values` {
    @Test(arguments: [
        (AlignItems.normal, "normal"),
        (AlignItems.stretch, "stretch"),
        (AlignItems.anchorCenter, "anchor-center"),
    ])
    func `basic values render correctly`(
        value: AlignItems,
        expected: String
    ) {
        #expect(value.description == expected)
    }
}

// MARK: - Baseline Positions

@Suite
struct `AlignItems - Baseline Positions` {
    @Test(arguments: [
        (AlignItems.baseline, "baseline"),
        (AlignItems.firstBaseline, "first baseline"),
        (AlignItems.lastBaseline, "last baseline"),
        (AlignItems.baseline(.firstBaseline), "first baseline"),
        (AlignItems.baseline(.lastBaseline), "last baseline"),
    ])
    func `baseline positions render correctly`(
        value: AlignItems,
        expected: String
    ) {
        #expect(value.description == expected)
    }
}

// MARK: - Self Position Values

@Suite
struct `AlignItems - Self Position Values` {
    @Test(arguments: [
        (AlignItems.center, "center"),
        (AlignItems.start, "start"),
        (AlignItems.end, "end"),
        (AlignItems.selfStart, "self-start"),
        (AlignItems.selfEnd, "self-end"),
        (AlignItems.flexStart, "flex-start"),
        (AlignItems.flexEnd, "flex-end"),
    ])
    func `self position values render correctly`(
        value: AlignItems,
        expected: String
    ) {
        #expect(value.description == expected)
    }
}

// MARK: - Overflow Position

@Suite
struct `AlignItems - Overflow Position with Safe` {
    @Test(arguments: [
        (AlignItems.safe(.center), "safe center"),
        (AlignItems.safe(.end), "safe end"),
        (AlignItems.safe(.flexStart), "safe flex-start"),
        (AlignItems.safe(.selfStart), "safe self-start"),
        (AlignItems.safe(.selfEnd), "safe self-end"),
        (AlignItems.safe(.flexEnd), "safe flex-end"),
    ])
    func `safe overflow with self positions renders correctly`(
        value: AlignItems,
        expected: String
    ) {
        #expect(value.description == expected)
    }
}

@Suite
struct `AlignItems - Overflow Position with Unsafe` {
    @Test(arguments: [
        (AlignItems.unsafe(.start), "unsafe start"),
        (AlignItems.unsafe(.flexStart), "unsafe flex-start"),
        (AlignItems.unsafe(.selfStart), "unsafe self-start"),
        (AlignItems.unsafe(.selfEnd), "unsafe self-end"),
    ])
    func `unsafe overflow with self positions renders correctly`(
        value: AlignItems,
        expected: String
    ) {
        #expect(value.description == expected)
    }
}

@Suite
struct `AlignItems - Overflow Position with Function Syntax` {
    @Test(arguments: [
        (AlignItems.position(.safe, .center), "safe center"),
        (AlignItems.position(.unsafe, .end), "unsafe end"),
        (AlignItems.position(.safe, .flexStart), "safe flex-start"),
        (AlignItems.position(.unsafe, .selfStart), "unsafe self-start"),
    ])
    func `position function with overflow parameter renders correctly`(
        value: AlignItems,
        expected: String
    ) {
        #expect(value.description == expected)
    }
}

// MARK: - Global Values

@Suite
struct `AlignItems - Global Values` {
    @Test(arguments: [
        (AlignItems.inherit, "inherit"),
        (AlignItems.initial, "initial"),
        (AlignItems.revert, "revert"),
        (AlignItems.revertLayer, "revert-layer"),
        (AlignItems.unset, "unset"),
    ])
    func `global values render correctly`(
        value: AlignItems,
        expected: String
    ) {
        #expect(value.description == expected)
    }
}

// MARK: - Edge Cases

@Suite
struct `AlignItems - Edge Cases` {
    @Test func `all self position values with safe overflow`() {
        let positions: [(AlignItems, String)] = [
            (.safe(.center), "safe center"),
            (.safe(.start), "safe start"),
            (.safe(.end), "safe end"),
            (.safe(.selfStart), "safe self-start"),
            (.safe(.selfEnd), "safe self-end"),
            (.safe(.flexStart), "safe flex-start"),
            (.safe(.flexEnd), "safe flex-end"),
        ]

        for (value, expected) in positions {
            #expect(value.description == expected)
        }
    }

    @Test func `all self position values with unsafe overflow`() {
        let positions: [(AlignItems, String)] = [
            (.unsafe(.center), "unsafe center"),
            (.unsafe(.start), "unsafe start"),
            (.unsafe(.end), "unsafe end"),
            (.unsafe(.selfStart), "unsafe self-start"),
            (.unsafe(.selfEnd), "unsafe self-end"),
            (.unsafe(.flexStart), "unsafe flex-start"),
            (.unsafe(.flexEnd), "unsafe flex-end"),
        ]

        for (value, expected) in positions {
            #expect(value.description == expected)
        }
    }

    @Test func `baseline with both first and last variants`() {
        #expect(AlignItems.baseline(.firstBaseline).description == "first baseline")
        #expect(AlignItems.baseline(.lastBaseline).description == "last baseline")
    }
}

// MARK: - Usage in Context

@Suite
struct `AlignItems - CSS Property Usage` {
    @Test func `align-items renders correctly in flexbox context`() {
        let css = "align-items: \(AlignItems.center)"
        #expect(css == "align-items: center")
    }

    @Test func `align-items renders correctly in grid context`() {
        let css = "align-items: \(AlignItems.start)"
        #expect(css == "align-items: start")
    }

    @Test func `align-items renders correctly with safe overflow`() {
        let css = "align-items: \(AlignItems.safe(.center))"
        #expect(css == "align-items: safe center")
    }

    @Test func `align-items renders correctly with anchor-center`() {
        let css = "align-items: \(AlignItems.anchorCenter)"
        #expect(css == "align-items: anchor-center")
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `AlignItems - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `align-items creation 100K times`() {
            for _ in 0..<100_000 {
                _ = AlignItems.center
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `align-items description rendering 100K times`() {
            let value = AlignItems.safe(.center)
            for _ in 0..<100_000 {
                _ = value.description
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `align-items declaration rendering 100K times`() {
            let value: AlignItems = .baseline
            for _ in 0..<100_000 {
                _ = value.declaration.description
            }
        }
    }
}
