import Testing
import W3C_CSS_Selectors
import W3C_CSS_Shared

@testable import W3C_CSS_PseudoElements

@Suite
struct `Vendor Element Tests` {
    @Test
    func `WebKit's scrollbar, details marker and search cancel button`() {
        #expect(W3C.CSS.Selector.Pseudo.Element.webkitScrollbar.description == "::-webkit-scrollbar")
        #expect(W3C.CSS.Selector.Pseudo.Element.webkitDetailsMarker.description == "::-webkit-details-marker")
        #expect(W3C.CSS.Selector.Pseudo.Element.webkitSearchCancelButton.description == "::-webkit-search-cancel-button")
    }
}
