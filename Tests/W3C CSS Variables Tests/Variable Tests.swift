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

@Suite struct `Assignment Tests` {
    @Test func `an assignment declares the custom property under the variable's name`() {
        let side = W3C.CSS.Variable<Int>("side")
        #expect(side.assignment(52).declaration.description == "--side:52")
        #expect(side.assignment(52).important.declaration.description == "--side:52!important")
    }

    @Test func `a declaration keeps its property and value apart`() {
        let declaration = W3C.CSS.Variable<Int>("side").assignment(52).important.declaration
        #expect(declaration.property == "--side")
        #expect(declaration.value == "52")
        #expect(declaration.isImportant)
    }
}
