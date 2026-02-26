// ContentPosition Tests.swift
// swift-w3c-css
//
// Tests for CSS ContentPosition type

import Testing

@testable import W3C_CSS_Alignment

// MARK: - Basic Functionality

@Suite
struct `ContentPosition - Initialization` {
    @Test(arguments: [
        (ContentPosition.center, "center"),
        (ContentPosition.start, "start"),
        (ContentPosition.end, "end"),
        (ContentPosition.flexStart, "flex-start"),
        (ContentPosition.flexEnd, "flex-end"),
        (ContentPosition.left, "left"),
        (ContentPosition.right, "right"),
    ])
    func `content position renders with correct description`(
        position: ContentPosition,
        expected: String
    ) {
        #expect(position.description == expected)
    }

    @Test func `center value is correct`() {
        let center = ContentPosition.center
        #expect(center.description == "center")
    }

    @Test func `start value is correct`() {
        let start = ContentPosition.start
        #expect(start.description == "start")
    }

    @Test func `end value is correct`() {
        let end = ContentPosition.end
        #expect(end.description == "end")
    }

    @Test func `flex-start value is correct`() {
        let flexStart = ContentPosition.flexStart
        #expect(flexStart.description == "flex-start")
    }

    @Test func `flex-end value is correct`() {
        let flexEnd = ContentPosition.flexEnd
        #expect(flexEnd.description == "flex-end")
    }

    @Test func `left value is correct`() {
        let left = ContentPosition.left
        #expect(left.description == "left")
    }

    @Test func `right value is correct`() {
        let right = ContentPosition.right
        #expect(right.description == "right")
    }
}

// MARK: - Protocol Conformance

@Suite
struct `ContentPosition - Hashable Conformance` {
    @Test func `equal values are equal`() {
        let center1 = ContentPosition.center
        let center2 = ContentPosition.center
        #expect(center1 == center2)
    }

    @Test func `different values are not equal`() {
        let center = ContentPosition.center
        let start = ContentPosition.start
        #expect(center != start)
    }

    @Test func `flex-start is not equal to flex-end`() {
        let flexStart = ContentPosition.flexStart
        let flexEnd = ContentPosition.flexEnd
        #expect(flexStart != flexEnd)
    }

    @Test func `left is not equal to right`() {
        let left = ContentPosition.left
        let right = ContentPosition.right
        #expect(left != right)
    }

    @Test func `all values are distinct`() {
        let values = [
            ContentPosition.center,
            ContentPosition.start,
            ContentPosition.end,
            ContentPosition.flexStart,
            ContentPosition.flexEnd,
            ContentPosition.left,
            ContentPosition.right,
        ]
        let uniqueValues = Set(values)
        #expect(uniqueValues.count == values.count)
    }
}

@Suite
struct `ContentPosition - CaseIterable Conformance` {
    @Test func `all cases contains all position values`() {
        let allCases = ContentPosition.allCases
        #expect(allCases.count == 7)
        #expect(allCases.contains(.center))
        #expect(allCases.contains(.start))
        #expect(allCases.contains(.end))
        #expect(allCases.contains(.flexStart))
        #expect(allCases.contains(.flexEnd))
        #expect(allCases.contains(.left))
        #expect(allCases.contains(.right))
    }

    @Test func `can iterate over all cases`() {
        var count = 0
        for position in ContentPosition.allCases {
            #expect(position.description == position.rawValue)
            count += 1
        }
        #expect(count == 7)
    }
}

@Suite
struct `ContentPosition - RawRepresentable Conformance` {
    @Test func `raw values match CSS specifications`() {
        #expect(ContentPosition.center.rawValue == "center")
        #expect(ContentPosition.start.rawValue == "start")
        #expect(ContentPosition.end.rawValue == "end")
        #expect(ContentPosition.flexStart.rawValue == "flex-start")
        #expect(ContentPosition.flexEnd.rawValue == "flex-end")
        #expect(ContentPosition.left.rawValue == "left")
        #expect(ContentPosition.right.rawValue == "right")
    }

    @Test func `description uses raw value`() {
        for position in ContentPosition.allCases {
            #expect(position.description == position.rawValue)
        }
    }
}

// MARK: - Usage in Context

@Suite
struct `ContentPosition - CSS Property Usage` {
    @Test func `content position renders correctly in justify-content property`() {
        let justifyContent = "justify-content: \(ContentPosition.center)"
        #expect(justifyContent == "justify-content: center")
    }

    @Test func `flex-start renders correctly in align-content property`() {
        let alignContent = "align-content: \(ContentPosition.flexStart)"
        #expect(alignContent == "align-content: flex-start")
    }

    @Test func `start renders correctly in justify-content property`() {
        let justifyContent = "justify-content: \(ContentPosition.start)"
        #expect(justifyContent == "justify-content: start")
    }

    @Test func `end renders correctly in align-content property`() {
        let alignContent = "align-content: \(ContentPosition.end)"
        #expect(alignContent == "align-content: end")
    }

    @Test func `left renders correctly in justify-content property`() {
        let justifyContent = "justify-content: \(ContentPosition.left)"
        #expect(justifyContent == "justify-content: left")
    }

    @Test func `right renders correctly in justify-content property`() {
        let justifyContent = "justify-content: \(ContentPosition.right)"
        #expect(justifyContent == "justify-content: right")
    }
}

// MARK: - Edge Cases

@Suite
struct `ContentPosition - Edge Cases` {
    @Test func `center positions content in the center`() {
        let center = ContentPosition.center
        #expect(center.description == "center")
        #expect(center.rawValue == "center")
    }

    @Test func `start and end are logical positions`() {
        let start = ContentPosition.start
        let end = ContentPosition.end
        #expect(start.description == "start")
        #expect(end.description == "end")
        #expect(start != end)
    }

    @Test func `flex-start and flex-end are flex-specific positions`() {
        let flexStart = ContentPosition.flexStart
        let flexEnd = ContentPosition.flexEnd
        #expect(flexStart.description.contains("flex"))
        #expect(flexEnd.description.contains("flex"))
        #expect(flexStart != flexEnd)
    }

    @Test func `left and right are physical positions`() {
        let left = ContentPosition.left
        let right = ContentPosition.right
        #expect(left.description == "left")
        #expect(right.description == "right")
        #expect(left != right)
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `ContentPosition - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `content position description 100K times`() {
            for _ in 0..<100_000 {
                _ = ContentPosition.center.description
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `content position equality 100K times`() {
            let center = ContentPosition.center
            let start = ContentPosition.start
            for _ in 0..<100_000 {
                _ = center == start
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `content position hashing 100K times`() {
            for _ in 0..<100_000 {
                _ = ContentPosition.flexStart.hashValue
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `content position iteration 100K times`() {
            for _ in 0..<100_000 {
                for _ in ContentPosition.allCases {
                    // Iterate through all cases
                }
            }
        }
    }
}
