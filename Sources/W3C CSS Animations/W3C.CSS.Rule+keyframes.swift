public import W3C_CSS_Shared
public import W3C_CSS_Syntax
public import W3C_CSSOM

extension W3C.CSS.Rule {
    /// The `@keyframes` rule: a named animation and its keyframes, each made with `keyframe`.
    public static func keyframes(_ name: W3C.CSSOM.CustomIdent, _ keyframes: [W3C.CSS.Rule]) -> Self {
        .at(.init(Keyframes.identifier, name.description, .rules(keyframes)))
    }

    /// One keyframe of a `@keyframes` rule: where in the animation it holds, and what it declares there.
    public static func keyframe(_ selectors: [Keyframes.KeyframeSelector], _ declarations: [Declaration]) -> Self {
        .qualified(.init(selectors.map(\.rawValue).joined(separator: ","), declarations))
    }
}
