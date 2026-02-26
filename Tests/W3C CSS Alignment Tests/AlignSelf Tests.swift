// AlignSelf Tests.swift
// swift-w3c-css
//
// Tests for CSS align-self property

import Testing

@testable import W3C_CSS_Alignment

// MARK: - Basic Functionality

@Suite
struct `AlignSelf - Property Protocol` {
    @Test func `align-self property name is correct`() {
        #expect(AlignSelf.property == "align-self")
    }
}

@Suite
struct `AlignSelf - Declaration Rendering` {
    @Test(arguments: [
        (AlignSelf.auto, "align-self:auto"),
        (AlignSelf.normal, "align-self:normal"),
        (AlignSelf.center, "align-self:center"),
        (AlignSelf.baseline, "align-self:baseline"),
        (AlignSelf.safe(.center), "align-self:safe center"),
    ])
    func `declaration renders correctly`(
        value: AlignSelf,
        expected: String
    ) {
        #expect(value.declaration.description == expected)
    }
}

// MARK: - Basic Values

@Suite
struct `AlignSelf - Auto Value` {
    @Test func `auto value renders correctly`() {
        #expect(AlignSelf.auto.description == "auto")
    }
}

@Suite
struct `AlignSelf - Normal and Stretch Values` {
    @Test(arguments: [
        (AlignSelf.normal, "normal"),
        (AlignSelf.stretch, "stretch"),
    ])
    func `normal and stretch values render correctly`(
        value: AlignSelf,
        expected: String
    ) {
        #expect(value.description == expected)
    }
}

@Suite
struct `AlignSelf - Anchor Center Value` {
    @Test func `anchor-center value renders correctly`() {
        #expect(AlignSelf.anchorCenter.description == "anchor-center")
    }
}

// MARK: - Baseline Positions

@Suite
struct `AlignSelf - Baseline Positions` {
    @Test(arguments: [
        (AlignSelf.baseline, "baseline"),
        (AlignSelf.firstBaseline, "first baseline"),
        (AlignSelf.lastBaseline, "last baseline"),
    ])
    func `baseline positions render correctly`(
        value: AlignSelf,
        expected: String
    ) {
        #expect(value.description == expected)
    }
}

// MARK: - Self Position Values

@Suite
struct `AlignSelf - Self Position Values` {
    @Test(arguments: [
        (AlignSelf.center, "center"),
        (AlignSelf.start, "start"),
        (AlignSelf.end, "end"),
        (AlignSelf.selfStart, "self-start"),
        (AlignSelf.selfEnd, "self-end"),
        (AlignSelf.flexStart, "flex-start"),
        (AlignSelf.flexEnd, "flex-end"),
    ])
    func `self position values render correctly`(
        value: AlignSelf,
        expected: String
    ) {
        #expect(value.description == expected)
    }
}

// MARK: - Overflow Position

@Suite
struct `AlignSelf - Overflow Position with Safe` {
    @Test(arguments: [
        (AlignSelf.safe(.center), "safe center"),
        (AlignSelf.safe(.start), "safe start"),
        (AlignSelf.safe(.end), "safe end"),
        (AlignSelf.safe(.flexEnd), "safe flex-end"),
        (AlignSelf.safe(.selfStart), "safe self-start"),
        (AlignSelf.safe(.selfEnd), "safe self-end"),
        (AlignSelf.safe(.flexStart), "safe flex-start"),
    ])
    func `safe overflow with self positions renders correctly`(
        value: AlignSelf,
        expected: String
    ) {
        #expect(value.description == expected)
    }
}

@Suite
struct `AlignSelf - Overflow Position with Unsafe` {
    @Test(arguments: [
        (AlignSelf.unsafe(.start), "unsafe start"),
        (AlignSelf.unsafe(.center), "unsafe center"),
        (AlignSelf.unsafe(.flexEnd), "unsafe flex-end"),
        (AlignSelf.unsafe(.selfStart), "unsafe self-start"),
        (AlignSelf.unsafe(.selfEnd), "unsafe self-end"),
    ])
    func `unsafe overflow with self positions renders correctly`(
        value: AlignSelf,
        expected: String
    ) {
        #expect(value.description == expected)
    }
}

// MARK: - Global Values

@Suite
struct `AlignSelf - Global Values` {
    @Test(arguments: [
        (AlignSelf.inherit, "inherit"),
        (AlignSelf.initial, "initial"),
        (AlignSelf.revert, "revert"),
        (AlignSelf.revertLayer, "revert-layer"),
        (AlignSelf.unset, "unset"),
    ])
    func `global values render correctly`(
        value: AlignSelf,
        expected: String
    ) {
        #expect(value.description == expected)
    }
}

// MARK: - Edge Cases

@Suite
struct `AlignSelf - Edge Cases` {
    @Test func `all self position values with safe overflow`() {
        let positions: [(AlignSelf, String)] = [
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
        let positions: [(AlignSelf, String)] = [
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

    @Test func `auto differs from normal`() {
        #expect(AlignSelf.auto.description != AlignSelf.normal.description)
        #expect(AlignSelf.auto.description == "auto")
        #expect(AlignSelf.normal.description == "normal")
    }
}

// MARK: - Usage in Context

@Suite
struct `AlignSelf - CSS Property Usage` {
    @Test func `align-self renders correctly in flexbox context`() {
        let css = "align-self: \(AlignSelf.center)"
        #expect(css == "align-self: center")
    }

    @Test func `align-self renders correctly with auto`() {
        let css = "align-self: \(AlignSelf.auto)"
        #expect(css == "align-self: auto")
    }

    @Test func `align-self renders correctly in grid context`() {
        let css = "align-self: \(AlignSelf.start)"
        #expect(css == "align-self: start")
    }

    @Test func `align-self renders correctly with safe overflow`() {
        let css = "align-self: \(AlignSelf.safe(.center))"
        #expect(css == "align-self: safe center")
    }

    @Test func `align-self renders correctly with anchor-center`() {
        let css = "align-self: \(AlignSelf.anchorCenter)"
        #expect(css == "align-self: anchor-center")
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `AlignSelf - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `align-self creation 100K times`() {
            for _ in 0..<100_000 {
                _ = AlignSelf.center
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `align-self description rendering 100K times`() {
            let value = AlignSelf.safe(.center)
            for _ in 0..<100_000 {
                _ = value.description
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `align-self declaration rendering 100K times`() {
            let value = AlignSelf.auto
            for _ in 0..<100_000 {
                _ = value.declaration.description
            }
        }
    }
}
