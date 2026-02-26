// CalcKeyword Tests.swift
// swift-w3c-css
//
// Tests for CSS CalcKeyword type

import Testing

@testable import W3C_CSS_Values

// MARK: - Basic Functionality

@Suite
struct `CalcKeyword - Enum Cases` {
    @Test(arguments: [
        (CalcKeyword.e, "e"),
        (.pi, "pi"),
        (.infinity, "infinity"),
        (.negativeInfinity, "-infinity"),
        (.NaN, "NaN"),
    ])
    func `calc keyword renders correctly`(
        keyword: CalcKeyword,
        expected: String
    ) {
        #expect(keyword.description == expected)
    }
}

@Suite
struct `CalcKeyword - Raw Values` {
    @Test func `e has correct raw value`() {
        #expect(CalcKeyword.e.rawValue == "e")
    }

    @Test func `pi has correct raw value`() {
        #expect(CalcKeyword.pi.rawValue == "pi")
    }

    @Test func `infinity has correct raw value`() {
        #expect(CalcKeyword.infinity.rawValue == "infinity")
    }

    @Test func `negative infinity has correct raw value`() {
        #expect(CalcKeyword.negativeInfinity.rawValue == "-infinity")
    }

    @Test func `NaN has correct raw value`() {
        #expect(CalcKeyword.NaN.rawValue == "NaN")
    }
}

// MARK: - Protocol Conformance

@Suite
struct `CalcKeyword - Hashable Conformance` {
    @Test func `equal keywords are equal`() {
        let e1 = CalcKeyword.e
        let e2 = CalcKeyword.e
        #expect(e1 == e2)
    }

    @Test func `different keywords are not equal`() {
        let e1 = CalcKeyword.e
        let pi = CalcKeyword.pi
        #expect(e1 != pi)
    }

    @Test func `infinity and negative infinity are not equal`() {
        #expect(CalcKeyword.infinity != CalcKeyword.negativeInfinity)
    }
}

@Suite
struct `CalcKeyword - CustomStringConvertible` {
    @Test func `e description matches raw value`() {
        let e = CalcKeyword.e
        #expect(e.description == e.rawValue)
        #expect(String(describing: e) == "e")
    }

    @Test func `pi description matches raw value`() {
        let pi = CalcKeyword.pi
        #expect(pi.description == pi.rawValue)
        #expect(String(describing: pi) == "pi")
    }

    @Test func `infinity description matches raw value`() {
        let infinity = CalcKeyword.infinity
        #expect(infinity.description == infinity.rawValue)
        #expect(String(describing: infinity) == "infinity")
    }

    @Test func `negative infinity description matches raw value`() {
        let negInf = CalcKeyword.negativeInfinity
        #expect(negInf.description == negInf.rawValue)
        #expect(String(describing: negInf) == "-infinity")
    }

    @Test func `NaN description matches raw value`() {
        let nan = CalcKeyword.NaN
        #expect(nan.description == nan.rawValue)
        #expect(String(describing: nan) == "NaN")
    }
}

// MARK: - Usage in Context

@Suite
struct `CalcKeyword - CSS Property Usage` {
    @Test func `e renders correctly in calc expression`() {
        let calc = "width: calc(\(CalcKeyword.e) * 10px)"
        #expect(calc == "width: calc(e * 10px)")
    }

    @Test func `pi renders correctly in calc expression`() {
        let calc = "transform: rotate(calc(\(CalcKeyword.pi) * 1rad))"
        #expect(calc == "transform: rotate(calc(pi * 1rad))")
    }

    @Test func `infinity renders correctly in calc expression`() {
        let calc = "width: calc(\(CalcKeyword.infinity))"
        #expect(calc == "width: calc(infinity)")
    }

    @Test func `negative infinity renders correctly`() {
        let calc = "width: calc(\(CalcKeyword.negativeInfinity))"
        #expect(calc == "width: calc(-infinity)")
    }

    @Test func `NaN renders correctly in calc expression`() {
        let calc = "width: calc(\(CalcKeyword.NaN))"
        #expect(calc == "width: calc(NaN)")
    }
}

// MARK: - Edge Cases

@Suite
struct `CalcKeyword - All Keywords Coverage` {
    @Test func `all keywords can be constructed`() {
        let keywords: [CalcKeyword] = [.e, .pi, .infinity, .negativeInfinity, .NaN]
        #expect(keywords.count == 5)
    }

    @Test func `all keywords have unique raw values`() {
        let rawValues = Set([
            CalcKeyword.e.rawValue,
            CalcKeyword.pi.rawValue,
            CalcKeyword.infinity.rawValue,
            CalcKeyword.negativeInfinity.rawValue,
            CalcKeyword.NaN.rawValue,
        ])
        #expect(rawValues.count == 5)
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `CalcKeyword - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `calc keyword access 100K times`() {
            for _ in 0..<100_000 {
                _ = CalcKeyword.e
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `calc keyword description 100K times`() {
            for _ in 0..<100_000 {
                _ = CalcKeyword.pi.description
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `calc keyword comparison 100K times`() {
            let e = CalcKeyword.e
            for _ in 0..<100_000 {
                _ = CalcKeyword.pi == e
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `calc keyword raw value access 100K times`() {
            for _ in 0..<100_000 {
                _ = CalcKeyword.infinity.rawValue
            }
        }
    }
}
