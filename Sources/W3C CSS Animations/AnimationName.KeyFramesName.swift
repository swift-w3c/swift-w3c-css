public import W3C_CSS_Shared
import W3C_CSS_Values

extension AnimationName {
    public enum KeyFramesName: Sendable, Hashable, CustomStringConvertible {
        case customIdent(W3C.CSSOM.Ident)
        case string(W3C.CSSOM.String)

        public init(_ string: String) {
            self = .customIdent(.init(string))
        }
    }
}
