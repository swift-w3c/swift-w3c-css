// SelfPosition Tests.swift
// swift-w3c-css
//
// Tests for CSS SelfPosition type

import Testing

@testable import W3C_CSS_Shared

// MARK: - Basic Functionality

@Suite
struct `SelfPosition - Initialization` {
    @Test(arguments: [
        (SelfPosition.center, "center"),
        (SelfPosition.start, "start"),
        (SelfPosition.end, "end"),
        (SelfPosition.selfStart, "self-start"),
        (SelfPosition.selfEnd, "self-end"),
        (SelfPosition.flexStart, "flex-start"),
        (SelfPosition.flexEnd, "flex-end"),
    ])
    func `self position renders with correct description`(
        position: SelfPosition,
        expected: String
    ) {
        #expect(position.description == expected)
    }

    @Test func `center value is correct`() {
        let center = SelfPosition.center
        #expect(center.description == "center")
    }

    @Test func `start value is correct`() {
        let start = SelfPosition.start
        #expect(start.description == "start")
    }

    @Test func `end value is correct`() {
        let end = SelfPosition.end
        #expect(end.description == "end")
    }

    @Test func `self-start value is correct`() {
        let selfStart = SelfPosition.selfStart
        #expect(selfStart.description == "self-start")
    }

    @Test func `self-end value is correct`() {
        let selfEnd = SelfPosition.selfEnd
        #expect(selfEnd.description == "self-end")
    }

    @Test func `flex-start value is correct`() {
        let flexStart = SelfPosition.flexStart
        #expect(flexStart.description == "flex-start")
    }

    @Test func `flex-end value is correct`() {
        let flexEnd = SelfPosition.flexEnd
        #expect(flexEnd.description == "flex-end")
    }
}

// MARK: - Protocol Conformance

@Suite
struct `SelfPosition - Hashable Conformance` {
    @Test func `equal values are equal`() {
        let center1 = SelfPosition.center
        let center2 = SelfPosition.center
        #expect(center1 == center2)
    }

    @Test func `different values are not equal`() {
        let center = SelfPosition.center
        let flexStart = SelfPosition.flexStart
        #expect(center != flexStart)
    }

    @Test func `self-start is not equal to self-end`() {
        let selfStart = SelfPosition.selfStart
        let selfEnd = SelfPosition.selfEnd
        #expect(selfStart != selfEnd)
    }

    @Test func `flex-start is not equal to flex-end`() {
        let flexStart = SelfPosition.flexStart
        let flexEnd = SelfPosition.flexEnd
        #expect(flexStart != flexEnd)
    }

    @Test func `all values are distinct`() {
        let values = [
            SelfPosition.center,
            SelfPosition.start,
            SelfPosition.end,
            SelfPosition.selfStart,
            SelfPosition.selfEnd,
            SelfPosition.flexStart,
            SelfPosition.flexEnd,
        ]
        let uniqueValues = Set(values)
        #expect(uniqueValues.count == values.count)
    }
}

@Suite
struct `SelfPosition - CaseIterable Conformance` {
    @Test func `all cases contains all position values`() {
        let allCases = SelfPosition.allCases
        #expect(allCases.count == 7)
        #expect(allCases.contains(.center))
        #expect(allCases.contains(.start))
        #expect(allCases.contains(.end))
        #expect(allCases.contains(.selfStart))
        #expect(allCases.contains(.selfEnd))
        #expect(allCases.contains(.flexStart))
        #expect(allCases.contains(.flexEnd))
    }

    @Test func `can iterate over all cases`() {
        var count = 0
        for position in SelfPosition.allCases {
            #expect(position.description == position.rawValue)
            count += 1
        }
        #expect(count == 7)
    }

    @Test func `all positions property matches all cases`() {
        let allPositions = SelfPosition.allPositions
        let allCases = SelfPosition.allCases
        #expect(allPositions.count == allCases.count)
        for position in allCases {
            #expect(allPositions.contains(position))
        }
    }
}

@Suite
struct `SelfPosition - RawRepresentable Conformance` {
    @Test func `raw values match CSS specifications`() {
        #expect(SelfPosition.center.rawValue == "center")
        #expect(SelfPosition.start.rawValue == "start")
        #expect(SelfPosition.end.rawValue == "end")
        #expect(SelfPosition.selfStart.rawValue == "self-start")
        #expect(SelfPosition.selfEnd.rawValue == "self-end")
        #expect(SelfPosition.flexStart.rawValue == "flex-start")
        #expect(SelfPosition.flexEnd.rawValue == "flex-end")
    }

