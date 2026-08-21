public import W3C_CSS_Shared
import W3C_CSS_Values

public enum LineBreak: Property {

    case auto

    case loose

    case normal

    case strict

    case anywhere

    case global(Global)
}

extension LineBreak {
    public static let property: String = "line-break"
    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .loose:
            return "loose"

        case .normal:
            return "normal"

        case .strict:
            return "strict"

        case .anywhere:
            return "anywhere"

        case .global(let global):
            return global.description
        }
    }
}
