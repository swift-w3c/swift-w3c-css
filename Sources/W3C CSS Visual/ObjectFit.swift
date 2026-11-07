public import W3C_CSS_Shared

public enum ObjectFit: Property {

    case keyword(Keyword)

    case global(Global)
}

extension ObjectFit {
    public static let property: String = "object-fit"

    public enum Keyword: Sendable, Hashable, CustomStringConvertible {

        case contain

        case cover

        case fill

        case none

        case scaleDown
    }
}

extension ObjectFit.Keyword {
    public var description: String {
        switch self {
        case .contain: return "contain"
        case .cover: return "cover"
        case .fill: return "fill"
        case .none: return "none"
        case .scaleDown: return "scale-down"
        }
    }
}

extension ObjectFit: CustomStringConvertible {

    public var description: String {
        switch self {
        case .keyword(let keyword):
            return keyword.description

        case .global(let global):
            return global.description
        }
    }
}

extension ObjectFit {

    public static let contain: ObjectFit = .keyword(.contain)

    public static let cover: ObjectFit = .keyword(.cover)

    public static let fill: ObjectFit = .keyword(.fill)

    public static let none: ObjectFit = .keyword(.none)

    public static let scaleDown: ObjectFit = .keyword(.scaleDown)
}
