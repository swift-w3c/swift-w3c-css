public enum Frequency: Sendable, Hashable {

    case hz(Number)

    case khz(Number)
}

extension Frequency: CustomStringConvertible {

    public var description: String {
        switch self {
        case .hz(let value):
            return "\(value)Hz"

        case .khz(let value):
            return "\(value)kHz"
        }
    }
}
