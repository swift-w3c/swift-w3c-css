// OverflowPosition Tests.swift
// swift-w3c-css
//
// Tests for CSS OverflowPosition type

import Testing

@testable import W3C_CSS_Shared

// MARK: - Basic Functionality

@Suite
struct `OverflowPosition - Initialization` {
    @Test(arguments: [
        (OverflowPosition.safe, "safe"),
        (OverflowPosition.unsafe, "unsafe"),
    ])
    func `overflow position renders with correct description`(
        position: OverflowPosition,
        expected: String
    ) {
        #expect(position.description == expected)
    }

    @Test func `safe value is correct`() {
        let safe = OverflowPosition.safe
        #expect(safe.description == "safe")
    }

    @Test func `unsafe value is correct`() {
        let unsafe = OverflowPosition.unsafe
        #expect(unsafe.description == "unsafe")
    }
}

// MARK: - Protocol Conformance

@Suite
struct `OverflowPosition - Hashable Conformance` {
    @Test func `equal values are equal`() {
        let safe1 = OverflowPosition.safe
        let safe2 = OverflowPosition.safe
        #expect(safe1 == safe2)
    }

    @Test func `different values are not equal`() {
        let safe = OverflowPosition.safe
        let unsafe = OverflowPosition.unsafe
        #expect(safe != unsafe)
    }

    @Test func `all values are distinct`() {
        let values = [
            OverflowPosition.safe,
            OverflowPosition.unsafe,
        ]
        let uniqueValues = Set(values)
        #expect(uniqueValues.count == values.count)
    }
}

@Suite
struct `OverflowPosition - CaseIterable Conformance` {
    @Test func `all cases contains all overflow position values`() {
        let allCases = OverflowPosition.allCases
        #expect(allCases.count == 2)
        #expect(allCases.contains(.safe))
        #expect(allCases.contains(.unsafe))
    }

    @Test func `can iterate over all cases`() {
        var count = 0
        for position in OverflowPosition.allCases {
            #expect(position.description == position.rawValue)
            count += 1
        }
        #expect(count == 2)
    }
}

@Suite
struct `OverflowPosition - RawRepresentable Conformance` {
    @Test func `raw values match CSS specifications`() {
        #expect(OverflowPosition.safe.rawValue == "safe")
        #expect(OverflowPosition.unsafe.rawValue == "unsafe")
    }

    @Test func `description uses raw value`() {
        for position in OverflowPosition.allCases {
            #expect(position.description == position.rawValue)
        }
    }

    @Test(arguments: [
        ("safe", OverflowPosition.safe),
        ("unsafe", OverflowPosition.unsafe),
    ])
    func `initialization from raw value works correctly`(
        rawValue: String,
        expected: OverflowPosition
    ) {
        let position = OverflowPosition(rawValue: rawValue)
        #expect(position == expected)
    }

    @Test func `initialization with invalid raw value returns nil`() {
        let invalid = OverflowPosition(rawValue: "invalid")
        #expect(invalid == nil)
    }
}

// MARK: - Usage in Context

@Suite
struct `OverflowPosition - CSS Property Usage` {
    @Test func `safe overflow position renders correctly in align-items property`() {
        let alignItems = "align-items: \(OverflowPosition.safe) center"
        #expect(alignItems == "align-items: safe center")
    }

    @Test func `unsafe overflow position renders correctly in justify-content property`() {
        let justifyContent = "justify-content: \(OverflowPosition.unsafe) flex-end"
        #expect(justifyContent == "justify-content: unsafe flex-end")
    }

    @Test func `safe overflow position renders correctly in align-self property`() {
        let alignSelf = "align-self: \(OverflowPosition.safe) start"
        #expect(alignSelf == "align-self: safe start")
    }

    @Test func `unsafe overflow position renders correctly in justify-self property`() {
        let justifySelf = "justify-self: \(OverflowPosition.unsafe) stretch"
        #expect(justifySelf == "justify-self: unsafe stretch")
    }

    @Test func `safe combined with content position`() {
        let alignContent = "align-content: \(OverflowPosition.safe) flex-start"
        #expect(alignContent == "align-content: safe flex-start")
    }

    @Test func `unsafe combined with self position`() {
        let alignSelf = "align-self: \(OverflowPosition.unsafe) self-end"
        #expect(alignSelf == "align-self: unsafe self-end")
    }
}

// MARK: - Edge Cases

@Suite
struct `OverflowPosition - Edge Cases` {
    @Test func `safe ensures content remains visible during overflow`() {
        let safe = OverflowPosition.safe
        #expect(safe.description == "safe")
        #expect(safe.rawValue == "safe")
    }

    @Test func `unsafe honors alignment even with overflow`() {
        let unsafe = OverflowPosition.unsafe
        #expect(unsafe.description == "unsafe")
        #expect(unsafe.rawValue == "unsafe")
    }

    @Test func `safe and unsafe are opposites`() {
        let safe = OverflowPosition.safe
        let unsafe = OverflowPosition.unsafe
        #expect(safe != unsafe)
        #expect(safe.description != unsafe.description)
    }

    @Test func `overflow position modifies alignment behavior`() {
        // Safe overflow position ensures content visibility
        let safeAlignment = "align-items: \(OverflowPosition.safe) center"
        #expect(safeAlignment.contains("safe"))
        #expect(safeAlignment.contains("center"))

        // Unsafe overflow position honors alignment even if content overflows
        let unsafeAlignment = "align-items: \(OverflowPosition.unsafe) center"
        #expect(unsafeAlignment.contains("unsafe"))
        #expect(unsafeAlignment.contains("center"))
    }
}

// MARK: - CSS Specification Compliance

@Suite
struct `OverflowPosition - CSS Specification` {
    @Test func `safe prevents data loss on overflow`() {
        // Safe overflow position specification:
        // If the alignment would cause overflow that would result in data loss,
        // align as if the alignment mode were start
        let safe = OverflowPosition.safe
        #expect(safe.description == "safe")
    }

    @Test func `unsafe allows data loss on overflow`() {
        // Unsafe overflow position specification:
        // Honor the alignment even if it causes overflow that results in data loss
        let unsafe = OverflowPosition.unsafe
        #expect(unsafe.description == "unsafe")
    }

    @Test func `overflow position is optional in alignment properties`() {
        // Overflow position can be omitted in which case it defaults to unsafe
        // This test verifies that both safe and unsafe are valid values
        let allCases = OverflowPosition.allCases
        #expect(allCases.count == 2)
        #expect(allCases.contains(.safe))
        #expect(allCases.contains(.unsafe))
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `OverflowPosition - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `overflow position description 100K times`() {
            for _ in 0..<100_000 {
                _ = OverflowPosition.safe.description
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `overflow position equality 100K times`() {
            let safe = OverflowPosition.safe
            let unsafe = OverflowPosition.unsafe
            for _ in 0..<100_000 {
                _ = safe == unsafe
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `overflow position hashing 100K times`() {
            for _ in 0..<100_000 {
                _ = OverflowPosition.safe.hashValue
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `overflow position iteration 100K times`() {
            for _ in 0..<100_000 {
                for _ in OverflowPosition.allCases {
                    // Iterate through all cases
                }
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `overflow position raw value initialization 100K times`() {
            for _ in 0..<100_000 {
                _ = OverflowPosition(rawValue: "safe")
            }
        }
    }
}
