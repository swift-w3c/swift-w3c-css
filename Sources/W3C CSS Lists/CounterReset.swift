public import W3C_CSS_Shared

public enum CounterReset: Property {

    case none

    case counter(CustomIdent)

    case counterWithValue(CustomIdent, Int)

    case reversedCounter(CustomIdent)

    case reversedCounterWithValue(CustomIdent, Int)

    case counters([Counter])

    case global(Global)
}

extension CounterReset {
    public static let property: String = "counter-reset"

    public var description: String {
        switch self {
        case .none:
            return "none"

        case .counter(let name):
            return name.description

        case .counterWithValue(let name, let value):
            return "\(name) \(value)"

        case .reversedCounter(let name):
            return "reversed(\(name))"

        case .reversedCounterWithValue(let name, let value):
            return "reversed(\(name)) \(value)"

        case .counters(let counters):
            return counters.map { counter in
                let nameStr =
                    counter.reversed ? "reversed(\(counter.name))" : counter.name.description
                guard let value = counter.value else {
                    return nameStr
                }
                return "\(nameStr) \(value)"
            }.joined(separator: " ")

        case .global(let value):
            return value.description
        }
    }
}
