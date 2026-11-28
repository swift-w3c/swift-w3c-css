import Testing
import W3C_CSS_Shared
import W3C_CSS_Variables
import W3C_CSS_Values
import W3C_CSS_Images
import W3C_CSS_Masking

@Suite struct `Mask Image Tests` {
    @Test func `a mask takes an image held in a custom property`() {
        let mask = Mask.configuration(.init(.image(.variable("seal")), position: .center, size: .contain, repeat: .noRepeat))
        #expect(mask.description == "var(--seal) center / contain no-repeat")
    }
}
