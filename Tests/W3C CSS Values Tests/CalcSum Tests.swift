// CalcSum Tests.swift
// swift-w3c-css
//
// Tests for CSS CalcSum type

import Testing

@testable import W3C_CSS_Values

// MARK: - Basic Functionality

@Suite
struct `CalcSum - Initialization` {
    @Test(arguments: [
        ("100% - 20px", "calc(100% - 20px)"),
        ("3 * (2em + 5px)", "calc(3 * (2em + 5px))"),
        ("50% + 1rem", "calc(50% + 1rem)"),
        ("(100vw - 2 * 3rem) / 2", "calc((100vw - 2 * 3rem) / 2)"),
    ])
    func `initializer creates proper instances`(
        expression: String,
        expected: String
    ) {
        let calcExpression = CalcSum(expression)
        #expect(calcExpression.description == expected)
    }
}

// MARK: - Factory Methods

@Suite
struct `CalcSum - Calc Factory` {
    @Test(arguments: [
        ("50% + 1rem", "calc(50% + 1rem)"),
        ("(100vw - 2 * 3rem) / 2", "calc((100vw - 2 * 3rem) / 2)"),
    ])
    func `calc factory creates proper instances`(
        expression: String,
        expected: String
    ) {
        let calc = CalcSum.calc(expression)
        #expect(calc.description == expected)
    }
}

@Suite
struct `CalcSum - Min Factory` {
    @Test(arguments: [
        ("10px, 2em", "min(10px, 2em)"),
        ("50%, 300px, 20em", "min(50%, 300px, 20em)"),
    ])
    func `min factory creates proper instances`(
        expression: String,
        expected: String
    ) {
        let min = CalcSum.min(expression)
        #expect(min.description == expected)
    }
}

@Suite
struct `CalcSum - Max Factory` {
    @Test(arguments: [
        ("100px, 50%", "max(100px, 50%)"),
        ("10vw, 50px, 4em", "max(10vw, 50px, 4em)"),
    ])
    func `max factory creates proper instances`(
        expression: String,
        expected: String
    ) {
        let max = CalcSum.max(expression)
        #expect(max.description == expected)
    }
}

@Suite
struct `CalcSum - Clamp Factory` {
    @Test(arguments: [
        ("10px", "5vw", "50px", "clamp(10px, 5vw, 50px)"),
        ("1rem", "5vw", "2rem", "clamp(1rem, 5vw, 2rem)"),
    ])
    func `clamp factory creates proper instances`(
        min: String,
        preferred: String,
        max: String,
        expected: String
    ) {
        let clamp = CalcSum.clamp(min: min, preferred: preferred, max: max)
        #expect(clamp.description == expected)
    }
}

// MARK: - Nested Math Functions

@Suite
struct `CalcSum - Nested Functions` {
    @Test func `calc inside another calc`() {
        let nestedCalc = CalcSum("calc(100% - 20px) + 1rem")
        #expect(nestedCalc.description == "calc(calc(100% - 20px) + 1rem)")
    }

    @Test func `min as complete expression not wrapped in calc`() {
        let minFunction = CalcSum("min(10px, 2em)")
        #expect(minFunction.description == "min(10px, 2em)")
    }

    @Test func `max as complete expression not wrapped in calc`() {
        let maxFunction = CalcSum("max(100px, 50%)")
        #expect(maxFunction.description == "max(100px, 50%)")
    }

    @Test func `clamp as complete expression not wrapped in calc`() {
        let clampFunction = CalcSum("clamp(10px, 5vw, 50px)")
        #expect(clampFunction.description == "clamp(10px, 5vw, 50px)")
    }

    @Test func `min nested in an expression`() {
        let nestedMin = CalcSum("min(10%, 20px) + 1rem")
        #expect(nestedMin.description == "calc(min(10%, 20px) + 1rem)")
    }
}

// MARK: - CSS Keywords

