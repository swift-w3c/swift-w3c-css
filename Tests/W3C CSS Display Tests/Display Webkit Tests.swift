import Testing

@testable import W3C_CSS_Display

@Suite
struct `Display Webkit Tests` {
    @Test
    func `the legacy flexible box`() {
        #expect(Display.webkitBox.description == "-webkit-box")
    }
}
