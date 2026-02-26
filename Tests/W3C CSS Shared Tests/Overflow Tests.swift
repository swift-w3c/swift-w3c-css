// Overflow Tests.swift
// swift-w3c-css
//
// Tests for CSS Overflow type

import Testing

@testable import W3C_CSS_Shared

// MARK: - Basic Functionality

@Suite
struct `Overflow - Enum Cases` {
    @Test(arguments: [
        (Overflow.visible, "visible"),
        (Overflow.hidden, "hidden"),
        (Overflow.clip, "clip"),
        (Overflow.scroll, "scroll"),
        (Overflow.auto, "auto"),
        (Overflow.overlay, "overlay"),
    ])
    func `enum cases have correct raw values`(
        overflow: Overflow,
        expected: String
    ) {
        #expect(overflow.rawValue == expected)
    }
}

@Suite
struct `Overflow - Description` {
    @Test(arguments: [
        (Overflow.visible, "visible"),
        (Overflow.hidden, "hidden"),
        (Overflow.clip, "clip"),
        (Overflow.scroll, "scroll"),
        (Overflow.auto, "auto"),
        (Overflow.overlay, "overlay"),
    ])
    func `description returns raw value`(
        overflow: Overflow,
        expected: String
    ) {
        #expect(overflow.description == expected)
    }
}

// MARK: - Protocol Conformance

@Suite
struct `Overflow - Hashable Conformance` {
    @Test func `equal cases are equal`() {
        let overflow1 = Overflow.visible
        let overflow2 = Overflow.visible
        #expect(overflow1 == overflow2)
    }

    @Test func `different cases are not equal`() {
        let overflow1 = Overflow.visible
        let overflow3 = Overflow.hidden
        #expect(overflow1 != overflow3)
    }
}

@Suite
struct `Overflow - CaseIterable Conformance` {
    @Test func `all cases count is correct`() {
        let allCases = Overflow.allCases
        #expect(allCases.count == 5)
    }

    @Test func `all cases contains standard values`() {
        let allCases = Overflow.allCases
        #expect(allCases.contains(.visible))
        #expect(allCases.contains(.hidden))
        #expect(allCases.contains(.clip))
        #expect(allCases.contains(.scroll))
        #expect(allCases.contains(.auto))
    }

    @Test func `deprecated case not in all cases`() {
        let allCases = Overflow.allCases
        #expect(!allCases.contains(.overlay))
    }
}

@Suite
struct `Overflow - RawValue Initialization` {
    @Test(arguments: [
        ("visible", Overflow.visible),
        ("hidden", Overflow.hidden),
        ("clip", Overflow.clip),
        ("scroll", Overflow.scroll),
        ("auto", Overflow.auto),
        ("overlay", Overflow.overlay),
    ])
    func `initializes from valid raw values`(
        rawValue: String,
        expected: Overflow
    ) {
        #expect(Overflow(rawValue: rawValue) == expected)
    }

    @Test func `returns nil for invalid raw value`() {
        #expect(Overflow(rawValue: "invalid") == nil)
    }
}

// MARK: - Usage in Context

@Suite
struct `Overflow - CSS Property Usage` {
    @Test func `overflow renders correctly in overflow property`() {
        let overflowVisible = "overflow: \(Overflow.visible)"
        #expect(overflowVisible == "overflow: visible")

        let overflowHidden = "overflow: \(Overflow.hidden)"
        #expect(overflowHidden == "overflow: hidden")
    }

    @Test func `overflow renders correctly in overflow-x property`() {
        let overflowXScroll = "overflow-x: \(Overflow.scroll)"
        #expect(overflowXScroll == "overflow-x: scroll")
    }

    @Test func `overflow renders correctly in overflow-y property`() {
        let overflowYAuto = "overflow-y: \(Overflow.auto)"
        #expect(overflowYAuto == "overflow-y: auto")
    }

    @Test func `overflow renders correctly in overflow-block property`() {
        let overflowBlockClip = "overflow-block: \(Overflow.clip)"
        #expect(overflowBlockClip == "overflow-block: clip")
    }

    @Test func `deprecated overlay value renders correctly`() {
        let overflowOverlay = "overflow: \(Overflow.overlay)"
        #expect(overflowOverlay == "overflow: overlay")
    }
}

// MARK: - CSS Specification

@Suite
struct `Overflow - CSS Specification Compliance` {
    @Test func `visible means content is not clipped`() {
        #expect(Overflow.visible.description == "visible")
    }

    @Test func `hidden means content is clipped without scrollbars`() {
        #expect(Overflow.hidden.description == "hidden")
    }

    @Test func `clip means content is clipped without scrolling`() {
        #expect(Overflow.clip.description == "clip")
    }

    @Test func `scroll means content is clipped with scrollbars`() {
        #expect(Overflow.scroll.description == "scroll")
    }

    @Test func `auto means scrollbars shown only when needed`() {
        #expect(Overflow.auto.description == "auto")
    }

    @Test func `overlay is deprecated but supported`() {
        #expect(Overflow.overlay.description == "overlay")
    }
}

// MARK: - Edge Cases

@Suite
struct `Overflow - Edge Cases` {
    @Test func `all non-deprecated cases iterate correctly`() {
        var count = 0
        for overflow in Overflow.allCases {
            count += 1
            #expect(overflow != .overlay)
        }
        #expect(count == 5)
    }

    @Test func `deprecated overlay can still be constructed`() {
        let overlay = Overflow.overlay
        #expect(overlay.rawValue == "overlay")
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `Overflow - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `overflow case access 100K times`() {
            for _ in 0..<100_000 {
                _ = Overflow.visible
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `overflow raw value initialization 100K times`() {
            for _ in 0..<100_000 {
                _ = Overflow(rawValue: "hidden")
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `overflow comparison 100K times`() {
            let overflow1 = Overflow.visible
            for _ in 0..<100_000 {
                _ = Overflow.hidden == overflow1
            }
        }
    }
}
