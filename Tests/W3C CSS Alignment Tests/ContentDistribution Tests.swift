// ContentDistribution Tests.swift
// swift-w3c-css
//
// Tests for CSS ContentDistribution type

import Testing

@testable import W3C_CSS_Alignment

// MARK: - Basic Functionality

@Suite
struct `ContentDistribution - Initialization` {
    @Test(arguments: [
        (ContentDistribution.spaceBetween, "space-between"),
        (ContentDistribution.spaceAround, "space-around"),
        (ContentDistribution.spaceEvenly, "space-evenly"),
        (ContentDistribution.stretch, "stretch"),
    ])
    func `content distribution renders with correct description`(
        distribution: ContentDistribution,
        expected: String
    ) {
        #expect(distribution.description == expected)
    }

    @Test func `space-between value is correct`() {
        let spaceBetween = ContentDistribution.spaceBetween
        #expect(spaceBetween.description == "space-between")
    }

    @Test func `space-around value is correct`() {
        let spaceAround = ContentDistribution.spaceAround
        #expect(spaceAround.description == "space-around")
    }

    @Test func `space-evenly value is correct`() {
        let spaceEvenly = ContentDistribution.spaceEvenly
        #expect(spaceEvenly.description == "space-evenly")
    }

    @Test func `stretch value is correct`() {
        let stretch = ContentDistribution.stretch
        #expect(stretch.description == "stretch")
    }
}

// MARK: - Protocol Conformance

@Suite
struct `ContentDistribution - Hashable Conformance` {
    @Test func `equal values are equal`() {
        let spaceBetween1 = ContentDistribution.spaceBetween
        let spaceBetween2 = ContentDistribution.spaceBetween
        #expect(spaceBetween1 == spaceBetween2)
    }

    @Test func `different values are not equal`() {
        let spaceBetween = ContentDistribution.spaceBetween
        let spaceAround = ContentDistribution.spaceAround
        #expect(spaceBetween != spaceAround)
    }

    @Test func `stretch is not equal to space-evenly`() {
        let stretch = ContentDistribution.stretch
        let spaceEvenly = ContentDistribution.spaceEvenly
        #expect(stretch != spaceEvenly)
    }

    @Test func `all values are distinct`() {
        let values = [
            ContentDistribution.spaceBetween,
            ContentDistribution.spaceAround,
            ContentDistribution.spaceEvenly,
            ContentDistribution.stretch,
        ]
        let uniqueValues = Set(values)
        #expect(uniqueValues.count == values.count)
    }
}

@Suite
struct `ContentDistribution - CaseIterable Conformance` {
    @Test func `all cases contains all distribution values`() {
        let allCases = ContentDistribution.allCases
        #expect(allCases.count == 4)
        #expect(allCases.contains(.spaceBetween))
        #expect(allCases.contains(.spaceAround))
        #expect(allCases.contains(.spaceEvenly))
        #expect(allCases.contains(.stretch))
    }

    @Test func `can iterate over all cases`() {
        var count = 0
        for distribution in ContentDistribution.allCases {
            #expect(distribution.description == distribution.rawValue)
            count += 1
        }
        #expect(count == 4)
    }
}

@Suite
struct `ContentDistribution - RawRepresentable Conformance` {
    @Test func `raw values match CSS specifications`() {
        #expect(ContentDistribution.spaceBetween.rawValue == "space-between")
        #expect(ContentDistribution.spaceAround.rawValue == "space-around")
        #expect(ContentDistribution.spaceEvenly.rawValue == "space-evenly")
        #expect(ContentDistribution.stretch.rawValue == "stretch")
    }

    @Test func `description uses raw value`() {
        for distribution in ContentDistribution.allCases {
            #expect(distribution.description == distribution.rawValue)
        }
    }
}

// MARK: - Usage in Context

@Suite
struct `ContentDistribution - CSS Property Usage` {
    @Test func `content distribution renders correctly in align-content property`() {
        let alignContent = "align-content: \(ContentDistribution.spaceBetween)"
        #expect(alignContent == "align-content: space-between")
    }

    @Test func `content distribution renders correctly in justify-content property`() {
        let justifyContent = "justify-content: \(ContentDistribution.spaceAround)"
        #expect(justifyContent == "justify-content: space-around")
    }

    @Test func `space-evenly renders correctly in align-content property`() {
        let alignContent = "align-content: \(ContentDistribution.spaceEvenly)"
        #expect(alignContent == "align-content: space-evenly")
    }

    @Test func `stretch renders correctly in justify-content property`() {
        let justifyContent = "justify-content: \(ContentDistribution.stretch)"
        #expect(justifyContent == "justify-content: stretch")
    }
}

// MARK: - Edge Cases

@Suite
struct `ContentDistribution - Edge Cases` {
    @Test func `space-between distributes items evenly with first and last at edges`() {
        let spaceBetween = ContentDistribution.spaceBetween
        #expect(spaceBetween.description == "space-between")
        #expect(spaceBetween.rawValue == "space-between")
    }

    @Test func `space-around adds equal space around each item`() {
        let spaceAround = ContentDistribution.spaceAround
        #expect(spaceAround.description == "space-around")
        #expect(spaceAround.rawValue == "space-around")
    }

    @Test func `space-evenly distributes space equally including edges`() {
        let spaceEvenly = ContentDistribution.spaceEvenly
        #expect(spaceEvenly.description == "space-evenly")
        #expect(spaceEvenly.rawValue == "space-evenly")
    }

    @Test func `stretch expands items to fill container`() {
        let stretch = ContentDistribution.stretch
        #expect(stretch.description == "stretch")
        #expect(stretch.rawValue == "stretch")
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `ContentDistribution - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `content distribution description 100K times`() {
            for _ in 0..<100_000 {
                _ = ContentDistribution.spaceBetween.description
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `content distribution equality 100K times`() {
            let spaceBetween = ContentDistribution.spaceBetween
            let spaceAround = ContentDistribution.spaceAround
            for _ in 0..<100_000 {
                _ = spaceBetween == spaceAround
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `content distribution hashing 100K times`() {
            for _ in 0..<100_000 {
                _ = ContentDistribution.stretch.hashValue
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `content distribution iteration 100K times`() {
            for _ in 0..<100_000 {
                for _ in ContentDistribution.allCases {
                    // Iterate through all cases
                }
            }
        }
    }
}
