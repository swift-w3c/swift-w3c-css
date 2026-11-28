import Testing
import W3C_CSS_Shared
import W3C_CSS_Variables
import W3C_CSS_Values

@Suite struct `Calculation Fallback Tests` {
    @Test func `a variable states the value to use where it is not set`() {
        let lit: W3C.CSS.Variable<Double> = "lit"
        #expect(W3C.CSS.Calculation.variable(lit, fallback: .number(0)).description == "var(--lit, 0)")
        #expect(W3C.CSS.Calculation.sum(.number(0.6), .product(.number(0.6), .variable(lit, fallback: .number(0)))).description == "calc(0.6 + 0.6 * var(--lit, 0))")
    }

    @Test func `a scale takes a calculation`() {
        #expect(NumberPercentage.calculation(.product(.number(2), .variable("k"))).description == "calc(2 * var(--k))")
    }
}
