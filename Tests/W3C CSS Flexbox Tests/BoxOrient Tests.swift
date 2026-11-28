import Testing

@testable import W3C_CSS_Flexbox

@Suite
struct `BoxOrient Tests` {
    @Test(arguments: [(BoxOrient.horizontal, "horizontal"), (.vertical, "vertical"), (.inlineAxis, "inline-axis"), (.blockAxis, "block-axis")])
    func `keywords`(value: BoxOrient, expected: String) {
        #expect(value.description == expected)
        #expect(BoxOrient.property == "box-orient")
    }
}
