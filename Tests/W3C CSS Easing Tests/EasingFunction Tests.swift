// EasingFunction Tests.swift
// swift-w3c-css
//
// Tests for CSS EasingFunction type

import Testing
import W3C_CSS_Values

@testable import W3C_CSS_Easing

// MARK: - Predefined Easing Functions

@Suite
struct `EasingFunction - Predefined Values` {
    @Test(arguments: [
        (EasingFunction.linear, "linear"),
        (EasingFunction.ease, "ease"),
        (EasingFunction.easeIn, "ease-in"),
        (EasingFunction.easeOut, "ease-out"),
        (EasingFunction.easeInOut, "ease-in-out"),
        (EasingFunction.stepStart, "step-start"),
        (EasingFunction.stepEnd, "step-end"),
    ])
    func `predefined easing functions render correctly`(
        easing: EasingFunction,
        expected: String
    ) {
        #expect(easing.description == expected)
    }
}

// MARK: - Cubic Bezier

@Suite
struct `EasingFunction - Cubic Bezier` {
    @Test func `cubic bezier with standard values`() {
        let bezier = EasingFunction.cubicBezier(0.42, 0, 0.58, 1)
        #expect(bezier.description == "cubic-bezier(0.42, 0, 0.58, 1)")
    }

    @Test func `cubic bezier with different values`() {
        let bezier2 = EasingFunction.cubicBezier(0.25, 0.1, 0.25, 1)
        #expect(bezier2.description == "cubic-bezier(0.25, 0.1, 0.25, 1)")
    }

    @Test(arguments: [
        (0.0, 0.0, 1.0, 1.0, "cubic-bezier(0, 0, 1, 1)"),
        (0.5, 0.5, 0.5, 0.5, "cubic-bezier(0.5, 0.5, 0.5, 0.5)"),
        (1.0, 0.0, 0.0, 1.0, "cubic-bezier(1, 0, 0, 1)"),
    ])
    func `cubic bezier with various control points`(
        x1: Double,
        y1: Double,
        x2: Double,
        y2: Double,
        expected: String
    ) {
        let bezier = EasingFunction.cubicBezier(x1, y1, x2, y2)
        #expect(bezier.description == expected)
    }
}

// MARK: - Steps Function

@Suite
struct `EasingFunction - Steps Basic` {
    @Test func `steps without position`() {
        let steps1 = EasingFunction.steps(4, nil)
        #expect(steps1.description == "steps(4)")
    }

    @Test(arguments: [
        (2, "steps(2)"),
        (5, "steps(5)"),
        (10, "steps(10)"),
        (1, "steps(1)"),
    ])
    func `steps with different counts`(
        count: Int,
        expected: String
    ) {
        let steps = EasingFunction.steps(count, nil)
        #expect(steps.description == expected)
    }
}

@Suite
struct `EasingFunction - Steps with Position` {
    @Test func `steps with start position`() {
        let steps = EasingFunction.steps(3, .start)
        #expect(steps.description == "steps(3, start)")
    }

    @Test func `steps with end position`() {
        let steps = EasingFunction.steps(4, .end)
        #expect(steps.description == "steps(4, end)")
    }

    @Test func `steps with jump-none position`() {
        let steps = EasingFunction.steps(2, .jumpNone)
        #expect(steps.description == "steps(2, jump-none)")
    }

    @Test func `steps with jump-both position`() {
        let steps = EasingFunction.steps(5, .jumpBoth)
        #expect(steps.description == "steps(5, jump-both)")
    }

    @Test func `steps with jump-start position`() {
        let steps = EasingFunction.steps(3, .jumpStart)
        #expect(steps.description == "steps(3, jump-start)")
    }

    @Test func `steps with jump-end position`() {
        let steps = EasingFunction.steps(3, .jumpEnd)
        #expect(steps.description == "steps(3, jump-end)")
    }
}

// MARK: - Linear Points Function

@Suite
struct `EasingFunction - Linear Points` {
    @Test func `linear points with simple values`() {
        let points = [
            LinearPoint(value: 0),
            LinearPoint(value: 0.5, percentage: Percentage(50)),
            LinearPoint(value: 1),
        ]

        let linearPoints = EasingFunction.linearPoints(points)
        #expect(linearPoints.description == "linear(0, 0.5 50%, 1)")
    }

