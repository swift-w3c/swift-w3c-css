import Testing

@testable import W3C_CSS_BoxModel

@Suite
struct `BoxSizing - Enum Cases and Description` {
    @Test(arguments: [
        (BoxSizing.contentBox, "content-box"),
        (.borderBox, "border-box"),
    ])
    func `box-sizing description returns CSS keyword`(sizing: BoxSizing, expected: String) {
        #expect(sizing.description == expected)
    }

    @Test func `property name is box-sizing`() {
        #expect(BoxSizing.property == "box-sizing")
    }

    @Test func `equal box-sizing values are equal`() {
        #expect(BoxSizing.borderBox == BoxSizing.borderBox)
        #expect(BoxSizing.contentBox != BoxSizing.borderBox)
    }
}
