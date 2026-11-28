import Testing
import W3C_CSS_Backgrounds
import W3C_CSS_Shared
import W3C_CSS_Variables

@Suite struct `BoxShadow Tests` {
    @Test func `a box shadow is declared as box-shadow, also from a variable`() {
        #expect(BoxShadow.none.declaration.description == "box-shadow:none")
        #expect(BoxShadow.variable("pop").declaration.description == "box-shadow:var(--pop)")
    }
}