    @Test func `linear points with only values`() {
        let points = [
            LinearPoint(value: 0),
            LinearPoint(value: 0.25),
            LinearPoint(value: 0.75),
            LinearPoint(value: 1),
        ]

        let linearPoints = EasingFunction.linearPoints(points)
        #expect(linearPoints.description == "linear(0, 0.25, 0.75, 1)")
    }

    @Test func `linear points with all percentages`() {
        let points = [
            LinearPoint(value: 0, percentage: Percentage(0)),
            LinearPoint(value: 0.5, percentage: Percentage(50)),
            LinearPoint(value: 1, percentage: Percentage(100)),
        ]

        let linearPoints = EasingFunction.linearPoints(points)
        #expect(linearPoints.description == "linear(0 0%, 0.5 50%, 1 100%)")
    }

    @Test func `linear points with two points`() {
        let points = [
            LinearPoint(value: 0),
            LinearPoint(value: 1),
        ]

        let linearPoints = EasingFunction.linearPoints(points)
        #expect(linearPoints.description == "linear(0, 1)")
    }
}

// MARK: - Step Position Enum

@Suite
struct `EasingFunction - Step Position Values` {
    @Test(arguments: [
        (StepPosition.start, "start"),
        (StepPosition.end, "end"),
        (StepPosition.jumpStart, "jump-start"),
        (StepPosition.jumpEnd, "jump-end"),
        (StepPosition.jumpNone, "jump-none"),
        (StepPosition.jumpBoth, "jump-both"),
    ])
    func `step position values render correctly`(
        position: StepPosition,
        expected: String
    ) {
        #expect(position.description == expected)
    }
}

// MARK: - Linear Point Struct

@Suite
struct `EasingFunction - Linear Point` {
    @Test func `linear point without percentage`() {
        let point1 = LinearPoint(value: 0.5)
        #expect(point1.value == 0.5)
        #expect(point1.percentage == nil)
    }

    @Test func `linear point with percentage`() {
        let point2 = LinearPoint(value: 0.75, percentage: Percentage(75))
        #expect(point2.value == 0.75)
        #expect(point2.percentage?.value == 75)
    }

    @Test(arguments: [
        (0.0, nil),
        (1.0, nil),
        (0.5, 50),
        (0.25, 25),
        (0.75, 75),
    ])
    func `linear point initialization`(
        value: Double,
        percentageValue: Int?
    ) {
        let percentage = percentageValue.map { Percentage($0) }
        let point = LinearPoint(value: value, percentage: percentage)
        #expect(point.value == value)
        #expect(point.percentage?.value == percentageValue.map(Double.init))
    }
}

// MARK: - Protocol Conformance

@Suite
struct `EasingFunction - Hashable Conformance` {
    @Test func `equal predefined easings are equal`() {
        #expect(EasingFunction.linear == EasingFunction.linear)
        #expect(EasingFunction.ease == EasingFunction.ease)
    }

    @Test func `different predefined easings are not equal`() {
        #expect(EasingFunction.ease != EasingFunction.easeIn)
        #expect(EasingFunction.linear != EasingFunction.easeOut)
    }

    @Test func `equal cubic beziers are equal`() {
        #expect(
            EasingFunction.cubicBezier(0.42, 0, 0.58, 1)
                == EasingFunction.cubicBezier(0.42, 0, 0.58, 1)
        )
    }

    @Test func `different cubic beziers are not equal`() {
        #expect(
            EasingFunction.cubicBezier(0.42, 0, 0.58, 1)
                != EasingFunction.cubicBezier(0.25, 0.1, 0.25, 1)
        )
    }

    @Test func `equal steps are equal`() {
        #expect(EasingFunction.steps(4, .end) == EasingFunction.steps(4, .end))
        #expect(EasingFunction.steps(3, nil) == EasingFunction.steps(3, nil))
    }

    @Test func `different steps are not equal`() {
        #expect(EasingFunction.steps(4, .end) != EasingFunction.steps(4, .start))
        #expect(EasingFunction.steps(4, .end) != EasingFunction.steps(3, .end))
    }

    @Test func `different easing types are not equal`() {
        #expect(EasingFunction.linear != EasingFunction.steps(4, nil))
        #expect(EasingFunction.cubicBezier(0.42, 0, 0.58, 1) != EasingFunction.ease)
    }
}

// MARK: - Usage in Context

