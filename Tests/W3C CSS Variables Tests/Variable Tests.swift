import Testing
import W3C_CSS_Shared
import W3C_CSS_Variables

@Suite struct `Variable Tests` {
    @Test func `a custom property is set by its declaration and read by var()`() {
        let width: W3C.CSS.Variable<Int> = "side"
        #expect(width(260).description == "--side:260")
        #expect(width.description == "var(--side)")
    }
}
