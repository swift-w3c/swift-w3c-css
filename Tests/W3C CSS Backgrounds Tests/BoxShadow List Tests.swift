import Testing
import W3C_CSS_Shared
import W3C_CSS_Variables
import W3C_CSS_Values
import W3C_CSS_Backgrounds

@Suite struct `BoxShadow List Tests` {
    @Test func `a list of shadows holds a variable`() {
        let ring = BoxShadow.shadow(.init(offsetX: .px(0), offsetY: .px(0), blurRadius: .px(0), spreadRadius: .px(2), color: .variable("accent")))
        #expect(BoxShadow.list([.variable("pop"), ring]).description == "var(--pop), 0px 0px 0px 2px var(--accent)")
    }
}
