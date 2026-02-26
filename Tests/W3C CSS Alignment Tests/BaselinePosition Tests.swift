// BaselinePosition Tests.swift
// swift-w3c-css
//
// Tests for CSS BaselinePosition type

import Testing

@testable import W3C_CSS_Shared

// MARK: - Basic Functionality

@Suite
struct `BaselinePosition - Initialization` {
    @Test(arguments: [
        (BaselinePosition.firstBaseline, "first baseline"),
        (BaselinePosition.baseline, "baseline"),
        (BaselinePosition.lastBaseline, "last baseline"),
    ])
    func `baseline position renders with correct description`(
        position: BaselinePosition,
        expected: String
    ) {
        #expect(position.description == expected)
    }

    @Test func `first baseline value is correct`() {
        let firstBaseline = BaselinePosition.firstBaseline
        #expect(firstBaseline.description == "first baseline")
    }

    @Test func `baseline value is correct`() {
        let baseline = BaselinePosition.baseline
        #expect(baseline.description == "baseline")
    }

    @Test func `last baseline value is correct`() {
        let lastBaseline = BaselinePosition.lastBaseline
        #expect(lastBaseline.description == "last baseline")
    }
}

// MARK: - Protocol Conformance

@Suite
struct `BaselinePosition - Hashable Conformance` {
    @Test func `equal values are equal`() {
        let baseline1 = BaselinePosition.baseline
        let baseline2 = BaselinePosition.baseline
        #expect(baseline1 == baseline2)
    }

    @Test func `different values are not equal`() {
        let baseline = BaselinePosition.baseline
        let firstBaseline = BaselinePosition.firstBaseline
        #expect(baseline != firstBaseline)
    }

    @Test func `first baseline is not equal to last baseline`() {
        let firstBaseline = BaselinePosition.firstBaseline
        let lastBaseline = BaselinePosition.lastBaseline
        #expect(firstBaseline != lastBaseline)
    }

    @Test func `all values are distinct`() {
        let values = [
            BaselinePosition.firstBaseline,
            BaselinePosition.baseline,
            BaselinePosition.lastBaseline,
        ]
        let uniqueValues = Set(values)
        #expect(uniqueValues.count == values.count)
    }
}

// MARK: - Usage in Context

@Suite
struct `BaselinePosition - CSS Property Usage` {
    @Test func `baseline position renders correctly in align-items property`() {
        let alignItems = "align-items: \(BaselinePosition.baseline)"
        #expect(alignItems == "align-items: baseline")
    }

    @Test func `first baseline renders correctly in align-items property`() {
        let alignItems = "align-items: \(BaselinePosition.firstBaseline)"
        #expect(alignItems == "align-items: first baseline")
    }

    @Test func `last baseline renders correctly in align-items property`() {
        let alignItems = "align-items: \(BaselinePosition.lastBaseline)"
        #expect(alignItems == "align-items: last baseline")
    }

    @Test func `baseline position renders correctly in align-self property`() {
        let alignSelf = "align-self: \(BaselinePosition.baseline)"
        #expect(alignSelf == "align-self: baseline")
    }

    @Test func `baseline position renders correctly in justify-items property`() {
        let justifyItems = "justify-items: \(BaselinePosition.firstBaseline)"
        #expect(justifyItems == "justify-items: first baseline")
    }
}

// MARK: - Edge Cases

@Suite
struct `BaselinePosition - Edge Cases` {
    @Test func `baseline is the default baseline alignment`() {
        let baseline = BaselinePosition.baseline
        #expect(baseline.description == "baseline")
        #expect(!baseline.description.contains("first"))
        #expect(!baseline.description.contains("last"))
    }

    @Test func `first baseline explicitly specifies first`() {
        let firstBaseline = BaselinePosition.firstBaseline
        #expect(firstBaseline.description.contains("first"))
    }

    @Test func `last baseline explicitly specifies last`() {
        let lastBaseline = BaselinePosition.lastBaseline
        #expect(lastBaseline.description.contains("last"))
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `BaselinePosition - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `baseline position description 100K times`() {
            for _ in 0..<100_000 {
                _ = BaselinePosition.baseline.description
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `baseline position equality 100K times`() {
            let baseline = BaselinePosition.baseline
            let firstBaseline = BaselinePosition.firstBaseline
            for _ in 0..<100_000 {
                _ = baseline == firstBaseline
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `baseline position hashing 100K times`() {
            for _ in 0..<100_000 {
                _ = BaselinePosition.baseline.hashValue
            }
        }
    }
}
