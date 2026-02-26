// TimePercentage Tests.swift
// swift-w3c-css
//
// Tests for CSS TimePercentage type

import Testing

@testable import W3C_CSS_Values

// MARK: - Basic Functionality

@Suite
struct `TimePercentage - Time Values` {
    @Test(arguments: [
        (1.5, "s", "1.5s"),
        (500, "ms", "500ms"),
        (2, "s", "2s"),
        (100, "ms", "100ms"),
    ])
    func `time value renders correctly`(
        value: Double,
        unit: String,
        expected: String
    ) {
        let time: TimePercentage
        if unit == "s" {
            time = TimePercentage.s(value)
        } else {
            time = TimePercentage.ms(value)
        }
        #expect(time.description == expected)
    }

    @Test func `time case renders correctly`() {
        let timeValue = TimePercentage.time(.s(2))
        #expect(timeValue.description == "2s")
    }
}

@Suite
struct `TimePercentage - Percentage Values` {
    @Test(arguments: [
        (50, "50%"),
        (33.33, "33.33%"),
        (-25, "-25%"),
        (100, "100%"),
        (0, "0%"),
    ])
    func `percentage value renders correctly`(
        value: Percentage,
        expected: String
    ) {
        let percentage = TimePercentage.percentage(value)
        #expect(percentage.description == expected)
    }
}

// MARK: - Factory Methods

@Suite
struct `TimePercentage - Factory Methods` {
    @Test func `s factory creates correct time`() {
        let seconds = TimePercentage.s(1.5)
        if case .time(let time) = seconds {
            #expect(time.value == 1.5)
            #expect(time.unit == .s)
        } else {
            #expect(Bool(false), "Expected .time case")
        }
    }

    @Test func `ms factory creates correct time`() {
        let ms = TimePercentage.ms(750)
        if case .time(let time) = ms {
            #expect(time.value == 750)
            #expect(time.unit == .ms)
        } else {
            #expect(Bool(false), "Expected .time case")
        }
    }

    @Test func `percentage factory creates correct percentage`() {
        let percentage = TimePercentage.percentage(25)
        if case .percentage(let value) = percentage {
            #expect(value == 25)
        } else {
            #expect(Bool(false), "Expected .percentage case")
        }
    }
}

// MARK: - Predefined Constants

@Suite
struct `TimePercentage - Predefined Constants` {
    @Test func `zero constant renders correctly`() {
        #expect(TimePercentage.zero.description == "0s")
    }

    @Test func `half constant renders correctly`() {
        #expect(TimePercentage.half.description == "50%")
    }

    @Test func `full constant renders correctly`() {
        #expect(TimePercentage.full.description == "100%")
    }
}

// MARK: - Arithmetic Operations

@Suite
struct `TimePercentage - Multiplication` {
    @Test func `seconds can be multiplied`() {
        let seconds = TimePercentage.s(2)
        let doubledSeconds = seconds * 2
        #expect(doubledSeconds.description == "4s")
    }

    @Test func `percentage can be multiplied`() {
        let percentage = TimePercentage.percentage(50)
        let doubledPercent = percentage * 2
        #expect(doubledPercent.description == "100%")
    }
}

@Suite
struct `TimePercentage - Division` {
    @Test func `seconds can be divided`() {
        let seconds = TimePercentage.s(2)
        let halvedSeconds = seconds / 2
        #expect(halvedSeconds.description == "1s")
    }

    @Test func `percentage can be divided`() {
        let percentage = TimePercentage.percentage(50)
        let halvedPercent = percentage / 2
        #expect(halvedPercent.description == "25%")
    }
}

// MARK: - Literal Conformance

@Suite
struct `TimePercentage - Integer Literal` {
    @Test func `integer literal creates seconds`() {
        let integerLiteral: TimePercentage = 2
        #expect(integerLiteral.description == "2s")
    }
}

@Suite
struct `TimePercentage - Float Literal` {
    @Test func `float literal creates seconds`() {
        let floatLiteral: TimePercentage = 1.5
        #expect(floatLiteral.description == "1.5s")
    }
}

// MARK: - Protocol Conformance

@Suite
struct `TimePercentage - Hashable Conformance` {
    @Test func `equal time values are equal`() {
        let seconds1 = TimePercentage.s(1)
        let seconds2 = TimePercentage.s(1)
        #expect(seconds1 == seconds2)
    }

    @Test func `different time values are not equal`() {
        let seconds1 = TimePercentage.s(1)
        let seconds3 = TimePercentage.s(2)
        #expect(seconds1 != seconds3)
    }

    @Test func `equal percentage values are equal`() {
        let percent1 = TimePercentage.percentage(50)
        let percent2 = TimePercentage.percentage(50)
        #expect(percent1 == percent2)
    }

    @Test func `different percentage values are not equal`() {
        let percent1 = TimePercentage.percentage(50)
        let percent3 = TimePercentage.percentage(75)
        #expect(percent1 != percent3)
    }

    @Test func `time and percentage are not equal`() {
        let seconds1 = TimePercentage.s(1)
        let percent1 = TimePercentage.percentage(50)
        #expect(seconds1 != percent1)
    }
}

// MARK: - Usage in Context

@Suite
struct `TimePercentage - CSS Property Usage` {
    @Test func `time renders correctly in transition property`() {
        let transition = "transition: all \(TimePercentage.s(0.3))"
        #expect(transition == "transition: all 0.3s")
    }

    @Test func `milliseconds renders correctly in animation property`() {
        let animation = "animation-duration: \(TimePercentage.ms(500))"
        #expect(animation == "animation-duration: 500ms")
    }

    @Test func `percentage renders correctly in animation property`() {
        let animation = "animation-delay: \(TimePercentage.percentage(50))"
        #expect(animation == "animation-delay: 50%")
    }
}

// MARK: - Edge Cases

@Suite
struct `TimePercentage - Edge Cases` {
    @Test func `zero values render correctly`() {
        #expect(TimePercentage.s(0).description == "0s")
        #expect(TimePercentage.ms(0).description == "0ms")
        #expect(TimePercentage.percentage(0).description == "0%")
    }

    @Test func `negative values render correctly`() {
        #expect(TimePercentage.s(-1).description == "-1s")
        #expect(TimePercentage.percentage(-25).description == "-25%")
    }

    @Test func `very small values preserve precision`() {
        #expect(TimePercentage.s(0.001).description == "0.001s")
        #expect(TimePercentage.percentage(0.1).description == "0.1%")
    }

    @Test func `very large values render correctly`() {
        #expect(TimePercentage.s(999999).description == "999999s")
        #expect(TimePercentage.ms(999999).description == "999999ms")
    }

    @Test func `decimal precision is maintained`() {
        #expect(TimePercentage.s(1.123456).description == "1.123456s")
        #expect(TimePercentage.percentage(33.333333).description == "33.333333%")
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `TimePercentage - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `time percentage creation 100K times`() {
            for i in 0..<100_000 {
                _ = TimePercentage.s(Double(i))
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `percentage creation 100K times`() {
            for i in 0..<100_000 {
                _ = TimePercentage.percentage(.init(i))
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `time percentage comparison 100K times`() {
            let tp1 = TimePercentage.s(1)
            for i in 0..<100_000 {
                _ = TimePercentage.s(Double(i)) == tp1
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `arithmetic operations 100K times`() {
            for i in 0..<100_000 {
                _ = TimePercentage.s(Double(i)) * 2
            }
        }
    }
}
