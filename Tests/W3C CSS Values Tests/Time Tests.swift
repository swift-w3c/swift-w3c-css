// Time Tests.swift
// swift-w3c-css
//
// Tests for CSS Time type

import Testing

@testable import W3C_CSS_Values

// MARK: - Basic Functionality

@Suite
struct `Time - Initialization` {
    @Test(arguments: [
        (1.5, Time.Unit.s, "1.5s"),
        (500.0, .ms, "500ms"),
        (0.0, .s, "0s"),
        (0.0, .ms, "0ms"),
        (-0.5, .s, "-0.5s"),
    ])
    func `time values render correctly`(
        value: Double,
        unit: Time.Unit,
        expected: String
    ) {
        let time = Time(value, unit: unit)
        #expect(time.description == expected)
    }

    @Test func `zero constant uses seconds unit`() {
        let zero = Time.zero
        #expect(zero.description == "0s")
        #expect(zero.value == 0)
        #expect(zero.unit == .s)
    }

    @Test func `predefined time constants have correct values`() {
        #expect(Time.oneSecond.value == 1)
        #expect(Time.oneSecond.unit == .s)

        #expect(Time.halfSecond.value == 0.5)
        #expect(Time.halfSecond.unit == .s)
    }
}

@Suite
struct `Time - Factory Methods` {
    @Test func `seconds factory method creates correct time`() {
        #expect(Time.s(1.5).description == "1.5s")
        #expect(Time.s(1.5).value == 1.5)
        #expect(Time.s(1.5).unit == .s)
    }

    @Test func `milliseconds factory method creates correct time`() {
        #expect(Time.ms(500).description == "500ms")
        #expect(Time.ms(500).value == 500)
        #expect(Time.ms(500).unit == .ms)
    }
}

// MARK: - Unit Conversion

@Suite
struct `Time - Unit Conversion` {
    @Test func `seconds to milliseconds conversion`() {
        let oneSecond = Time.s(1)
        #expect(oneSecond.inMilliseconds == 1000)

        let twoSeconds = Time.s(2)
        #expect(twoSeconds.inMilliseconds == 2000)
    }

    @Test func `milliseconds to seconds conversion`() {
        let twoThousandMs = Time.ms(2000)
        #expect(twoThousandMs.inSeconds == 2)

        let fiveHundredMs = Time.ms(500)
        #expect(fiveHundredMs.inSeconds == 0.5)
    }

    @Test func `conversion to same unit returns same instance`() {
        let oneSecond = Time.s(1)
        let sameUnit = oneSecond.converted(to: .s)
        #expect(sameUnit == oneSecond)
    }

    @Test func `conversion to different unit`() {
        let oneSecond = Time.s(1)
        let converted = oneSecond.converted(to: .ms)
        #expect(converted.value == 1000)
        #expect(converted.unit == .ms)
    }

    @Test func `round trip conversion preserves value`() {
        let oneSecond = Time.s(1)
        let converted = oneSecond.converted(to: .ms)
        let backAgain = converted.converted(to: .s)
        #expect(backAgain.value == 1)
        #expect(backAgain.unit == .s)
    }
}

// MARK: - Arithmetic Operations

@Suite
struct `Time - Addition` {
    @Test func `addition with same units`() {
        let oneSecond = Time.s(1)
        let halfSecond = Time.s(0.5)
        let sum = oneSecond + halfSecond
        #expect(sum.value == 1.5)
        #expect(sum.unit == .s)
    }

    @Test func `addition with different units uses left operand unit`() {
        let oneSecond = Time.s(1)
        let fiveHundredMs = Time.ms(500)
        let sum = oneSecond + fiveHundredMs
        #expect(sum.value == 1.5)
        #expect(sum.unit == .s)
    }

    @Test func `addition respects operand order for unit`() {
        let fiveHundredMs = Time.ms(500)
        let oneSecond = Time.s(1)
        let sum = fiveHundredMs + oneSecond
        #expect(sum.value == 1500)
        #expect(sum.unit == .ms)
    }
}

@Suite
struct `Time - Subtraction` {
    @Test func `subtraction with same units`() {
        let oneSecond = Time.s(1)
        let halfSecond = Time.s(0.5)
        let diff = oneSecond - halfSecond
        #expect(diff.value == 0.5)
        #expect(diff.unit == .s)
    }

    @Test func `subtraction with different units uses left operand unit`() {
        let oneSecond = Time.s(1)
        let fiveHundredMs = Time.ms(500)
        let diff = oneSecond - fiveHundredMs
        #expect(diff.value == 0.5)
        #expect(diff.unit == .s)
    }
}

@Suite
struct `Time - Multiplication` {
    @Test func `multiplication preserves unit`() {
        let oneSecond = Time.s(1)
        let mul = oneSecond * 2
        #expect(mul.value == 2)
        #expect(mul.unit == .s)
    }

    @Test func `multiplication with milliseconds`() {
        let fiveHundredMs = Time.ms(500)
        let mul = fiveHundredMs * 3
        #expect(mul.value == 1500)
        #expect(mul.unit == .ms)
    }
}

