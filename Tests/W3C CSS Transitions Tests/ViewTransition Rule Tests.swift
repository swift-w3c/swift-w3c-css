import Testing
import W3C_CSS_Shared
import W3C_CSS_Syntax

@testable import W3C_CSS_Transitions

@Suite
struct `ViewTransition Rule Tests` {
    @Test
    func `the rule that turns cross-document transitions on or off`() {
        #expect(W3C.CSS.Rule.viewTransition(navigation: .auto).description == "@view-transition{navigation:auto}")
        #expect(W3C.CSS.Rule.viewTransition(navigation: .none).description == "@view-transition{navigation:none}")
    }
}
