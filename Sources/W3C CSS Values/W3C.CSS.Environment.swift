public import W3C_CSS_Shared

extension W3C.CSS {
    /// An environment variable a user agent defines (CSS Environment Variables Level 1).
    public enum Environment: String, Sendable, Hashable, CaseIterable {
        case safeAreaInsetTop = "safe-area-inset-top"
        case safeAreaInsetRight = "safe-area-inset-right"
        case safeAreaInsetBottom = "safe-area-inset-bottom"
        case safeAreaInsetLeft = "safe-area-inset-left"
        case titlebarAreaX = "titlebar-area-x"
        case titlebarAreaY = "titlebar-area-y"
        case titlebarAreaWidth = "titlebar-area-width"
        case titlebarAreaHeight = "titlebar-area-height"
        case keyboardInsetTop = "keyboard-inset-top"
        case keyboardInsetRight = "keyboard-inset-right"
        case keyboardInsetBottom = "keyboard-inset-bottom"
        case keyboardInsetLeft = "keyboard-inset-left"
        case keyboardInsetWidth = "keyboard-inset-width"
        case keyboardInsetHeight = "keyboard-inset-height"
    }
}
