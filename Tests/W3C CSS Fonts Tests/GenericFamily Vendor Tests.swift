import Testing

@testable import W3C_CSS_Fonts

@Suite
struct `GenericFamily Vendor Tests` {
    @Test
    func `the WebKit system font keeps its name unquoted`() {
        let family = FontFamily.families([.generic(.appleSystem), .specific("Example Sans"), .generic(.sansSerif)])
        #expect(family.description == "-apple-system, \"Example Sans\", sans-serif")
    }
}