    @Test func `description uses raw value`() {
        for position in SelfPosition.allCases {
            #expect(position.description == position.rawValue)
        }
    }

    @Test(arguments: [
        ("center", SelfPosition.center),
        ("start", SelfPosition.start),
        ("end", SelfPosition.end),
        ("self-start", SelfPosition.selfStart),
        ("self-end", SelfPosition.selfEnd),
        ("flex-start", SelfPosition.flexStart),
        ("flex-end", SelfPosition.flexEnd),
    ])
    func `initialization from raw value works correctly`(
        rawValue: String,
        expected: SelfPosition
    ) {
        let position = SelfPosition(rawValue: rawValue)
        #expect(position == expected)
    }

    @Test func `initialization with invalid raw value returns nil`() {
        let invalid = SelfPosition(rawValue: "invalid")
        #expect(invalid == nil)
    }
}

// MARK: - Usage in Context

@Suite
struct `SelfPosition - CSS Property Usage` {
    @Test func `self position renders correctly in align-self property`() {
        let alignSelf = "align-self: \(SelfPosition.center)"
        #expect(alignSelf == "align-self: center")
    }

    @Test func `self position renders correctly in justify-self property`() {
        let justifySelf = "justify-self: \(SelfPosition.flexStart)"
        #expect(justifySelf == "justify-self: flex-start")
    }

    @Test func `self-start renders correctly in align-self property`() {
        let alignSelf = "align-self: \(SelfPosition.selfStart)"
        #expect(alignSelf == "align-self: self-start")
    }

    @Test func `self-end renders correctly in justify-self property`() {
        let justifySelf = "justify-self: \(SelfPosition.selfEnd)"
        #expect(justifySelf == "justify-self: self-end")
    }

    @Test func `start renders correctly in align-self property`() {
        let alignSelf = "align-self: \(SelfPosition.start)"
        #expect(alignSelf == "align-self: start")
    }

    @Test func `end renders correctly in justify-self property`() {
        let justifySelf = "justify-self: \(SelfPosition.end)"
        #expect(justifySelf == "justify-self: end")
    }
}

// MARK: - Edge Cases

@Suite
struct `SelfPosition - Edge Cases` {
    @Test func `center positions element in the center`() {
        let center = SelfPosition.center
        #expect(center.description == "center")
        #expect(center.rawValue == "center")
    }

    @Test func `start and end are logical positions`() {
        let start = SelfPosition.start
        let end = SelfPosition.end
        #expect(start.description == "start")
        #expect(end.description == "end")
        #expect(start != end)
    }

    @Test func `self-start and self-end are self-specific positions`() {
        let selfStart = SelfPosition.selfStart
        let selfEnd = SelfPosition.selfEnd
        #expect(selfStart.description.contains("self"))
        #expect(selfEnd.description.contains("self"))
        #expect(selfStart != selfEnd)
    }

    @Test func `flex-start and flex-end are flex-specific positions`() {
        let flexStart = SelfPosition.flexStart
        let flexEnd = SelfPosition.flexEnd
        #expect(flexStart.description.contains("flex"))
        #expect(flexEnd.description.contains("flex"))
        #expect(flexStart != flexEnd)
    }

    @Test func `all positions property contains all values`() {
        let allPositions = SelfPosition.allPositions
        #expect(allPositions.count == 7)
        #expect(allPositions.contains(.center))
        #expect(allPositions.contains(.start))
        #expect(allPositions.contains(.end))
        #expect(allPositions.contains(.selfStart))
        #expect(allPositions.contains(.selfEnd))
        #expect(allPositions.contains(.flexStart))
        #expect(allPositions.contains(.flexEnd))
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `SelfPosition - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `self position description 100K times`() {
            for _ in 0..<100_000 {
                _ = SelfPosition.center.description
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `self position equality 100K times`() {
            let center = SelfPosition.center
            let flexStart = SelfPosition.flexStart
            for _ in 0..<100_000 {
                _ = center == flexStart
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `self position hashing 100K times`() {
            for _ in 0..<100_000 {
                _ = SelfPosition.selfStart.hashValue
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `self position iteration 100K times`() {
            for _ in 0..<100_000 {
                for _ in SelfPosition.allCases {
                    // Iterate through all cases
                }
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `self position raw value initialization 100K times`() {
            for _ in 0..<100_000 {
                _ = SelfPosition(rawValue: "center")
            }
        }
    }
}
