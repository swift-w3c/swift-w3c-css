//
//  WebkitTextFillColor.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 28/03/2025.
//

public import W3C_CSS_Color
public import W3C_CSS_Shared
public import W3C_CSS_Values

/// The CSS `-webkit-text-fill-color` property specifies the fill color of characters of text.
/// If this property is not set, the value of the `color` property is used.
///
/// Although originally a Safari-specific property, it's now widely supported across browsers
/// and is useful for styling text, especially in combination with `-webkit-text-stroke`.
///
/// Example:
/// ```swift
/// .webkitTextFillColor(.red)                    // -webkit-text-fill-color: red
/// .webkitTextFillColor(.hex("#3366cc"))         // -webkit-text-fill-color: #3366cc
/// .webkitTextFillColor(.rgb(100, 200, 0))       // -webkit-text-fill-color: rgb(100, 200, 0)
/// .webkitTextFillColor(.currentColor)           // -webkit-text-fill-color: currentColor
/// ```
///
/// - Note: This property provides functionality similar to the standard `color` property,
///         but allows separating text fill color from stroke color when used with `-webkit-text-stroke`.
///
/// - SeeAlso: [MDN Web Docs on -webkit-text-fill-color](https://developer.mozilla.org/en-US/docs/Web/CSS/-webkit-text-fill-color)
public enum WebkitTextFillColor: Property, ColorConvertible {
    public static let property: String = "-webkit-text-fill-color"

    /// A specific color for the text fill
    case color(W3C_CSS_Values.Color)

    /// Current text color
    case currentColor

    /// Global CSS value
    case global(Global)

    /// Creates a WebkitTextFillColor from a Color
    public init(_ color: W3C_CSS_Values.Color) {
        self = .color(color)
    }

    public var description: String {
        switch self {
        case .color(let color):
            return color.description
        case .currentColor:
            return "currentColor"
        case .global(let global):
            return global.description
        }
    }
}
