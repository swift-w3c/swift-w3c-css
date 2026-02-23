public import W3C_CSS_Shared
public import W3C_CSS_Values

//
// ScrollMarginRight.swift

/// The `scroll-margin-right` CSS property defines the right margin of the scroll snap area that is used
/// for snapping this element to the snapport. This property is not interpolable according to CSS standards.
///
/// Scroll snap areas are the parts of an element that are visually closest to the scroll container's
/// snapport when the scroll position is manipulated.
///
/// ```css
/// scroll-margin-right: 10px;
/// scroll-margin-right: 1em;
/// scroll-margin-right: 0;
/// ```
public enum ScrollMarginRight: Property, LengthConvertible, ExpressibleByIntegerLiteral,
    ExpressibleByFloatLiteral, CustomStringConvertible
{
    public static let property: String = "scroll-margin-right"

    /// A length value for the right margin
    case length(Length)

    /// Global CSS value
    case global(Global)

    public var description: String {
        switch self {
        case .length(let length): return length.description
        case .global(let global): return global.description
        }
    }

    /// Creates a ScrollMarginRight using an integer literal (interpreted as pixels)
    public init(integerLiteral value: Int) {
        self = .length(.px(Double(value)))
    }

    /// Creates a ScrollMarginRight using a floating-point literal (interpreted as pixels)
    public init(floatLiteral value: Double) {
        self = .length(.px(value))
    }
}
