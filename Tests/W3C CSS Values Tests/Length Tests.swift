// Length Tests.swift
// swift-w3c-css
//
// Tests for CSS Length type

import Testing
import W3C_CSS_Shared

@testable import W3C_CSS_Values

// MARK: - Basic Functionality

@Suite
struct `Length - Unit Creation` {
    @Test(arguments: [
        // Absolute units
        (10.0.px, "10px"),
        (2.5.cm, "2.5cm"),
        (5.0.mm, "5mm"),
        (1.0.in, "1in"),
        (12.0.pt, "12pt"),
        (2.0.pc, "2pc"),
        (5.0.q, "5q"),
        // Relative font units
        (1.5.em, "1.5em"),
        (2.0.rem, "2rem"),
        (3.0.ex, "3ex"),
        (4.0.ch, "4ch"),
        (2.0.cap, "2cap"),
        (3.0.lh, "3lh"),
        // Viewport units
        (50.0.vw, "50vw"),
        (100.0.vh, "100vh"),
        (10.0.vmin, "10vmin"),
        (90.0.vmax, "90vmax"),
    ])
    func `length with unit renders correctly`(
        length: Length,
        expected: String
    ) {
        #expect(length.description == expected)
    }
}

@Suite
struct `Length - Keywords` {
    @Test(arguments: [
        (Length.Keyword.auto, "auto"),
        (.maxContent, "max-content"),
        (.minContent, "min-content"),
        (.fitContent, "fit-content"),
    ])
    func `length keyword renders correctly`(
        keyword: Length.Keyword,
        expected: String
    ) {
        #expect(Length.keyword(keyword).description == expected)
    }
}

@Suite
struct `Length - Factory Methods` {
    @Test func `px factory method creates correct length`() {
        #expect(Length.px(10).description == "10px")
        #expect(Length.px(10.5).description == "10.5px")
    }

    @Test func `em factory method creates correct length`() {
        #expect(Length.em(1.5).description == "1.5em")
    }

    @Test func `rem factory method creates correct length`() {
        #expect(Length.rem(2).description == "2rem")
    }

    @Test func `vw factory method creates correct length`() {
        #expect(Length.vw(50).description == "50vw")
    }

    @Test func `vh factory method creates correct length`() {
        #expect(Length.vh(100).description == "100vh")
    }

    @Test func `auto factory method creates correct length`() {
        #expect(Length.auto.description == "auto")
    }

    @Test func `maxContent factory method creates correct length`() {
        #expect(Length.maxContent.description == "max-content")
    }

    @Test func `minContent factory method creates correct length`() {
        #expect(Length.minContent.description == "min-content")
    }

    @Test func `fitContent factory method creates correct length`() {
        #expect(Length.fitContent.description == "fit-content")
    }
}

// MARK: - Calc Expressions

@Suite
struct `Length - Calc` {
    @Test func `calc with percentage and length`() {
        #expect(Length.calc("100% - 20px").description == "calc(100% - 20px)")
    }

    @Test func `calc with viewport and font units`() {
        #expect(Length.calc("50vh + 10em").description == "calc(50vh + 10em)")
    }
}

// MARK: - Global Values

@Suite
struct `Length - Global Values` {
    @Test(arguments: [
        (Global.inherit, "inherit"),
        (.initial, "initial"),
        (.unset, "unset"),
    ])
    func `global value renders correctly`(
        global: Global,
        expected: String
    ) {
        #expect(Length.global(global).description == expected)
    }
}

// MARK: - Literal Conformance

@Suite
struct `Length - Integer Literal` {
    @Test func `integer literal creates px length`() {
        let length: Length = 10
        #expect(length.description == "10px")
    }
}

@Suite
struct `Length - Float Literal` {
    @Test func `float literal creates px length`() {
        let length: Length = 10.5
        #expect(length.description == "10.5px")
    }
}

// MARK: - Numeric Extensions

@Suite
struct `Length - Int Extensions` {
    @Test(arguments: [
        (10.px, "10px"),
        (2.em, "2em"),
        (50.vw, "50vw"),
        (1.cm, "1cm"),
        (3.q, "3q"),
    ])
    func `int extension creates correct length`(
        length: Length,
        expected: String
    ) {
        #expect(length.description == expected)
    }
}

@Suite
struct `Length - Double Extensions` {
    @Test(arguments: [
        (10.5.px, "10.5px"),
        (1.5.em, "1.5em"),
        (50.5.vw, "50.5vw"),
        (2.25.cm, "2.25cm"),
        (3.75.q, "3.75q"),
    ])
    func `double extension creates correct length`(
        length: Length,
        expected: String
    ) {
        #expect(length.description == expected)
    }
}

