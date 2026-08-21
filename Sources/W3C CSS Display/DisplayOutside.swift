public enum DisplayOutside: String, Sendable, Hashable {

    case block

    case inline

    case runIn = "run-in"
}

extension DisplayOutside: CustomStringConvertible {

    public var description: String {
        return rawValue
    }
}
