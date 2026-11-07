public import W3C_CSS_Shared
import W3C_CSS_Values


extension AnimationName {
    public enum KeyFramesName: Sendable, Hashable, CustomStringConvertible {
        case customIdent(Ident)
        case string(CSSString)

        public init(_ string: String) {
            self = .customIdent(.init(string))
        }
    }
}
