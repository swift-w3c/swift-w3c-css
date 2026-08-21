public import W3C_CSS_Shared
import W3C_CSS_Values

public enum TextDecorationStyle: Property {

    case solid

    case double

    case dotted

    case dashed

    case wavy

    case global(Global)
}

extension TextDecorationStyle {
    public static let property: String = "text-decoration-style"
}

extension TextDecorationStyle: CustomStringConvertible {
    public var description: String {
        switch self {
        case .solid:
            return "solid"

        case .double:
            return "double"

        case .dotted:
            return "dotted"

        case .dashed:
            return "dashed"

        case .wavy:
            return "wavy"

        case .global(let global):
            return global.description
        }
    }
}
