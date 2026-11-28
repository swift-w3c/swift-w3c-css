import Testing
import W3C_CSS_Shared
import W3C_CSS_Syntax

@testable import W3C_CSS_Animations

@Suite
struct `Keyframes Rule Tests` {
    @Test
    func `a named animation with two keyframes`() {
        let rule = W3C.CSS.Rule.keyframes(
            "fade",
            [
                .keyframe([.from], [.init(property: "opacity", value: "0")]),
                .keyframe([.percentage(50), .to], [.init(property: "opacity", value: "1")]),
            ]
        )
        #expect(rule.description == "@keyframes fade{from{opacity:0}50%,to{opacity:1}}")
    }
}