@Suite
struct `CalcSum - CSS Keywords` {
    @Test(arguments: [
        ("e * 10px", "calc(e * 10px)"),
        ("pi * 1rem", "calc(pi * 1rem)"),
        ("2 * pi * 5rem", "calc(2 * pi * 5rem)"),
    ])
    func `expressions with keywords render correctly`(
        expression: String,
        expected: String
    ) {
        let withKeyword = CalcSum(expression)
        #expect(withKeyword.description == expected)
    }
}

// MARK: - Protocol Conformance

@Suite
struct `CalcSum - Hashable Conformance` {
    @Test func `same expressions are equal`() {
        let calc1 = CalcSum("100% - 20px")
        let calc2 = CalcSum("100% - 20px")
        #expect(calc1 == calc2)
    }

    @Test func `different expressions are not equal`() {
        let calc1 = CalcSum("100% - 20px")
        let calc3 = CalcSum("50% + 1rem")
        #expect(calc1 != calc3)
    }

    @Test func `functions are equal when expressions match`() {
        let min1 = CalcSum.min("10px, 2em")
        let min2 = CalcSum.min("10px, 2em")
        #expect(min1 == min2)
    }

    @Test func `different functions are not equal`() {
        let min = CalcSum.min("10px, 2em")
        let max = CalcSum.max("10px, 2em")
        #expect(min != max)
    }
}

// MARK: - Usage in Context

@Suite
struct `CalcSum - CSS Property Usage` {
    @Test func `calc renders correctly in width property`() {
        let width = "width: \(CalcSum("100% - 20px"))"
        #expect(width == "width: calc(100% - 20px)")
    }

    @Test func `min renders correctly in height property`() {
        let height = "height: \(CalcSum.min("100vh, 500px"))"
        #expect(height == "height: min(100vh, 500px)")
    }

    @Test func `max renders correctly in margin property`() {
        let margin = "margin: \(CalcSum.max("1rem, 10px"))"
        #expect(margin == "margin: max(1rem, 10px)")
    }

    @Test func `clamp renders correctly in font-size property`() {
        let fontSize = "font-size: \(CalcSum.clamp(min: "1rem", preferred: "5vw", max: "2rem"))"
        #expect(fontSize == "font-size: clamp(1rem, 5vw, 2rem)")
    }

    @Test func `nested functions render correctly in padding property`() {
        let complex = "padding: \(CalcSum("min(10%, 20px) + 1rem"))"
        #expect(complex == "padding: calc(min(10%, 20px) + 1rem)")
    }
}

// MARK: - Edge Cases

@Suite
struct `CalcSum - Edge Cases` {
    @Test func `simple expression without operators`() {
        let simple = CalcSum("10px")
        #expect(simple.description == "calc(10px)")
    }

    @Test func `complex nested expression`() {
        let complex = CalcSum("((100vw - 20px) / 2) + 3rem")
        #expect(complex.description == "calc(((100vw - 20px) / 2) + 3rem)")
    }

    @Test func `multiple operations`() {
        let multiple = CalcSum("10px + 20px - 5px * 2")
        #expect(multiple.description == "calc(10px + 20px - 5px * 2)")
    }

    @Test func `whitespace preserved`() {
        let withSpaces = CalcSum("100%  -  20px")
        #expect(withSpaces.description == "calc(100%  -  20px)")
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `CalcSum - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `calc sum creation 100K times`() {
            for i in 0..<100_000 {
                _ = CalcSum("100% - \(i)px")
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `min function creation 100K times`() {
            for i in 0..<100_000 {
                _ = CalcSum.min("\(i)px, \(i + 10)em")
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `calc sum comparison 100K times`() {
            let calc1 = CalcSum("100% - 20px")
            for i in 0..<100_000 {
                _ = CalcSum("100% - \(i)px") == calc1
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `clamp function creation 100K times`() {
            for i in 0..<100_000 {
                _ = CalcSum.clamp(min: "\(i)px", preferred: "5vw", max: "\(i + 100)px")
            }
        }
    }
}
