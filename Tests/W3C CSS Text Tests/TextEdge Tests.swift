// TextEdge Tests.swift
// swift-w3c-css
//
// Tests for CSS TextEdge type

import Testing

@testable import W3C_CSS_Text

// MARK: - Single Value Text Edge

@Suite
struct `TextEdge - Single Values` {
    @Test(arguments: [
        (TextEdge.text, "text"),
        (.ideographic, "ideographic"),
        (.ideographicInk, "ideographic-ink"),
    ])
    func `single value text edge renders correctly`(edge: TextEdge, expected: String) {
        #expect(edge.description == expected)
    }

    @Test func `single value factory method works correctly`() {
        let textEdge = TextEdge.single(.text)
        #expect(textEdge.description == "text")

        let ideographicEdge = TextEdge.single(.ideographic)
        #expect(ideographicEdge.description == "ideographic")
    }
}

// MARK: - Paired Value Text Edge

@Suite
struct `TextEdge - Paired Values` {
    @Test(arguments: [
        (TextEdge.capAlphabetic, "cap alphabetic"),
        (.exAlphabetic, "ex alphabetic"),
    ])
    func `predefined paired values render correctly`(edge: TextEdge, expected: String) {
        #expect(edge.description == expected)
    }

    @Test func `pair factory method works correctly`() {
        let textAlphabetic = TextEdge.pair(.text, .alphabetic)
        #expect(textAlphabetic.description == "text alphabetic")

        let ideographicPair = TextEdge.pair(.ideographic, .ideographicInk)
        #expect(ideographicPair.description == "ideographic ideographic-ink")
    }

    @Test(arguments: [
        (TextEdge.OverValue.cap, TextEdge.UnderValue.alphabetic, "cap alphabetic"),
        (.ex, .alphabetic, "ex alphabetic"),
        (.text, .text, "text text"),
        (.ideographic, .ideographic, "ideographic ideographic"),
    ])
    func `various pair combinations render correctly`(
        over: TextEdge.OverValue,
        under: TextEdge.UnderValue,
        expected: String
    ) {
        let edge = TextEdge.pair(over, under)
        #expect(edge.description == expected)
    }
}

// MARK: - Value Enum Tests

@Suite
struct `TextEdge - Value Enum` {
    @Test func `Value enum conforms to CaseIterable`() {
        let allCases = TextEdge.Value.allCases
        #expect(allCases.count == 3)
        #expect(allCases.contains(.text))
        #expect(allCases.contains(.ideographic))
        #expect(allCases.contains(.ideographicInk))
    }

    @Test(arguments: [
        (TextEdge.Value.text, "text"),
        (.ideographic, "ideographic"),
        (.ideographicInk, "ideographic-ink"),
    ])
    func `Value enum raw values are correct`(value: TextEdge.Value, expected: String) {
        #expect(value.rawValue == expected)
    }
}

@Suite
struct `TextEdge - OverValue Enum` {
    @Test func `OverValue enum conforms to CaseIterable`() {
        let allCases = TextEdge.OverValue.allCases
        #expect(allCases.count == 5)
        #expect(allCases.contains(.text))
        #expect(allCases.contains(.ideographic))
        #expect(allCases.contains(.ideographicInk))
        #expect(allCases.contains(.cap))
        #expect(allCases.contains(.ex))
    }

    @Test(arguments: [
        (TextEdge.OverValue.text, "text"),
        (.ideographic, "ideographic"),
        (.ideographicInk, "ideographic-ink"),
        (.cap, "cap"),
        (.ex, "ex"),
    ])
    func `OverValue enum raw values are correct`(value: TextEdge.OverValue, expected: String) {
        #expect(value.rawValue == expected)
    }
}

@Suite
struct `TextEdge - UnderValue Enum` {
    @Test func `UnderValue enum conforms to CaseIterable`() {
        let allCases = TextEdge.UnderValue.allCases
        #expect(allCases.count == 4)
        #expect(allCases.contains(.text))
        #expect(allCases.contains(.ideographic))
        #expect(allCases.contains(.ideographicInk))
        #expect(allCases.contains(.alphabetic))
    }

    @Test(arguments: [
        (TextEdge.UnderValue.text, "text"),
        (.ideographic, "ideographic"),
        (.ideographicInk, "ideographic-ink"),
        (.alphabetic, "alphabetic"),
    ])
    func `UnderValue enum raw values are correct`(value: TextEdge.UnderValue, expected: String) {
        #expect(value.rawValue == expected)
    }
}

// MARK: - Protocol Conformance

@Suite
struct `TextEdge - Hashable Conformance` {
    @Test func `equal single value text edges are equal`() {
        let text1 = TextEdge.text
        let text2 = TextEdge.single(.text)
        #expect(text1 == text2)
    }

    @Test func `different single value text edges are not equal`() {
        let text = TextEdge.text
        let ideographic = TextEdge.ideographic
        #expect(text != ideographic)
    }

    @Test func `equal paired value text edges are equal`() {
        let pair1 = TextEdge.capAlphabetic
        let pair2 = TextEdge.pair(.cap, .alphabetic)
        #expect(pair1 == pair2)
    }

    @Test func `different paired value text edges are not equal`() {
        let capAlphabetic = TextEdge.capAlphabetic
        let exAlphabetic = TextEdge.exAlphabetic
        #expect(capAlphabetic != exAlphabetic)
    }

