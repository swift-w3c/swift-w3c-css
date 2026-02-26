// Flex Tests.swift
// swift-w3c-css
//
// Tests for CSS Flex type

import Testing

@testable import W3C_CSS_Values

// MARK: - Basic Functionality

@Suite
struct `Flex - Initialization with Number` {
    @Test(arguments: [
        (1.0, "1fr"),
        (2.5, "2.5fr"),
        (0.0, "0fr"),
        (-1.0, "-1fr"),
    ])
    func `flex values with number render correctly`(
        value: Double,
        expected: String
    ) {
        let flex = Flex(Number(value))
        #expect(flex.description == expected)
    }
}

@Suite
struct `Flex - Initialization with Integer` {
    @Test(arguments: [
        (1, "1fr"),
        (3, "3fr"),
        (0, "0fr"),
    ])
    func `flex initializes correctly with integer values`(
        value: Int,
        expected: String
    ) {
        let flex = Flex(value)
        #expect(flex.description == expected)
    }
}

// MARK: - Literal Conformance

@Suite
struct `Flex - Integer Literal` {
    @Test func `integer literal creates flex`() {
        let flex: Flex = 2
        #expect(flex.description == "2fr")
    }

    @Test func `zero literal creates flex`() {
        let flex: Flex = 0
        #expect(flex.description == "0fr")
    }
}

@Suite
struct `Flex - Float Literal` {
    @Test func `float literal creates flex`() {
        let flex: Flex = 1.5
        #expect(flex.description == "1.5fr")
    }

    @Test func `decimal literal creates flex`() {
        let flex: Flex = 2.25
        #expect(flex.description == "2.25fr")
    }
}

// MARK: - Protocol Conformance

@Suite
struct `Flex - Hashable Conformance` {
    @Test func `equal values are equal`() {
        let flex1a: Flex = 1
        let flex1b: Flex = 1
        #expect(flex1a == flex1b)
    }

    @Test func `different values are not equal`() {
        let flex1: Flex = 1
        let flex2: Flex = 2
        #expect(flex1 != flex2)
    }

    @Test func `integer and float with same value are equal`() {
        let flex1: Flex = 1
        let flexFloat: Flex = 1.0
        #expect(flex1 == flexFloat)
    }

    @Test func `number-based and int-based flex are equal`() {
        let flexNumber = Flex(Number(2))
        let flexInt = Flex(2)
        #expect(flexNumber == flexInt)
    }
}

// MARK: - Usage in Context

@Suite
struct `Flex - Grid Layout Usage` {
    @Test func `flex renders correctly in grid-template-columns`() {
        let gridTemplate = "grid-template-columns: \(Flex(1)) \(Flex(2)) \(Flex(1))"
        #expect(gridTemplate == "grid-template-columns: 1fr 2fr 1fr")
    }

    @Test func `flex renders correctly in single column grid`() {
        let grid = "grid-template-columns: \(Flex(1))"
        #expect(grid == "grid-template-columns: 1fr")
    }

    @Test func `flex with decimal renders correctly in grid`() {
        let grid = "grid-template-columns: \(Flex(1.5)) \(Flex(2.5))"
        #expect(grid == "grid-template-columns: 1.5fr 2.5fr")
    }

    @Test func `flex renders correctly in grid-template-rows`() {
        let gridRows = "grid-template-rows: \(Flex(2)) \(Flex(1))"
        #expect(gridRows == "grid-template-rows: 2fr 1fr")
    }
}

// MARK: - Common Grid Patterns

@Suite
struct `Flex - Common Grid Patterns` {
    @Test func `equal columns pattern`() {
        let columns = "\(Flex(1)) \(Flex(1)) \(Flex(1))"
        #expect(columns == "1fr 1fr 1fr")
    }

    @Test func `sidebar with main content pattern`() {
        let layout = "\(Flex(1)) \(Flex(3))"
        #expect(layout == "1fr 3fr")
    }

    @Test func `three column layout pattern`() {
        let layout = "\(Flex(1)) \(Flex(2)) \(Flex(1))"
        #expect(layout == "1fr 2fr 1fr")
    }
}

// MARK: - Edge Cases

@Suite
struct `Flex - Edge Cases` {
    @Test func `zero flex renders correctly`() {
        let flex: Flex = 0
        #expect(flex.description == "0fr")
    }

    @Test func `negative flex renders correctly`() {
        let flex = Flex(-1)
        #expect(flex.description == "-1fr")
    }

    @Test func `very small flex values preserve precision`() {
        let flex: Flex = 0.001
        #expect(flex.description == "0.001fr")
    }

    @Test func `very large flex values render correctly`() {
        let flex: Flex = 999999
        #expect(flex.description == "999999fr")
    }

    @Test func `whole number decimals render without fractional part`() {
        let flex: Flex = 2.0
        #expect(flex.description == "2fr")
    }

    @Test func `decimal precision is maintained`() {
        let flex: Flex = 1.123456
        #expect(flex.description == "1.123456fr")
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `Flex - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `flex creation 100K times`() {
            for i in 0..<100_000 {
                _ = Flex(i)
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `flex comparison 100K times`() {
            let flex1: Flex = 1
            for i in 0..<100_000 {
                _ = Flex(i) == flex1
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `flex with number creation 100K times`() {
            for i in 0..<100_000 {
                _ = Flex(Number(Double(i)))
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `flex literal assignment 100K times`() {
            for i in 0..<100_000 {
                let _: Flex = Flex(i)
            }
        }
    }
}
