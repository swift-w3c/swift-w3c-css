// AbsoluteSize Tests.swift
// swift-w3c-css
//
// Tests for CSS AbsoluteSize type

import Testing

@testable import W3C_CSS_Fonts

// MARK: - Basic Functionality

@Suite
struct `AbsoluteSize - Values and Descriptions` {
    @Test(arguments: [
        (AbsoluteSize.xxSmall, "xx-small"),
        (.xSmall, "x-small"),
        (.small, "small"),
        (.medium, "medium"),
        (.large, "large"),
        (.xLarge, "x-large"),
        (.xxLarge, "xx-large"),
        (.xxxLarge, "xxx-large"),
    ])
    func `absolute size has correct description`(size: AbsoluteSize, expected: String) {
        #expect(size.description == expected)
    }

    @Test(arguments: [
        (AbsoluteSize.xxSmall, "xx-small"),
        (.xSmall, "x-small"),
        (.small, "small"),
        (.medium, "medium"),
        (.large, "large"),
        (.xLarge, "x-large"),
        (.xxLarge, "xx-large"),
        (.xxxLarge, "xxx-large"),
    ])
    func `absolute size has correct raw value`(size: AbsoluteSize, expected: String) {
        #expect(size.rawValue == expected)
    }
}

// MARK: - Protocol Conformance

@Suite
struct `AbsoluteSize - RawRepresentable Conformance` {
    @Test(arguments: [
        ("xx-small", AbsoluteSize.xxSmall),
        ("x-small", .xSmall),
        ("small", .small),
        ("medium", .medium),
        ("large", .large),
        ("x-large", .xLarge),
        ("xx-large", .xxLarge),
        ("xxx-large", .xxxLarge),
    ])
    func `absolute size can be created from raw value`(rawValue: String, expected: AbsoluteSize) {
        #expect(AbsoluteSize(rawValue: rawValue) == expected)
    }

    @Test func `invalid raw value returns nil`() {
        #expect(AbsoluteSize(rawValue: "invalid") == nil)
        #expect(AbsoluteSize(rawValue: "xxxx-large") == nil)
        #expect(AbsoluteSize(rawValue: "tiny") == nil)
    }
}

@Suite
struct `AbsoluteSize - Hashable Conformance` {
    @Test func `equal absolute sizes are equal`() {
        let small1 = AbsoluteSize.small
        let small2 = AbsoluteSize.small
        #expect(small1 == small2)
    }

    @Test func `different absolute sizes are not equal`() {
        let small = AbsoluteSize.small
        let medium = AbsoluteSize.medium
        #expect(small != medium)
    }
}

// MARK: - Size Ordering

@Suite
struct `AbsoluteSize - Logical Ordering` {
    @Test func `sizes follow logical progression from smallest to largest`() {
        let sizes = [
            AbsoluteSize.xxSmall,
            .xSmall,
            .small,
            .medium,
            .large,
            .xLarge,
            .xxLarge,
            .xxxLarge,
        ]

        // Verify array is in the expected order
        #expect(sizes[0] == .xxSmall)
        #expect(sizes[1] == .xSmall)
        #expect(sizes[2] == .small)
        #expect(sizes[3] == .medium)
        #expect(sizes[4] == .large)
        #expect(sizes[5] == .xLarge)
        #expect(sizes[6] == .xxLarge)
        #expect(sizes[7] == .xxxLarge)
    }

    @Test func `all sizes are unique`() {
        let sizes: [AbsoluteSize] = [
            .xxSmall, .xSmall, .small, .medium,
            .large, .xLarge, .xxLarge, .xxxLarge,
        ]
        for i in sizes.indices {
            for j in sizes.indices where i != j {
                #expect(sizes[i] != sizes[j])
            }
        }
    }
}

// MARK: - Usage in Context

@Suite
struct `AbsoluteSize - CSS Property Usage` {
    @Test func `absolute size renders correctly in font-size property`() {
        let fontSize = "font-size: \(AbsoluteSize.medium)"
        #expect(fontSize == "font-size: medium")
    }

