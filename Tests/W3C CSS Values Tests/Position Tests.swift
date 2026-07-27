// Position Tests.swift
// swift-w3c-css
//
// Tests for CSS Position type

import Testing

@testable import W3C_CSS_Values

// MARK: - Basic Functionality

@Suite
struct `Position - Single Keyword` {
    @Test(arguments: [
        (Position.keyword(.center), "center"),
        (Position.keyword(.top), "top"),
        (Position.keyword(.right), "right"),
        (Position.keyword(.bottom), "bottom"),
        (Position.keyword(.left), "left"),
    ])
    func `single keyword renders correctly`(
        position: Position,
        expected: String
    ) {
        #expect(position.description == expected)
    }
}

@Suite
struct `Position - Single Value` {
    @Test func `pixel value renders correctly`() {
        #expect(Position.value(.px(50)).description == "50px")
    }

    @Test func `percentage value renders correctly`() {
        #expect(Position.value(.percentage(25)).description == "25%")
    }
}

@Suite
struct `Position - Two Keywords` {
    @Test(arguments: [
        (Position.keywords(.top, .left), "top left"),
        (Position.keywords(.bottom, .right), "bottom right"),
        (Position.keywords(.center, .center), "center center"),
    ])
    func `two keywords render correctly`(
        position: Position,
        expected: String
    ) {
        #expect(position.description == expected)
    }
}

@Suite
struct `Position - Keyword and Value` {
    @Test func `keyword and pixel value renders correctly`() {
        #expect(Position.keywordValue(.top, .px(20)).description == "top 20px")
    }

    @Test func `keyword and percentage value renders correctly`() {
        #expect(Position.keywordValue(.left, .percentage(30)).description == "left 30%")
    }
}

@Suite
struct `Position - Value and Keyword` {
    @Test func `pixel value and keyword renders correctly`() {
        #expect(Position.valueKeyword(.px(20), .top).description == "20px top")
    }

    @Test func `percentage value and keyword renders correctly`() {
        #expect(Position.valueKeyword(.percentage(30), .left).description == "30% left")
    }
}

@Suite
struct `Position - Two Values` {
    @Test(arguments: [
        (Position.values(.px(10), .px(20)), "10px 20px"),
        (Position.values(.percentage(25), .percentage(75)), "25% 75%"),
        (Position.values(.px(10), .percentage(50)), "10px 50%"),
    ])
    func `two values render correctly`(
        position: Position,
        expected: String
    ) {
        #expect(position.description == expected)
    }
}

@Suite
struct `Position - Offsets` {
    @Test func `top-left offset renders correctly`() {
        #expect(Position.offsets(.top, .px(10), .left, .px(20)).description == "top 10px left 20px")
    }

    @Test func `bottom-right offset renders correctly`() {
        #expect(
            Position.offsets(.bottom, .percentage(25), .right, .percentage(50)).description
                == "bottom 25% right 50%"
        )
    }
}

// MARK: - Static Constants

@Suite
struct `Position - Static Constants` {
    @Test(arguments: [
        (Position.center, "center"),
        (Position.top, "top"),
        (Position.right, "right"),
        (Position.bottom, "bottom"),
        (Position.left, "left"),
        (Position.topLeft, "top left"),
        (Position.topRight, "top right"),
        (Position.bottomLeft, "bottom left"),
        (Position.bottomRight, "bottom right"),
    ])
    func `static constants render correctly`(
        position: Position,
        expected: String
    ) {
        #expect(position.description == expected)
    }
}

// MARK: - Protocol Conformance

@Suite
struct `Position - Hashable Conformance` {
    @Test func `equal positions are equal`() {
        #expect(Position.center == Position.keyword(.center))
        #expect(Position.topLeft == Position.keywords(.top, .left))
    }

    @Test func `equal values are equal`() {
        #expect(Position.value(.px(50)) == Position.value(.px(50)))
        #expect(Position.values(.px(10), .px(20)) == Position.values(.px(10), .px(20)))
    }

    @Test func `different values are not equal`() {
        #expect(Position.value(.px(50)) != Position.value(.px(75)))
        #expect(Position.values(.px(10), .px(20)) != Position.values(.px(10), .px(30)))
    }
}

// MARK: - Usage in Context

@Suite
struct `Position - CSS Property Usage` {
    @Test func `position renders correctly in background-position property`() {
        let backgroundPosition = "background-position: \(Position.center)"
        #expect(backgroundPosition == "background-position: center")
    }

    @Test func `position renders correctly in transform-origin property`() {
        let transformOrigin = "transform-origin: \(Position.topLeft)"
        #expect(transformOrigin == "transform-origin: top left")
    }

    @Test func `position renders correctly in object-position property`() {
        let objectPosition = "object-position: \(Position.values(.percentage(25), .px(10)))"
        #expect(objectPosition == "object-position: 25% 10px")
    }
}

// MARK: - Edge Cases

@Suite
struct `Position - Edge Cases` {
    @Test func `zero pixel values`() {
        #expect(Position.value(.px(0)).description == "0px")
        #expect(Position.values(.px(0), .px(0)).description == "0px 0px")
    }

    @Test func `negative values`() {
        #expect(Position.value(.px(-10)).description == "-10px")
        #expect(Position.values(.px(-5), .px(-15)).description == "-5px -15px")
    }

    @Test func `large percentage values`() {
        #expect(Position.value(.percentage(100)).description == "100%")
        #expect(Position.values(.percentage(0), .percentage(100)).description == "0% 100%")
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `Position - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `position keyword creation 100K times`() {
            for _ in 0..<100_000 {
                _ = Position.keyword(.center)
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `position values creation 100K times`() {
            for i in 0..<100_000 {
                _ = Position.values(.px(i), .px(i + 1))
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `position comparison 100K times`() {
            let pos1 = Position.center
            for i in 0..<100_000 {
                _ = Position.values(.px(i), .px(i)) == pos1
            }
        }
    }
}
