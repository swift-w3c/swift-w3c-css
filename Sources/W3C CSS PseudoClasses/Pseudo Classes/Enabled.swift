/// Represents the CSS `:enabled` pseudo-class.
///
/// The `:enabled` pseudo-class matches any enabled element.
/// An element is enabled if it can be activated (selected, clicked on, typed into, etc.) or accept focus.
///
/// Example:
/// ```css
/// input:enabled {
///     cursor: pointer;
/// }
/// ```
///
/// - SeeAlso: [MDN Web Docs on :enabled](https://developer.mozilla.org/en-US/docs/Web/CSS/:enabled)
public struct Enabled: CSSPseudoClass {
    public init() {}
}

extension Enabled {
    public var description: String { ":enabled" }
}
