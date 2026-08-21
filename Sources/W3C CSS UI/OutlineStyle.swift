public import W3C_CSS_Shared
import W3C_CSS_Values

public enum OutlineStyle: Property {

    case auto

    case none

    case dotted

    case dashed

    case solid

    case double

    case groove

    case ridge

    case inset

    case outset

    case global(Global)
}

extension OutlineStyle: CustomStringConvertible {
    public static let property: String = "outline-style"

    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .none:
            return "none"

        case .dotted:
            return "dotted"

        case .dashed:
            return "dashed"

        case .solid:
            return "solid"

        case .double:
            return "double"

        case .groove:
            return "groove"

        case .ridge:
            return "ridge"

        case .inset:
            return "inset"

        case .outset:
            return "outset"

        case .global(let global):
            return global.description
        }
    }
}
