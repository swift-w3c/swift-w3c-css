/// Represents CSS overflow values.
///
/// The `overflow` CSS property sets what to do when content overflows an element's box.
/// It controls whether to clip content, show scrollbars, or let content overflow visibly.
///
/// Example:
/// ```swift
/// .overflow(.visible)  // overflow: visible
/// .overflow(.auto)     // overflow: auto
/// .overflow(.scroll)   // overflow: scroll
/// .overflow(.hidden)   // overflow: hidden
/// .overflow(.clip)     // overflow: clip
/// ```
///
/// - Note: Overflow settings apply to all scrollable ancestors of an element. If any ancestor has `overflow: hidden`,
///         scrolling won't work for elements inside it regardless of their overflow settings.
///
/// - SeeAlso: [MDN Web Docs on overflow](https://developer.mozilla.org/en-US/docs/Web/CSS/overflow)
public enum Overflow: String, Sendable, Hashable, CaseIterable {
    /// Content is not clipped and may overflow the padding box
    case visible

    /// Content is clipped if necessary to fit the padding box
    case hidden

    /// Similar to hidden, but more optimized for block placement
    case clip

    /// Content is clipped if necessary, with scrollbars always visible
    case scroll

    /// Content is clipped if necessary, with scrollbars appearing only when needed
    case auto

    /// Deprecated: Behaves like auto but allows scrollbars to overlap content
    /// - Note: This value is deprecated and not included in `allCases`
    @available(*, deprecated, message: "Use 'auto' instead. The overlay value is deprecated.")
    case overlay

}

extension Overflow {
    /// Returns all non-deprecated overflow values
    public static var allCases: [Overflow] {
        [.visible, .hidden, .clip, .scroll, .auto]
    }
}

/// Provides string conversion for CSS output
extension Overflow: CustomStringConvertible {
    /// Converts the overflow value to its CSS string representation
    public var description: String {
        return rawValue
    }
}

/// Additional overflow related functionality
extension Overflow {
    /// Whether the overflow value allows content to be visible
    public var allowsVisibleOverflow: Bool {
        switch self {
        case .visible:
            return true
        default:
            return false
        }
    }

    /// Whether the overflow value clips content
    public var clipsContent: Bool {
        switch self {
        case .hidden, .clip, .scroll, .auto, .overlay:
            return true
        case .visible:
            return false
        }
    }

    /// Whether the overflow value shows scrollbars
    public var showsScrollbars: Bool {
        switch self {
        case .scroll, .auto, .overlay:
            return true
        case .visible, .hidden, .clip:
            return false
        }
    }
}
