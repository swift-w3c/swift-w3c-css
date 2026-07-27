//
//  CSSPseudoClass.swift
//  swift-w3c-css
//
//  Created by Coen ten Thije Boonkkamp on 21/11/2025.
//

/// A protocol representing CSS pseudo-classes.
///
/// Pseudo-classes are keywords added to selectors that specify a special state of the selected element(s).
/// They use a single colon (`:`) prefix, distinguishing them from pseudo-elements which use double colons (`::`).
///
/// Example:
/// ```swift
/// let hover = Hover()
/// print(hover.description) // ":hover"
/// ```
///
/// - SeeAlso: [MDN Web Docs on Pseudo-classes](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes)
public protocol CSSPseudoClass: Sendable, Hashable, CustomStringConvertible {}
