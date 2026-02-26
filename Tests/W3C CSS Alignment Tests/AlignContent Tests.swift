// AlignContent Tests.swift
// swift-w3c-css
//
// Tests for CSS align-content property

import Testing

@testable import W3C_CSS_Alignment

// MARK: - Basic Functionality

@Suite
struct `AlignContent - Property Protocol` {
    @Test func `align-content property name is correct`() {
        #expect(AlignContent.property == "align-content")
    }
}

@Suite
struct `AlignContent - Declaration Rendering` {
    @Test(arguments: [
        (AlignContent.normal, "align-content:normal"),
        (AlignContent.baseline, "align-content:baseline"),
        (AlignContent.spaceBetween, "align-content:space-between"),
        (AlignContent.center, "align-content:center"),
        (AlignContent.safe(.center), "align-content:safe center"),
    ])
    func `declaration renders correctly`(
        value: AlignContent,
        expected: String
    ) {
        #expect(value.declaration.description == expected)
    }
}

// MARK: - Value Types

@Suite
struct `AlignContent - Normal Value` {
    @Test func `normal value renders correctly`() {
        #expect(AlignContent.normal.description == "normal")
    }
}

@Suite
struct `AlignContent - Baseline Positions` {
    @Test(arguments: [
        (AlignContent.baseline, "baseline"),
        (AlignContent.firstBaseline, "first baseline"),
        (AlignContent.lastBaseline, "last baseline"),
    ])
    func `baseline positions render correctly`(
        value: AlignContent,
        expected: String
    ) {
        #expect(value.description == expected)
    }
}

@Suite
struct `AlignContent - Content Distribution` {
    @Test(arguments: [
        (AlignContent.spaceBetween, "space-between"),
        (AlignContent.spaceAround, "space-around"),
        (AlignContent.spaceEvenly, "space-evenly"),
        (AlignContent.stretch, "stretch"),
    ])
    func `content distribution values render correctly`(
        value: AlignContent,
        expected: String
    ) {
        #expect(value.description == expected)
    }
}

@Suite
struct `AlignContent - Content Position` {
    @Test(arguments: [
        (AlignContent.start, "start"),
        (AlignContent.center, "center"),
        (AlignContent.end, "end"),
        (AlignContent.flexStart, "flex-start"),
        (AlignContent.flexEnd, "flex-end"),
    ])
    func `content position values render correctly`(
        value: AlignContent,
        expected: String
    ) {
        #expect(value.description == expected)
    }
}

@Suite
struct `AlignContent - Overflow Position` {
    @Test(arguments: [
        (AlignContent.safe(.center), "safe center"),
        (AlignContent.unsafe(.start), "unsafe start"),
        (AlignContent.safe(.end), "safe end"),
        (AlignContent.unsafe(.flexStart), "unsafe flex-start"),
        (AlignContent.safe(.flexEnd), "safe flex-end"),
        (AlignContent.unsafe(.center), "unsafe center"),
    ])
    func `overflow position with content position renders correctly`(
        value: AlignContent,
        expected: String
    ) {
        #expect(value.description == expected)
    }
}

// MARK: - Global Values

@Suite
struct `AlignContent - Global Values` {
    @Test(arguments: [
        (AlignContent.inherit, "inherit"),
        (AlignContent.initial, "initial"),
        (AlignContent.revert, "revert"),
        (AlignContent.revertLayer, "revert-layer"),
        (AlignContent.unset, "unset"),
    ])
    func `global values render correctly`(
        value: AlignContent,
        expected: String
    ) {
        #expect(value.description == expected)
    }
}

// MARK: - Edge Cases

@Suite
struct `AlignContent - Edge Cases` {
    @Test func `safe overflow with all content positions`() {
        let positions: [(AlignContent, String)] = [
            (.safe(.start), "safe start"),
            (.safe(.center), "safe center"),
            (.safe(.end), "safe end"),
            (.safe(.flexStart), "safe flex-start"),
            (.safe(.flexEnd), "safe flex-end"),
        ]

        for (value, expected) in positions {
            #expect(value.description == expected)
        }
    }

    @Test func `unsafe overflow with all content positions`() {
        let positions: [(AlignContent, String)] = [
            (.unsafe(.start), "unsafe start"),
            (.unsafe(.center), "unsafe center"),
            (.unsafe(.end), "unsafe end"),
            (.unsafe(.flexStart), "unsafe flex-start"),
            (.unsafe(.flexEnd), "unsafe flex-end"),
        ]

        for (value, expected) in positions {
            #expect(value.description == expected)
        }
    }
}

// MARK: - Usage in Context

@Suite
struct `AlignContent - CSS Property Usage` {
    @Test func `align-content renders correctly in flexbox context`() {
        let css = "align-content: \(AlignContent.spaceBetween)"
        #expect(css == "align-content: space-between")
    }

    @Test func `align-content renders correctly in grid context`() {
        let css = "align-content: \(AlignContent.center)"
        #expect(css == "align-content: center")
    }

    @Test func `align-content renders correctly with safe overflow`() {
        let css = "align-content: \(AlignContent.safe(.center))"
        #expect(css == "align-content: safe center")
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `AlignContent - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `align-content creation 100K times`() {
            for _ in 0..<100_000 {
                _ = AlignContent.center
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `align-content description rendering 100K times`() {
            let value = AlignContent.safe(.center)
            for _ in 0..<100_000 {
                _ = value.description
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `align-content declaration rendering 100K times`() {
            let value = AlignContent.spaceBetween
            for _ in 0..<100_000 {
                _ = value.declaration.description
            }
        }
    }
}
