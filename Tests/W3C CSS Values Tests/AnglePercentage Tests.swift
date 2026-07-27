// AnglePercentage Tests.swift
// swift-w3c-css
//
// Tests for CSS AnglePercentage type

import Testing

@testable import W3C_CSS_Values

// MARK: - Basic Functionality

@Suite
struct `AnglePercentage - Angle Values` {
    @Test(arguments: [
        (Angle.deg(45), "45deg"),
        (Angle.rad(1.5708), "1.5708rad"),
        (Angle.grad(100), "100grad"),
        (Angle.turn(0.25), "0.25turn"),
    ])
    func `angle value renders correctly`(
        angle: Angle,
        expected: String
    ) {
        let anglePercentage = AnglePercentage.angle(angle)
        #expect(anglePercentage.description == expected)
    }
}

@Suite
struct `AnglePercentage - Percentage Values` {
    @Test(arguments: [
        (0, "0%"),
        (50, "50%"),
        (100, "100%"),
        (33.33, "33.33%"),
        (-25, "-25%"),
    ])
    func `percentage value renders correctly`(
        value: Percentage,
        expected: String
    ) {
        let percentage = AnglePercentage.percentage(value)
        #expect(percentage.description == expected)
    }
}

// MARK: - Literal Conformance

@Suite
struct `AnglePercentage - Integer Literal` {
    @Test func `integer literal creates deg angle`() {
        let angle: AnglePercentage = 45
        #expect(angle.description == "45deg")
    }

    @Test func `integer literal creates correct case`() {
        let angle: AnglePercentage = 45
        if case .angle(let innerAngle) = angle, case .deg(let value) = innerAngle {
            #expect(value == 45)
        } else {
            #expect(Bool(false), "Expected .angle(.deg(45))")
        }
    }
}

@Suite
struct `AnglePercentage - Float Literal` {
    @Test func `float literal creates deg angle`() {
        let angle: AnglePercentage = 45.5
        #expect(angle.description == "45.5deg")
    }

    @Test func `float literal creates correct case`() {
        let angle: AnglePercentage = 45.5
        if case .angle(let innerAngle) = angle, case .deg(let value) = innerAngle {
            #expect(value == 45.5)
        } else {
            #expect(Bool(false), "Expected .angle(.deg(45.5))")
        }
    }
}

// MARK: - Protocol Conformance

@Suite
struct `AnglePercentage - Hashable Conformance` {
    @Test func `equal angle values are equal`() {
        let angle1 = AnglePercentage.angle(.deg(45))
        let angle2 = AnglePercentage.angle(.deg(45))
        #expect(angle1 == angle2)
    }

    @Test func `different angle values are not equal`() {
        let angle1 = AnglePercentage.angle(.deg(45))
        let angle3 = AnglePercentage.angle(.deg(90))
        #expect(angle1 != angle3)
    }

    @Test func `equal percentage values are equal`() {
        let percent1 = AnglePercentage.percentage(50)
        let percent2 = AnglePercentage.percentage(50)
        #expect(percent1 == percent2)
    }

    @Test func `different percentage values are not equal`() {
        let percent1 = AnglePercentage.percentage(50)
        let percent3 = AnglePercentage.percentage(75)
        #expect(percent1 != percent3)
    }

    @Test func `angle and percentage are not equal`() {
        let angle1 = AnglePercentage.angle(.deg(45))
        let percent1 = AnglePercentage.percentage(50)
        #expect(angle1 != percent1)
    }

    @Test func `different angle types with equivalent values are not equal`() {
        let angle1 = AnglePercentage.angle(.deg(45))
        let turn = AnglePercentage.angle(.turn(0.125))  // 45 degrees as turn
        #expect(angle1 != turn)
    }

    @Test func `literal equals angle equivalent`() {
        let literal: AnglePercentage = 45
        let angle1 = AnglePercentage.angle(.deg(45))
        #expect(literal == angle1)
    }
}

// MARK: - Usage in Context

@Suite
struct `AnglePercentage - CSS Property Usage` {
    @Test func `angle renders correctly in transform property`() {
        let transform = "transform: rotate(\(AnglePercentage.angle(.deg(45))))"
        #expect(transform == "transform: rotate(45deg)")
    }

    @Test func `percentage renders correctly in conic-gradient`() {
        let gradient = "background: conic-gradient(at \(AnglePercentage.percentage(50)))"
        #expect(gradient == "background: conic-gradient(at 50%)")
    }

    @Test func `radian angle renders correctly`() {
        let transform = "transform: rotate(\(AnglePercentage.angle(.rad(1.5708))))"
        #expect(transform == "transform: rotate(1.5708rad)")
    }

    @Test func `turn angle renders correctly`() {
        let transform = "transform: rotate(\(AnglePercentage.angle(.turn(0.25))))"
        #expect(transform == "transform: rotate(0.25turn)")
    }
}

// MARK: - Edge Cases

@Suite
struct `AnglePercentage - Edge Cases` {
    @Test func `zero values render correctly`() {
        #expect(AnglePercentage.angle(.deg(0)).description == "0deg")
        #expect(AnglePercentage.percentage(0).description == "0%")
    }

    @Test func `negative values render correctly`() {
        #expect(AnglePercentage.angle(.deg(-45)).description == "-45deg")
        #expect(AnglePercentage.percentage(-25).description == "-25%")
    }

    @Test func `very small values preserve precision`() {
        #expect(AnglePercentage.angle(.deg(0.001)).description == "0.001deg")
        #expect(AnglePercentage.percentage(0.1).description == "0.1%")
    }

    @Test func `very large values render correctly`() {
        #expect(AnglePercentage.angle(.deg(360)).description == "360deg")
        #expect(AnglePercentage.angle(.deg(720)).description == "720deg")
    }

    @Test func `decimal precision is maintained`() {
        #expect(AnglePercentage.angle(.deg(45.123456)).description == "45.123456deg")
        #expect(AnglePercentage.percentage(33.333333).description == "33.333333%")
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `AnglePercentage - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `angle percentage creation 100K times`() {
            for i in 0..<100_000 {
                _ = AnglePercentage.angle(.deg(Double(i)))
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `percentage creation 100K times`() {
            for i in 0..<100_000 {
                _ = AnglePercentage.percentage(Percentage(i))
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `angle percentage comparison 100K times`() {
            let ap1 = AnglePercentage.angle(.deg(45))
            for i in 0..<100_000 {
                _ = AnglePercentage.angle(.deg(Double(i))) == ap1
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `literal creation 100K times`() {
            for i in 0..<100_000 {
                let _: AnglePercentage = AnglePercentage(integerLiteral: i)
            }
        }
    }
}
