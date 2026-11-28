import Testing
import W3C_CSS_Cascade
import W3C_CSS_Shared

@Suite struct `All Tests` {
    @Test func `the all shorthand takes the css-wide keywords`() {
        #expect(All.unset.declaration.description == "all:unset")
        #expect(All.global(.revertLayer).declaration.description == "all:revert-layer")
    }
}
