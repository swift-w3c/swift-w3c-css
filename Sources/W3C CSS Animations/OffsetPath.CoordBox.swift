import W3C_CSS_Masking
public import W3C_CSS_Shared
public import W3C_CSS_Values

extension OffsetPath {
    public enum CoordBox: Sendable, Hashable {

        case borderBox

        case paddingBox

        case contentBox

        case fillBox

        case strokeBox

        case viewBox
    }
}
