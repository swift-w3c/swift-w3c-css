public import W3C_CSS_Shared

public enum OverflowWrap: Property, Sendable, Hashable, CustomStringConvertible {

    case normal

    case anywhere

    case breakWord

    case global(Global)
}

extension OverflowWrap {
    public static let property: String = "overflow-wrap"

    public var description: String {
        switch self {
        case .normal:
            return "normal"

        case .anywhere:
            return "anywhere"

        case .breakWord:
            return "break-word"

        case .global(let global):
            return global.description
        }
    }
}