@Suite
struct `Time - Division` {
    @Test func `division preserves unit`() {
        let oneSecond = Time.s(1)
        let div = oneSecond / 2
        #expect(div.value == 0.5)
        #expect(div.unit == .s)
    }

    @Test func `division with milliseconds`() {
        let fiveHundredMs = Time.ms(500)
        let div = fiveHundredMs / 5
        #expect(div.value == 100)
        #expect(div.unit == .ms)
    }
}

@Suite
struct `Time - Negation` {
    @Test func `negation produces negative time`() {
        let oneSecond = Time.s(1)
        let neg = -oneSecond
        #expect(neg.value == -1)
        #expect(neg.unit == .s)
    }

    @Test func `negation preserves unit`() {
        let fiveHundredMs = Time.ms(500)
        let neg = -fiveHundredMs
        #expect(neg.value == -500)
        #expect(neg.unit == .ms)
    }
}

// MARK: - Protocol Conformance

@Suite
struct `Time - Comparable Conformance` {
    @Test func `comparison with same units`() {
        let halfSecond = Time.s(0.5)
        let oneSecond = Time.s(1)
        let twoSeconds = Time.s(2)

        #expect(halfSecond < oneSecond)
        #expect(oneSecond < twoSeconds)
        #expect(!(oneSecond < oneSecond))
    }

    @Test func `comparison with different units`() {
        let fiveHundredMs = Time.ms(500)
        let oneSecond = Time.s(1)
        let twoThousandMs = Time.ms(2000)

        #expect(fiveHundredMs < oneSecond)
        #expect(oneSecond < twoThousandMs)
    }

    @Test func `equality across units`() {
        let fiveHundredMs = Time.ms(500)
        let halfSecond = Time.s(0.5)
        #expect(fiveHundredMs == halfSecond)

        let twoThousandMs = Time.ms(2000)
        let twoSeconds = Time.s(2)
        #expect(twoThousandMs == twoSeconds)
    }
}

// MARK: - Literal Conformance

@Suite
struct `Time - Integer Literal` {
    @Test func `integer literal creates seconds time`() {
        let integerLiteral: Time = 2
        #expect(integerLiteral.value == 2)
        #expect(integerLiteral.unit == .s)
    }
}

@Suite
struct `Time - Float Literal` {
    @Test func `float literal creates seconds time`() {
        let floatLiteral: Time = 1.5
        #expect(floatLiteral.value == 1.5)
        #expect(floatLiteral.unit == .s)
    }
}

// MARK: - Unit Hashable

@Suite
struct `Time - Unit Hashable` {
    @Test func `time units conform to hashable`() {
        #expect(Time.Unit.s == Time.Unit.s)
        #expect(Time.Unit.ms == Time.Unit.ms)
        #expect(Time.Unit.s != Time.Unit.ms)
    }
}

// MARK: - Usage in Context

@Suite
struct `Time - CSS Property Usage` {
    @Test func `time renders correctly in transition-duration property`() {
        let transition = "transition-duration: \(Time.s(0.3))"
        #expect(transition == "transition-duration: 0.3s")
    }

    @Test func `time renders correctly in animation-duration property`() {
        let animation = "animation-duration: \(Time.ms(500))"
        #expect(animation == "animation-duration: 500ms")
    }

    @Test func `time renders correctly in transition-delay property`() {
        let delay = "transition-delay: \(Time.s(0.1))"
        #expect(delay == "transition-delay: 0.1s")
    }
}

// MARK: - Edge Cases

@Suite
struct `Time - Edge Cases` {
    @Test func `zero time renders correctly`() {
        #expect(Time.zero.description == "0s")
        #expect(Time.s(0).description == "0s")
        #expect(Time.ms(0).description == "0ms")
    }

    @Test func `negative times render correctly`() {
        #expect(Time.s(-0.5).description == "-0.5s")
        #expect(Time.ms(-500).description == "-500ms")
    }

    @Test func `very small times preserve precision`() {
        #expect(Time.s(0.001).description == "0.001s")
        #expect(Time.ms(0.1).description == "0.1ms")
    }

    @Test func `very large times render correctly`() {
        #expect(Time.s(999999).description == "999999s")
        #expect(Time.ms(1_000_000).description == "1000000ms")
    }

    @Test func `whole number decimals render without fractional part`() {
        #expect(Time.s(1.0).description == "1s")
        #expect(Time.ms(500.0).description == "500ms")
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `Time - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `time creation 100K times`() {
            for i in 0..<100_000 {
                _ = Time.s(Double(i))
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `time arithmetic 100K times`() {
            for i in 0..<100_000 {
                _ = Time.s(Double(i)) + Time.s(Double(i + 1))
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `time comparison 100K times`() {
            let t1 = Time.s(1)
            for i in 0..<100_000 {
                _ = Time.s(Double(i)) < t1
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `time unit conversion 100K times`() {
            for i in 0..<100_000 {
                let t = Time.s(Double(i))
                _ = t.converted(to: .ms)
            }
        }
    }
}
