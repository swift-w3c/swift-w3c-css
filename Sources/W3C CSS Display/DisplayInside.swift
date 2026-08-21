public enum DisplayInside: String, Sendable, Hashable {

    case flow

    case flowRoot = "flow-root"

    case table

    case flex

    case grid

    case ruby
}

extension DisplayInside: CustomStringConvertible {

    public var description: String {
        return rawValue
    }
}
