// LengthPercentage Tests.swift
// swift-w3c-css
//
// Tests for CSS LengthPercentage type

import Testing

@testable import W3C_CSS_Values

// MARK: - Basic Functionality

@Suite
struct `LengthPercentage - Length Values` {
    @Test(arguments: [
        (Length.px(10), "10px"),
        (Length.em(1.5), "1.5em"),
        (Length.rem(2), "2rem"),
        (Length.vw(50), "50vw"),
        (Length.vh(100), "100vh"),
    ])
    func `length value renders correctly`(
        length: Length,
        expected: String
    ) {
        let lengthPercentage = LengthPercentage.length(length)
        #expect(lengthPercentage.description == expected)
    }
}

@Suite
struct `LengthPercentage - Percentage Values` {
    @Test(arguments: [
        (50, "50%"),
        (75, "75%"),
        (33.3, "33.3%"),
        (100, "100%"),
        (0, "0%"),
    ])
    func `percentage value renders correctly`(
        value: Double,
        expected: String
    ) {
        let percentage = LengthPercentage.percentage(Percentage(value))
        #expect(percentage.description == expected)
    }
}

@Suite
struct `LengthPercentage - Calc Expressions` {
    @Test(arguments: [
        ("100% - 20px", "calc(100% - 20px)"),
        ("50vh + 2em", "calc(50vh + 2em)"),
        ("100% + 10px", "calc(100% + 10px)"),
    ])
    func `calc expression renders correctly`(
        expression: String,
        expected: String
    ) {
        let calc = LengthPercentage.calc(expression)
        #expect(calc.description == expected)
    }
}

// MARK: - Factory Methods

@Suite
struct `LengthPercentage - Factory Methods` {
    @Test func `px factory method with double`() {
        let px = LengthPercentage.px(10.5)
        #expect(px.description == "10.5px")
    }

    @Test func `px factory method with int`() {
        let pxInt = LengthPercentage.px(20)
        #expect(pxInt.description == "20px")
    }

    @Test func `em factory method with double`() {
        let em = LengthPercentage.em(1.5)
        #expect(em.description == "1.5em")
    }

    @Test func `em factory method with int`() {
        let emInt = LengthPercentage.em(2)
        #expect(emInt.description == "2em")
    }

    @Test func `rem factory method with double`() {
        let rem = LengthPercentage.rem(2.5)
        #expect(rem.description == "2.5rem")
    }

    @Test func `rem factory method with int`() {
        let remInt = LengthPercentage.rem(3)
        #expect(remInt.description == "3rem")
    }

    @Test func `percentage factory method with int`() {
        let percent = LengthPercentage.percentage(50)
        #expect(percent.description == "50%")
    }

    @Test func `auto factory method`() {
        #expect(LengthPercentage.auto.description == "auto")
    }
}

// MARK: - Literal Conformance

@Suite
struct `LengthPercentage - Integer Literal` {
    @Test func `integer literal creates px length`() {
        let lengthPercentage: LengthPercentage = 10
        #expect(lengthPercentage.description == "10px")
    }
}

@Suite
struct `LengthPercentage - Float Literal` {
    @Test func `float literal creates px length`() {
        let lengthPercentage: LengthPercentage = 10.5
        #expect(lengthPercentage.description == "10.5px")
    }
}

// MARK: - Protocol Conformance

@Suite
struct `LengthPercentage - Hashable Conformance` {
    @Test func `equal values are equal`() {
        #expect(LengthPercentage.px(10) == LengthPercentage.px(10))
        #expect(LengthPercentage.percentage(50) == LengthPercentage.percentage(50))
        #expect(LengthPercentage.calc("100% - 20px") == LengthPercentage.calc("100% - 20px"))
    }

    @Test func `different values are not equal`() {
        #expect(LengthPercentage.px(10) != LengthPercentage.px(20))
        #expect(LengthPercentage.percentage(50) != LengthPercentage.percentage(75))
    }

    @Test func `different types are not equal`() {
        #expect(LengthPercentage.px(10) != LengthPercentage.percentage(10))
        #expect(LengthPercentage.calc("50%") != LengthPercentage.percentage(50))
    }
}

// MARK: - Usage in Context

@Suite
struct `LengthPercentage - CSS Property Usage` {
    @Test func `length renders correctly in width property`() {
        let width = "width: \(LengthPercentage.px(200))"
        #expect(width == "width: 200px")
    }

    @Test func `percentage renders correctly in height property`() {
        let height = "height: \(LengthPercentage.percentage(50))"
        #expect(height == "height: 50%")
    }

    @Test func `calc renders correctly in margin property`() {
        let margin = "margin: \(LengthPercentage.calc("100% - 20px"))"
        #expect(margin == "margin: calc(100% - 20px)")
    }

    @Test func `rem renders correctly in font-size property`() {
        let fontSize = "font-size: \(LengthPercentage.rem(1.2))"
        #expect(fontSize == "font-size: 1.2rem")
    }
}

// MARK: - Edge Cases

@Suite
struct `LengthPercentage - Edge Cases` {
    @Test func `zero values render correctly`() {
        #expect(LengthPercentage.px(0).description == "0px")
        #expect(LengthPercentage.percentage(0).description == "0%")
    }

    @Test func `negative values render correctly`() {
        #expect(LengthPercentage.px(-10).description == "-10px")
        #expect(LengthPercentage.percentage(-25).description == "-25%")
    }

    @Test func `very small values preserve precision`() {
        #expect(LengthPercentage.px(0.001).description == "0.001px")
        #expect(LengthPercentage.percentage(0.1).description == "0.1%")
    }

    @Test func `very large values render correctly`() {
        #expect(LengthPercentage.px(999999).description == "999999px")
        #expect(LengthPercentage.percentage(1000).description == "1000%")
    }

    @Test func `decimal precision is maintained`() {
        #expect(LengthPercentage.px(10.123456).description == "10.123456px")
        #expect(LengthPercentage.percentage(33.333333).description == "33.333333%")
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `LengthPercentage - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `length percentage creation 100K times`() {
            for i in 0..<100_000 {
                _ = LengthPercentage.px(Double(i))
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `percentage creation 100K times`() {
            for i in 0..<100_000 {
                _ = LengthPercentage.percentage(.init(i))
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `length percentage comparison 100K times`() {
            let lp1 = LengthPercentage.px(50)
            for i in 0..<100_000 {
                _ = LengthPercentage.px(Double(i)) == lp1
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `factory method 100K times`() {
            for i in 0..<100_000 {
                _ = LengthPercentage.em(Double(i))
            }
        }
    }
}
