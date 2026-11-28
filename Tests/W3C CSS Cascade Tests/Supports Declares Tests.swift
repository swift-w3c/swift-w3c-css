import Testing
import W3C_CSS_Shared
import W3C_CSS_Syntax

@testable import W3C_CSS_Cascade

@Suite
struct `Supports Declares Tests` {
    @Test
    func `a typed declaration as the condition`() {
        #expect(Supports.declares(All.unset).rawValue == "@supports (all: unset) {}")
        #expect(Supports.not(.declares(All.unset)).rawValue == "@supports not (all: unset) {}")
    }

    @Test
    func `conditions keep their closing parenthesis when joined or negated`() {
        let either = Supports.declares(All.unset).or(.declares(All.initial))
        #expect(either.rawValue == "@supports (all: unset) or (all: initial) {}")
        #expect(Supports.not(either).rawValue == "@supports not ((all: unset) or (all: initial)) {}")
        #expect(Supports.declares(All.unset).and(.declares(All.initial)).rawValue == "@supports (all: unset) and (all: initial) {}")
    }

    @Test
    func `a supports rule holds its rules in one block`() {
        let rule = W3C.CSS.Rule.at(.init(Supports.not(.declares(All.unset)), [.qualified(.init("to", []))]))
        #expect(rule.description == "@supports not (all: unset){to{}}")
    }
}
