public enum BackfaceVisibility: Property {

    case visible

    case hidden

    case global(Global)
}

extension BackfaceVisibility {
    public static let property: String = "backface-visibility"
}

extension BackfaceVisibility: CustomStringConvertible {

    public var description: String {
        switch self {
        case .visible:
            return "visible"

        case .hidden:
            return "hidden"

        case .global(let global):
            return global.description
        }
    }
}

extension BackfaceVisibility {

    public static let `default` = BackfaceVisibility.visible
}
