public enum AbsoluteSize: String, Sendable, Hashable {

    case xxSmall = "xx-small"

    case xSmall = "x-small"

    case small = "small"

    case medium = "medium"

    case large = "large"

    case xLarge = "x-large"

    case xxLarge = "xx-large"

    case xxxLarge = "xxx-large"
}

extension AbsoluteSize: CustomStringConvertible {

    public var description: String {
        return rawValue
    }
}
