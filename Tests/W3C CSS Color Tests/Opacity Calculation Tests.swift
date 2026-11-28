import Testing
import W3C_CSS_Shared
import W3C_CSS_Values
import W3C_CSS_Color

@Suite struct `Opacity Calculation Tests` {
    @Test func `opacity takes a variable with a fallback and a calculation`() {
        #expect(Opacity.calculation(.reference("wash", fallback: .number(1))).description == "var(--wash, 1)")
        #expect(Opacity.calculation(.product(.number(0.6), .reference("wash", fallback: .number(1)))).description == "calc(0.6 * var(--wash, 1))")
    }
}
