public enum BoxDecorationBreak: Property {

    case slice

    case clone

    case global(Global)

}

extension BoxDecorationBreak {
    public static let property: String = "border-decoration-break"

    public var description: String {
        switch self {
        case .slice:
            return "slice"

        case .clone:
            return "clone"

        case .global(let global):
            return global.description
        }
    }
}