    @Test func `single and paired text edges are not equal`() {
        let singleText = TextEdge.text
        let pairText = TextEdge.capAlphabetic
        #expect(singleText != pairText)
    }
}

// MARK: - CSS Specification Compliance

@Suite
struct `TextEdge - CSS Specification` {
    @Test func `text value represents text edge`() {
        // 'text' uses the text-over and text-under metrics
        #expect(TextEdge.text.description == "text")
    }

    @Test func `ideographic value represents ideographic baseline`() {
        // 'ideographic' uses the ideographic baseline
        #expect(TextEdge.ideographic.description == "ideographic")
    }

    @Test func `ideographic-ink represents ink bounds`() {
        // 'ideographic-ink' uses the actual ink bounds
        #expect(TextEdge.ideographicInk.description == "ideographic-ink")
    }

    @Test func `cap represents capital letter height`() {
        // 'cap' uses the cap-height metric
        let capEdge = TextEdge.pair(.cap, .alphabetic)
        #expect(capEdge.description.contains("cap"))
    }

    @Test func `ex represents x-height`() {
        // 'ex' uses the x-height metric
        let exEdge = TextEdge.pair(.ex, .alphabetic)
        #expect(exEdge.description.contains("ex"))
    }

    @Test func `alphabetic represents alphabetic baseline`() {
        // 'alphabetic' uses the alphabetic baseline
        let alphabeticEdge = TextEdge.pair(.cap, .alphabetic)
        #expect(alphabeticEdge.description.contains("alphabetic"))
    }
}

// MARK: - Usage in Context

@Suite
struct `TextEdge - CSS Property Usage` {
    @Test func `text edge in text-box-trim property`() {
        let textBoxTrim = "text-box-trim: \(TextEdge.text)"
        #expect(textBoxTrim == "text-box-trim: text")
    }

    @Test func `paired text edge in text-box-edge property`() {
        let textBoxEdge = "text-box-edge: \(TextEdge.capAlphabetic)"
        #expect(textBoxEdge == "text-box-edge: cap alphabetic")
    }

    @Test(arguments: [
        (TextEdge.text, "text-box-edge: text"),
        (.capAlphabetic, "text-box-edge: cap alphabetic"),
        (.exAlphabetic, "text-box-edge: ex alphabetic"),
    ])
    func `various text edges render correctly in properties`(edge: TextEdge, expected: String) {
        let property = "text-box-edge: \(edge)"
        #expect(property == expected)
    }
}

// MARK: - Edge Cases

@Suite
struct `TextEdge - Edge Cases` {
    @Test func `same value used for both over and under`() {
        let textText = TextEdge.pair(.text, .text)
        #expect(textText.description == "text text")

        let ideographicIdeographic = TextEdge.pair(.ideographic, .ideographic)
        #expect(ideographicIdeographic.description == "ideographic ideographic")
    }

    @Test func `all OverValue cases can pair with all UnderValue cases`() {
        // Test that the API allows all combinations
        for over in TextEdge.OverValue.allCases {
            for under in TextEdge.UnderValue.allCases {
                let edge = TextEdge.pair(over, under)
                #expect(edge.description.contains(over.rawValue))
                #expect(edge.description.contains(under.rawValue))
            }
        }
    }

    @Test func `hyphenated values are preserved`() {
        let ideographicInk = TextEdge.ideographicInk
        #expect(ideographicInk.description == "ideographic-ink")

        let pairWithInk = TextEdge.pair(.ideographicInk, .ideographicInk)
        #expect(pairWithInk.description == "ideographic-ink ideographic-ink")
    }
}

// MARK: - Value Set Relationships

@Suite
struct `TextEdge - Value Set Relationships` {
    @Test func `OverValue is superset of Value`() {
        // OverValue includes all Value cases plus cap and ex
        let valueSet = Set(TextEdge.Value.allCases.map { $0.rawValue })
        let overValueSet = Set(TextEdge.OverValue.allCases.map { $0.rawValue })

        for value in valueSet {
            #expect(overValueSet.contains(value))
        }
    }

    @Test func `UnderValue is superset of Value`() {
        // UnderValue includes all Value cases plus alphabetic
        let valueSet = Set(TextEdge.Value.allCases.map { $0.rawValue })
        let underValueSet = Set(TextEdge.UnderValue.allCases.map { $0.rawValue })

        for value in valueSet {
            #expect(underValueSet.contains(value))
        }
    }

    @Test func `cap and ex are only in OverValue`() {
        let underValueSet = Set(TextEdge.UnderValue.allCases.map { $0.rawValue })
        #expect(!underValueSet.contains("cap"))
        #expect(!underValueSet.contains("ex"))
    }

    @Test func `alphabetic is only in UnderValue`() {
        let overValueSet = Set(TextEdge.OverValue.allCases.map { $0.rawValue })
        #expect(!overValueSet.contains("alphabetic"))
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `TextEdge - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `text edge creation 100K times`() {
            for i in 0..<100_000 {
                if i % 2 == 0 {
                    _ = TextEdge.text
                } else {
                    _ = TextEdge.capAlphabetic
                }
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `text edge description generation 100K times`() {
            let edge = TextEdge.capAlphabetic
            for _ in 0..<100_000 {
                _ = edge.description
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `text edge pair creation 100K times`() {
            for i in 0..<100_000 {
                let over = TextEdge.OverValue.allCases[i % 5]
                let under = TextEdge.UnderValue.allCases[i % 4]
                _ = TextEdge.pair(over, under)
            }
        }
    }
}
