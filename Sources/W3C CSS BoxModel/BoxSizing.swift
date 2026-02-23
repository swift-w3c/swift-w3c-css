//
//  BoxSizing.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

public import W3C_CSS_Shared

/// The CSS `box-sizing` property sets how the total width and height of an element is calculated.
///
/// This property allows you to control whether an element's specified width and height
/// include the padding and border, or just the content area.
///
/// Visual explanation:
/// ```
/// content-box                  border-box
/// ┌───────────────────────┐    ┌───────────────────────┐
/// │ ┌─────────────────┐   │    │ ┌─────────────────┐   │
/// │ │                 │   │    │ │                 │   │
/// │ │    Content      │   │    │ │    Content      │   │
/// │ │                 │   │    │ │                 │   │
/// │ └─────────────────┘   │    │ └─────────────────┘   │
/// │      ↑ padding ↑      │    │      ↑ padding ↑      │
/// └───────────────────────┘    └───────────────────────┘
///        ↑ border ↑                  ↑ border ↑
///
/// width = content width         width = content width +
///                                      padding width +
///                                      border width
/// ```
///
/// - Note: It is often useful to set `box-sizing: border-box` for layout purposes
///         as it makes element sizing more predictable.
///
/// - SeeAlso: [MDN Web Docs on box-sizing](https://developer.mozilla.org/en-US/docs/Web/CSS/box-sizing)
public enum BoxSizing: Property {
    public static let property: String = "box-sizing"

    /// Default CSS box model behavior. Width and height dimensions apply to the content box only.
    /// Padding and border width are added to the outside of the element.
    case contentBox

    /// Width and height dimensions apply to the border box. Padding and border width are
    /// included within the specified dimensions, causing the content area to shrink to absorb them.
    case borderBox

    /// Global CSS values
    case global(Global)

    /// String representation of the box-sizing value
    public var description: String {
        switch self {
        case .contentBox:
            return "content-box"
        case .borderBox:
            return "border-box"
        case .global(let global):
            return global.description
        }
    }
}
