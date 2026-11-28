import Testing
import W3C_CSS_BoxModel
import W3C_CSS_Shared

@Suite struct `Property Name Tests` {
    @Test func `max height and box decoration break are declared under their own names`() {
        #expect(MaxHeight.none.declaration.description == "max-height:none")
        #expect(BoxDecorationBreak.property == "box-decoration-break")
    }
}
