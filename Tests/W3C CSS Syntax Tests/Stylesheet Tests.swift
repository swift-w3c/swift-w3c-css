import Testing
import W3C_CSS_Selectors
import W3C_CSS_Shared
import W3C_CSS_Syntax

@Suite struct `Stylesheet Tests` {
    static let hidden = Declaration(description: "display:none")
    static let red = Declaration(description: "color:red")

    @Test func `a style rule writes its declarations in the order given, repeats included`() {
        let top = Declaration(description: "top:72px")
        let anchored = Declaration(description: "top:anchor(bottom)")
        let rule = W3C.CSS.Rule.style(.class("sheet"), [top, anchored])
        #expect(rule.description == ".sheet{top:72px;top:anchor(bottom)}")
    }

    @Test func `a stylesheet keeps its rules in source order, at-rules in place`() {
        let sheet: W3C.CSS.Stylesheet = [
            .style(.type("a"), [Self.red]),
            .at(.init("media", "(min-width:761px)", .rules([.style(.type("a"), [Self.hidden])]))),
            .style(.type("b"), [Self.red]),
        ]
        #expect(sheet.description == "a{color:red}@media (min-width:761px){a{display:none}}b{color:red}")
    }

    @Test func `an at-rule without a block ends in a semicolon, and one with declarations holds them`() {
        #expect(W3C.CSS.Rule.At("layer", "base").description == "@layer base;")
        let transition = W3C.CSS.Rule.At("view-transition", "", .declarations([Declaration(description: "navigation:auto")]))
        #expect(transition.description == "@view-transition{navigation:auto}")
    }

    @Test func `a keyframe is a qualified rule inside its at-rule`() {
        let frames = W3C.CSS.Rule.At("keyframes", "arrive", .rules([.qualified(.init("from", [Declaration(description: "opacity:0")]))]))
        #expect(frames.description == "@keyframes arrive{from{opacity:0}}")
    }

    @Test func `an important declaration is marked once`() {
        #expect(Self.hidden.important.description == "display:none!important")
        #expect(Self.hidden.important.important.description == "display:none!important")
    }
}
