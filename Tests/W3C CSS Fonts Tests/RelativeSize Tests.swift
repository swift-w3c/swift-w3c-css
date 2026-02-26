// RelativeSize Tests.swift
// swift-w3c-css
//
// Tests for CSS RelativeSize type

import Testing

@testable import W3C_CSS_Fonts

// MARK: - Basic Functionality

@Suite
struct `RelativeSize - Values and Descriptions` {
    @Test(arguments: [
        (RelativeSize.smaller, "smaller"),
        (.larger, "larger"),
    ])
    func `relative size has correct description`(size: RelativeSize, expected: String) {
        #expect(size.description == expected)
    }

    @Test(arguments: [
        (RelativeSize.smaller, "smaller"),
        (.larger, "larger"),
    ])
    func `relative size has correct raw value`(size: RelativeSize, expected: String) {
        #expect(size.rawValue == expected)
    }
}

// MARK: - Protocol Conformance

@Suite
struct `RelativeSize - CaseIterable Conformance` {
    @Test func `all cases contains both relative sizes`() {
        let allCases = RelativeSize.allCases
        #expect(allCases.count == 2)
        #expect(allCases.contains(.smaller))
        #expect(allCases.contains(.larger))
    }

    @Test func `all cases are in correct order`() {
        let allCases = RelativeSize.allCases
        #expect(allCases[0] == .smaller)
        #expect(allCases[1] == .larger)
    }
}

@Suite
struct `RelativeSize - Hashable Conformance` {
    @Test func `equal relative sizes are equal`() {
        let smaller1 = RelativeSize.smaller
        let smaller2 = RelativeSize.smaller
        #expect(smaller1 == smaller2)
    }

    @Test func `different relative sizes are not equal`() {
        let smaller = RelativeSize.smaller
        let larger = RelativeSize.larger
        #expect(smaller != larger)
    }
}

@Suite
struct `RelativeSize - RawRepresentable Conformance` {
    @Test(arguments: [
        ("smaller", RelativeSize.smaller),
        ("larger", .larger),
    ])
    func `relative size can be created from raw value`(rawValue: String, expected: RelativeSize) {
        #expect(RelativeSize(rawValue: rawValue) == expected)
    }

    @Test func `invalid raw value returns nil`() {
        #expect(RelativeSize(rawValue: "invalid") == nil)
        #expect(RelativeSize(rawValue: "small") == nil)
        #expect(RelativeSize(rawValue: "large") == nil)
        #expect(RelativeSize(rawValue: "medium") == nil)
    }
}

// MARK: - Usage in Context

@Suite
struct `RelativeSize - CSS Property Usage` {
    @Test func `smaller renders correctly in font-size property`() {
        let fontSize = "font-size: \(RelativeSize.smaller)"
        #expect(fontSize == "font-size: smaller")
    }

    @Test func `larger renders correctly in font-size property`() {
        let fontSize = "font-size: \(RelativeSize.larger)"
        #expect(fontSize == "font-size: larger")
    }

    @Test(arguments: [
        (RelativeSize.smaller, "font-size: smaller"),
        (.larger, "font-size: larger"),
    ])
    func `relative sizes render correctly in context`(size: RelativeSize, expected: String) {
        let fontSize = "font-size: \(size)"
        #expect(fontSize == expected)
    }
}

// MARK: - CSS Specification Compliance

@Suite
struct `RelativeSize - CSS Specification` {
    @Test func `smaller makes font one step smaller`() {
        // According to CSS spec, 'smaller' makes the font size one step smaller
        // relative to the parent element's font size
        #expect(RelativeSize.smaller.description == "smaller")
    }

    @Test func `larger makes font one step larger`() {
        // According to CSS spec, 'larger' makes the font size one step larger
        // relative to the parent element's font size
        #expect(RelativeSize.larger.description == "larger")
    }

    @Test func `relative sizes are context-dependent`() {
        // Unlike absolute sizes, relative sizes depend on the parent context
        // This test documents that behavior
        let smaller = RelativeSize.smaller
        let larger = RelativeSize.larger
        #expect(smaller.description == "smaller")
        #expect(larger.description == "larger")
    }
}

// MARK: - Edge Cases

@Suite
struct `RelativeSize - Edge Cases` {
    @Test func `no uppercase in raw values`() {
        let allSizes = RelativeSize.allCases
        for size in allSizes {
            #expect(!size.rawValue.contains(where: { $0.isUppercase }))
        }
    }

    @Test func `case sensitivity in raw value initialization`() {
        // CSS is case-insensitive, but our type expects lowercase
        #expect(RelativeSize(rawValue: "Smaller") == nil)
        #expect(RelativeSize(rawValue: "LARGER") == nil)
        #expect(RelativeSize(rawValue: "smaller") == .smaller)
    }

    @Test func `relative sizes are single words`() {
        #expect(!RelativeSize.smaller.description.contains(" "))
        #expect(!RelativeSize.larger.description.contains(" "))
        #expect(!RelativeSize.smaller.description.contains("-"))
        #expect(!RelativeSize.larger.description.contains("-"))
    }
}

// MARK: - Semantic Meaning

@Suite
struct `RelativeSize - Semantic Meaning` {
    @Test func `smaller and larger are semantic opposites`() {
        // These sizes represent opposite directions on the size scale
        let smaller = RelativeSize.smaller
        let larger = RelativeSize.larger

        #expect(smaller != larger)
        #expect(smaller.description != larger.description)
    }

    @Test func `relative sizes modify inherited size`() {
        // This test documents that relative sizes are relative to the parent
        // They don't specify absolute values like px or pt
        let smaller = RelativeSize.smaller
        let larger = RelativeSize.larger

        // Both should be simple keywords without units
        #expect(!smaller.description.contains("px"))
        #expect(!smaller.description.contains("pt"))
        #expect(!larger.description.contains("px"))
        #expect(!larger.description.contains("pt"))
    }
}

// MARK: - Comparison with Absolute Sizes

@Suite
struct `RelativeSize - Comparison with Absolute Sizes` {
    @Test func `relative sizes are distinct from absolute sizes`() {
        // Unlike AbsoluteSize (small, medium, large), RelativeSize uses comparative forms
        #expect(RelativeSize.smaller.description != "small")
        #expect(RelativeSize.larger.description != "large")
    }

    @Test func `only two relative size options exist`() {
        // CSS only defines two relative size keywords
        #expect(RelativeSize.allCases.count == 2)
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `RelativeSize - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `relative size raw value access 100K times`() {
            let sizes = RelativeSize.allCases
            for i in 0..<100_000 {
                _ = sizes[i % sizes.count].rawValue
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `relative size description generation 100K times`() {
            let size = RelativeSize.smaller
            for _ in 0..<100_000 {
                _ = size.description
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `relative size comparison 100K times`() {
            let smaller = RelativeSize.smaller
            let sizes = RelativeSize.allCases
            for i in 0..<100_000 {
                _ = sizes[i % sizes.count] == smaller
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `relative size case iteration 100K times`() {
            for _ in 0..<100_000 {
                _ = RelativeSize.allCases
            }
        }
    }
}
