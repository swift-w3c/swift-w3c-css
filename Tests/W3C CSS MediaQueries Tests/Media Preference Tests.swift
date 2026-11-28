import Testing

@testable import W3C_CSS_MediaQueries

@Suite
struct `Media Preference Tests` {
    @Test
    func `reduced transparency`() {
        #expect(Media.prefersReducedTransparency().rawValue == "@media (prefers-reduced-transparency: reduce)")
    }

    @Test
    func `forced colors`() {
        #expect(Media.forcedColors().rawValue == "@media (forced-colors: active)")
    }
}
