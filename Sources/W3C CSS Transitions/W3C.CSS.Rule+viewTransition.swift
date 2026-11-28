public import W3C_CSS_Shared
public import W3C_CSS_Syntax

extension W3C.CSS.Rule {
    /// The `@view-transition` rule: whether a navigation between two documents is animated.
    public static func viewTransition(navigation: ViewTransition.NavigationType) -> Self {
        .at(.init(ViewTransition.identifier, "", .declarations([.init(property: "navigation", value: navigation.rawValue)])))
    }
}
