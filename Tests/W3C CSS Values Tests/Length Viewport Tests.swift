import Testing

@testable import W3C_CSS_Values

@Suite
struct `Length Viewport Tests` {
    @Test(arguments: [
        (Length.Unit.dvh, "100dvh"), (.dvw, "100dvw"), (.svh, "100svh"), (.svw, "100svw"), (.lvh, "100lvh"), (.lvw, "100lvw"),
    ])
    func `dynamic, small and large viewport units`(unit: Length.Unit, expected: String) {
        #expect(Length.length(100, unit).description == expected)
    }
}
