public import W3C_CSS_Shared

public enum CounterSet: Property {

    case none

    case counter(CustomIdent)

    case counterWithValue(CustomIdent, Int)

    case counters([Counter])

    case global(Global)
}

extension CounterSet {
    public static let property: String = "counter-set"

    public struct Counter: Sendable, Hashable {

        public let name: CustomIdent

        public let value: Int?

        public init(name: CustomIdent, value: Int? = nil) {
            self.name = name
            self.value = value
        }
    }

    public var description: String {
        switch self {
        case .none:
            return "none"

        case .counter(let name):
            return name.description

        case .counterWithValue(let name, let value):
            return "\(name) \(value)"

        case .counters(let counters):
            return counters.map { counter in
                if let value = counter.value {
                    return "\(counter.name) \(value)"
                } else {
                    return counter.name.description
                }
            }.joined(separator: " ")

        case .global(let value):
            return value.description
        }
    }
}
