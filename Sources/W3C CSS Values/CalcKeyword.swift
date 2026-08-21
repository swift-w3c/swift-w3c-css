public enum CalcKeyword: String, Sendable, Hashable {

    case e = "e"

    case pi = "pi"

    case infinity = "infinity"

    case negativeInfinity = "-infinity"

    case NaN = "NaN"
}

extension CalcKeyword: CustomStringConvertible {

    public var description: String {
        return rawValue
    }
}
