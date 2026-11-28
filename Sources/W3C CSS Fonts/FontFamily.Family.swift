public import W3C_CSS_Variables
public import W3C_CSS_Shared

extension FontFamily {
    public enum Family: Sendable, Hashable, CustomStringConvertible {

        case specific(String)

        case generic(GenericFamily)

        case multiple([Family])

        case variable(W3C.CSS.Variable<FontFamily>)
    }
}
