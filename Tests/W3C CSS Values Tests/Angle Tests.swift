// Angle Tests.swift
// swift-w3c-css
//
// Tests for CSS Angle type

import Testing

@testable import W3C_CSS_Values

// MARK: - Basic Functionality

@Suite
struct `Angle - Degree Values` {
    @Test(arguments: [
        (45.0, "45deg"),
        (-90.0, "-90deg"),
        (0.0, "0deg"),
        (180.0, "180deg"),
        (360.0, "360deg"),
    ])
    func `degree values render correctly`(
        value: Double,
        expected: String
    ) {
        let angle = Angle.deg(value)
        #expect(angle.description == expected)
    }

    @Test func `degrees alternative constructor renders correctly`() {
        let angle = Angle.degrees(45)
        #expect(angle.description == "45deg")
    }
}

@Suite
struct `Angle - Radian Values` {
    @Test(arguments: [
        (1.5708, "1.5708rad"),
        (-3.14159, "-3.14159rad"),
        (0.0, "0rad"),
        (6.28318, "6.28318rad"),
    ])
    func `radian values render correctly`(
        value: Double,
        expected: String
    ) {
        let angle = Angle.rad(value)
        #expect(angle.description == expected)
    }

    @Test func `radians alternative constructor renders correctly`() {
        let angle = Angle.radians(1.5708)
        #expect(angle.description == "1.5708rad")
    }
}

@Suite
struct `Angle - Gradian Values` {
    @Test(arguments: [
        (100.0, "100grad"),
        (-50.0, "-50grad"),
        (0.0, "0grad"),
        (200.0, "200grad"),
    ])
    func `gradian values render correctly`(
        value: Double,
        expected: String
    ) {
        let angle = Angle.grad(value)
        #expect(angle.description == expected)
    }

    @Test func `gradians alternative constructor renders correctly`() {
        let angle = Angle.gradians(100)
        #expect(angle.description == "100grad")
    }
}

@Suite
struct `Angle - Turn Values` {
    @Test(arguments: [
        (0.25, "0.25turn"),
        (1.0, "1turn"),
        (2.5, "2.5turn"),
        (-0.5, "-0.5turn"),
    ])
    func `turn values render correctly`(
        value: Double,
        expected: String
    ) {
        let angle = Angle.turn(value)
        #expect(angle.description == expected)
    }
}

// MARK: - Literal Conformance

@Suite
struct `Angle - Integer Literal` {
    @Test func `integer literal creates degree angle`() {
        let angle: Angle = 90
        #expect(angle.description == "90deg")

        if case .deg(let value) = angle {
            #expect(value == 90)
        } else {
            Issue.record("Expected .deg case")
        }
    }
}

@Suite
struct `Angle - Float Literal` {
    @Test func `float literal creates degree angle`() {
        let angle: Angle = 45.5
        #expect(angle.description == "45.5deg")

        if case .deg(let value) = angle {
            #expect(value == 45.5)
        } else {
            Issue.record("Expected .deg case")
        }
    }
}

// MARK: - Protocol Conformance

@Suite
struct `Angle - Hashable Conformance` {
    @Test func `equal degree values are equal`() {
        let deg1 = Angle.deg(45)
        let deg2 = Angle.deg(45)
        #expect(deg1 == deg2)
    }

    @Test func `different degree values are not equal`() {
        let deg1 = Angle.deg(45)
        let deg3 = Angle.deg(90)
        #expect(deg1 != deg3)
    }

    @Test func `equal radian values are equal`() {
        let rad1 = Angle.rad(1.5708)
        let rad2 = Angle.rad(1.5708)
        #expect(rad1 == rad2)
    }

    @Test func `different units are not equal even if equivalent`() {
        let rad1 = Angle.rad(1.5708)
        let deg1 = Angle.deg(45)
        #expect(rad1 != deg1)
    }

    @Test func `literal equals degree equivalent`() {
        let literal: Angle = 45
        let deg = Angle.deg(45)
        #expect(literal == deg)
    }
}

// MARK: - Usage in Context

@Suite
struct `Angle - CSS Property Usage` {
    @Test func `angle renders correctly in transform rotate property`() {
        let transform = "transform: rotate(\(Angle.deg(45)))"
        #expect(transform == "transform: rotate(45deg)")
    }

    @Test func `angle renders correctly in gradient property`() {
        let gradient = "linear-gradient(\(Angle.deg(90)), blue, red)"
        #expect(gradient == "linear-gradient(90deg, blue, red)")
    }

    @Test func `radian angle renders correctly in transform property`() {
        let transform = "transform: rotate(\(Angle.rad(1.5708)))"
        #expect(transform == "transform: rotate(1.5708rad)")
    }

    @Test func `turn angle renders correctly in transform property`() {
        let transform = "transform: rotate(\(Angle.turn(0.25)))"
        #expect(transform == "transform: rotate(0.25turn)")
    }
}

// MARK: - Edge Cases

@Suite
struct `Angle - Edge Cases` {
    @Test func `zero angle renders correctly`() {
        #expect(Angle.deg(0).description == "0deg")
        #expect(Angle.rad(0).description == "0rad")
        #expect(Angle.grad(0).description == "0grad")
        #expect(Angle.turn(0).description == "0turn")
    }

    @Test func `negative angles render correctly`() {
        #expect(Angle.deg(-90).description == "-90deg")
        #expect(Angle.rad(-1.5708).description == "-1.5708rad")
        #expect(Angle.grad(-50).description == "-50grad")
        #expect(Angle.turn(-0.5).description == "-0.5turn")
    }

    @Test func `very small angles preserve precision`() {
        #expect(Angle.deg(0.001).description == "0.001deg")
        #expect(Angle.rad(0.0001).description == "0.0001rad")
    }

    @Test func `very large angles render correctly`() {
        #expect(Angle.deg(720).description == "720deg")
        #expect(Angle.turn(10).description == "10turn")
    }

    @Test func `whole number decimals render without fractional part`() {
        #expect(Angle.deg(90.0).description == "90deg")
        #expect(Angle.turn(1.0).description == "1turn")
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `Angle - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `angle creation 100K times`() {
            for i in 0..<100_000 {
                _ = Angle.deg(Double(i))
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `angle comparison 100K times`() {
            let angle1 = Angle.deg(45)
            for i in 0..<100_000 {
                _ = Angle.deg(Double(i)) == angle1
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `angle unit variations 100K times`() {
            for i in 0..<100_000 {
                let d = Double(i)
                _ = Angle.deg(d)
                _ = Angle.rad(d)
                _ = Angle.grad(d)
                _ = Angle.turn(d)
            }
        }
    }
}