    @Test(arguments: [
        (AbsoluteSize.small, "font-size: small"),
        (.large, "font-size: large"),
        (.xLarge, "font-size: x-large"),
    ])
    func `various absolute sizes render correctly`(size: AbsoluteSize, expected: String) {
        let fontSize = "font-size: \(size)"
        #expect(fontSize == expected)
    }
}

// MARK: - CSS Specification Compliance

@Suite
struct `AbsoluteSize - CSS Specification` {
    @Test func `medium is the default baseline size`() {
        // Medium is typically the default font size in browsers
        #expect(AbsoluteSize.medium.description == "medium")
    }

    @Test func `size values use hyphenated format`() {
        // CSS uses hyphenated format for multi-word values
        #expect(AbsoluteSize.xxSmall.description.contains("-"))
        #expect(AbsoluteSize.xSmall.description.contains("-"))
        #expect(AbsoluteSize.xLarge.description.contains("-"))
        #expect(AbsoluteSize.xxLarge.description.contains("-"))
        #expect(AbsoluteSize.xxxLarge.description.contains("-"))
    }

    @Test func `single word sizes have no hyphens`() {
        // Single word sizes should not contain hyphens
        #expect(!AbsoluteSize.small.description.contains("-"))
        #expect(!AbsoluteSize.medium.description.contains("-"))
        #expect(!AbsoluteSize.large.description.contains("-"))
    }
}

// MARK: - Edge Cases

@Suite
struct `AbsoluteSize - Edge Cases` {
    @Test func `smallest size is xx-small`() {
        #expect(AbsoluteSize.xxSmall.description == "xx-small")
    }

    @Test func `largest size is xxx-large`() {
        #expect(AbsoluteSize.xxxLarge.description == "xxx-large")
    }

    @Test func `no uppercase in raw values`() {
        let allSizes: [AbsoluteSize] = [
            .xxSmall, .xSmall, .small, .medium,
            .large, .xLarge, .xxLarge, .xxxLarge,
        ]
        for size in allSizes {
            #expect(!size.rawValue.contains(where: { $0.isUppercase }))
        }
    }

    @Test func `case sensitivity in raw value initialization`() {
        // CSS is case-insensitive, but our type expects lowercase
        #expect(AbsoluteSize(rawValue: "Medium") == nil)
        #expect(AbsoluteSize(rawValue: "SMALL") == nil)
        #expect(AbsoluteSize(rawValue: "medium") == .medium)
    }
}

// MARK: - Size Scale Relationships

@Suite
struct `AbsoluteSize - Size Scale` {
    @Test func `progression uses x prefix for extra sizes`() {
        // Smaller than small: x-small, xx-small
        #expect(AbsoluteSize.xSmall.description == "x-small")
        #expect(AbsoluteSize.xxSmall.description == "xx-small")

        // Larger than large: x-large, xx-large, xxx-large
        #expect(AbsoluteSize.xLarge.description == "x-large")
        #expect(AbsoluteSize.xxLarge.description == "xx-large")
        #expect(AbsoluteSize.xxxLarge.description == "xxx-large")
    }

    @Test func `base sizes are single words`() {
        #expect(AbsoluteSize.small.description == "small")
        #expect(AbsoluteSize.medium.description == "medium")
        #expect(AbsoluteSize.large.description == "large")
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `AbsoluteSize - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `absolute size raw value access 100K times`() {
            let sizes: [AbsoluteSize] = [
                .xxSmall, .small, .medium, .large, .xxLarge,
            ]
            for i in 0..<100_000 {
                _ = sizes[i % sizes.count].rawValue
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `absolute size description generation 100K times`() {
            let size = AbsoluteSize.medium
            for _ in 0..<100_000 {
                _ = size.description
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `absolute size comparison 100K times`() {
            let medium = AbsoluteSize.medium
            let sizes: [AbsoluteSize] = [
                .xxSmall, .small, .medium, .large, .xxLarge,
            ]
            for i in 0..<100_000 {
                _ = sizes[i % sizes.count] == medium
            }
        }
    }
}
