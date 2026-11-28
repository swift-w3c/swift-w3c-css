import Testing
import W3C_CSS_Shared
import W3C_CSS_Transitions
import W3C_CSS_Values

@Suite struct `Transition Tests` {
    @Test func `several transitions share one declaration, in the order given`() {
        let fade = Transition.custom("opacity", duration: .s(0.2))
        let grow = Transition.custom("width", duration: .ms(300), delay: .ms(50))
        #expect(Transition.list(fade, grow).declaration.description == "transition:opacity 0.2s ease,width 300ms ease 50ms")
    }
}