@Suite
struct `EasingFunction - CSS Property Usage` {
    @Test func `easing in transition-timing-function property`() {
        let transition = "transition-timing-function: \(EasingFunction.easeInOut)"
        #expect(transition == "transition-timing-function: ease-in-out")
    }

    @Test func `cubic bezier in animation-timing-function property`() {
        let animation = "animation-timing-function: \(EasingFunction.cubicBezier(0.42, 0, 0.58, 1))"
        #expect(animation == "animation-timing-function: cubic-bezier(0.42, 0, 0.58, 1)")
    }

    @Test func `steps in transition property`() {
        let transition = "transition: opacity 1s \(EasingFunction.steps(4, .end))"
        #expect(transition == "transition: opacity 1s steps(4, end)")
    }

    @Test func `linear points in animation property`() {
        let points = [
            LinearPoint(value: 0),
            LinearPoint(value: 1),
        ]
        let animation = "animation-timing-function: \(EasingFunction.linearPoints(points))"
        #expect(animation == "animation-timing-function: linear(0, 1)")
    }
}

// MARK: - Edge Cases

@Suite
struct `EasingFunction - Edge Cases` {
    @Test func `cubic bezier with zero values`() {
        let bezier = EasingFunction.cubicBezier(0, 0, 0, 0)
        #expect(bezier.description == "cubic-bezier(0, 0, 0, 0)")
    }

    @Test func `cubic bezier with one values`() {
        let bezier = EasingFunction.cubicBezier(1, 1, 1, 1)
        #expect(bezier.description == "cubic-bezier(1, 1, 1, 1)")
    }

    @Test func `steps with count of 1`() {
        let steps = EasingFunction.steps(1, nil)
        #expect(steps.description == "steps(1)")
    }

    @Test func `steps with large count`() {
        let steps = EasingFunction.steps(100, .start)
        #expect(steps.description == "steps(100, start)")
    }

    @Test func `linear points with single point`() {
        let points = [LinearPoint(value: 0.5)]
        let linearPoints = EasingFunction.linearPoints(points)
        #expect(linearPoints.description == "linear(0.5)")
    }

    @Test func `linear points with many points`() {
        let points = [
            LinearPoint(value: 0),
            LinearPoint(value: 0.2),
            LinearPoint(value: 0.4),
            LinearPoint(value: 0.6),
            LinearPoint(value: 0.8),
            LinearPoint(value: 1),
        ]
        let linearPoints = EasingFunction.linearPoints(points)
        #expect(linearPoints.description == "linear(0, 0.2, 0.4, 0.6, 0.8, 1)")
    }

    @Test func `cubic bezier with negative values`() {
        let bezier = EasingFunction.cubicBezier(-0.5, 0, 0.5, 1.5)
        #expect(bezier.description == "cubic-bezier(-0.5, 0, 0.5, 1.5)")
    }

    @Test func `linear point with zero value`() {
        let point = LinearPoint(value: 0, percentage: Percentage(0))
        #expect(point.value == 0)
        #expect(point.percentage?.value == 0)
    }

    @Test func `linear point with one value`() {
        let point = LinearPoint(value: 1, percentage: Percentage(100))
        #expect(point.value == 1)
        #expect(point.percentage?.value == 100)
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `EasingFunction - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `predefined easing creation 100K times`() {
            for i in 0..<100_000 {
                let _ = (i % 2 == 0) ? EasingFunction.ease : EasingFunction.linear
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `cubic bezier creation 100K times`() {
            for i in 0..<100_000 {
                let val = Double(i % 100) / 100.0
                _ = EasingFunction.cubicBezier(val, 0, 1 - val, 1)
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `steps creation 100K times`() {
            for i in 0..<100_000 {
                _ = EasingFunction.steps((i % 10) + 1, nil)
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `easing comparison 100K times`() {
            let easing1 = EasingFunction.cubicBezier(0.42, 0, 0.58, 1)
            for i in 0..<100_000 {
                let val = Double(i % 100) / 100.0
                _ = easing1 == EasingFunction.cubicBezier(val, 0, 1 - val, 1)
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `linear points creation 10K times`() {
            for _ in 0..<10_000 {
                let points = [
                    LinearPoint(value: 0),
                    LinearPoint(value: 0.5, percentage: Percentage(50)),
                    LinearPoint(value: 1),
                ]
                _ = EasingFunction.linearPoints(points)
            }
        }
    }
}
