import Testing
import W3C_CSS_Shared
import W3C_CSS_Values
import W3C_CSS_Positioning

@Suite struct `Anchor Tests` {
    @Test func `top is an edge of a named anchor`() {
        #expect(Top.anchor(.init("bar", .bottom)).description == "anchor(--bar bottom)")
        #expect(Top.anchor(.init(nil, .top, fallback: .px(8))).description == "anchor(top, 8px)")
    }
}
