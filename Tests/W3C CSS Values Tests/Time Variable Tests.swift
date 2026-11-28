import Testing
import W3C_CSS_Shared
import W3C_CSS_Variables

@testable import W3C_CSS_Values

@Suite
struct `Time Variable Tests` {
    @Test
    func `a time read from a custom property`() {
        let pace = W3C.CSS.Variable<Time>("pace")
        #expect(Time.variable(pace).description == "var(--pace)")
        #expect(Time.variable(pace) != Time.variable("other"))
        #expect(Time.variable(pace) != Time.zero)
        #expect(Time.s(0.2).description == "0.2s")
    }

    @Test
    func `a ratio of whole numbers`() {
        #expect(Ratio(width: 16, height: 10).description == "16 / 10")
    }
}