// MARK: - Protocol Conformance

@Suite
struct `Length - Hashable Conformance` {
    @Test func `equal values are equal`() {
        #expect(Length.px(10) == Length.px(10))
        #expect(Length.em(1.5) == Length.em(1.5))
        #expect(Length.auto == Length.auto)
    }

    @Test func `different values are not equal`() {
        #expect(Length.px(10) != Length.px(20))
        #expect(Length.em(1.5) != Length.em(2.5))
    }

    @Test func `different units are not equal`() {
        #expect(Length.px(10) != Length.em(10))
        #expect(Length.auto != Length.px(10))
    }

    @Test func `literal equals method form`() {
        #expect(Length.px(10) == 10)
        #expect(Length.px(10.5) == 10.5)
    }
}

// MARK: - Arithmetic Operations

@Suite
struct `Length - Addition` {
    @Test func `addition with same units`() {
        let sum1 = Length.px(10) + Length.px(20)
        #expect(sum1.description == "30px")

        let sum2 = Length.em(1.5) + Length.em(2.5)
        #expect(sum2.description == "4em")
    }

    @Test func `addition with different units creates calc`() {
        let mixedSum = Length.px(10) + Length.em(2)
        #expect(mixedSum.description == "calc(10px + 2em)")
    }
}

@Suite
struct `Length - Subtraction` {
    @Test func `subtraction with same units`() {
        let diff1 = Length.px(30) - Length.px(10)
        #expect(diff1.description == "20px")

        let diff2 = Length.em(4) - Length.em(1.5)
        #expect(diff2.description == "2.5em")
    }

    @Test func `subtraction with different units creates calc`() {
        let mixedDiff = Length.vw(100) - Length.px(20)
        #expect(mixedDiff.description == "calc(100vw - 20px)")
    }
}

@Suite
struct `Length - Multiplication` {
    @Test func `multiplication of same units`() {
        let product = Length.px(5) * Length.length(2, .px)
        #expect(product.description == "10px")
    }

    @Test func `multiplication of different units creates calc`() {
        let mixedProduct = 10.px * 2.em
        #expect(mixedProduct.description == "calc(10px * 2em)")
    }
}

@Suite
struct `Length - Division` {
    @Test func `division by double`() {
        let quotient1 = Length.px(10) / 2.0
        #expect(quotient1.description == "5px")
    }

    @Test func `division by int`() {
        let quotient2 = Length.px(15) / 3
        #expect(quotient2.description == "5px")
    }

    @Test func `division of em units`() {
        let quotient3 = Length.em(6) / 2
        #expect(quotient3.description == "3em")
    }
}

// MARK: - Usage in Context

@Suite
struct `Length - CSS Property Usage` {
    @Test func `length renders correctly in width property`() {
        let width = "width: \(Length.px(200))"
        #expect(width == "width: 200px")
    }

    @Test func `length renders correctly in margin property`() {
        let margin = "margin: \(Length.em(1.5))"
        #expect(margin == "margin: 1.5em")
    }

    @Test func `length keyword renders correctly in height property`() {
        let height = "height: \(Length.auto)"
        #expect(height == "height: auto")
    }

    @Test func `calc renders correctly in padding property`() {
        let padding = "padding: \(Length.calc("10% + 20px"))"
        #expect(padding == "padding: calc(10% + 20px)")
    }
}

// MARK: - Edge Cases

@Suite
struct `Length - Edge Cases` {
    @Test func `zero value renders correctly`() {
        #expect(Length.px(0).description == "0px")
        #expect(Length.em(0).description == "0em")
    }

    @Test func `negative values render correctly`() {
        #expect(Length.px(-10).description == "-10px")
        #expect(Length.em(-1.5).description == "-1.5em")
    }

    @Test func `very small values preserve precision`() {
        #expect(Length.px(0.001).description == "0.001px")
        #expect(Length.em(0.0001).description == "0.0001em")
    }

    @Test func `very large values render correctly`() {
        #expect(Length.px(999999).description == "999999px")
        #expect(Length.vw(1000).description == "1000vw")
    }

    @Test func `decimal precision is maintained`() {
        #expect(Length.px(10.123456).description == "10.123456px")
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `Length - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `length creation 100K times`() {
            for i in 0..<100_000 {
                _ = Length.px(Double(i))
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `length arithmetic 100K times`() {
            for i in 0..<100_000 {
                _ = Length.px(Double(i)) + Length.px(Double(i + 1))
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `length comparison 100K times`() {
            let length1 = Length.px(50)
            for i in 0..<100_000 {
                _ = Length.px(Double(i)) == length1
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `length factory method 100K times`() {
            for i in 0..<100_000 {
                _ = Double(i).px
            }
        }
    }
}
