import Testing
import W3C_CSS_Shared
import W3C_CSS_Variables
import W3C_CSS_Values
import W3C_CSS_Images

@Suite struct `Image Variable Tests` {
    @Test func `an image is read from a custom property`() {
        #expect(Image.variable("seal").description == "var(--seal)")
    }
}
