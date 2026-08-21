public import W3C_CSS_Shared

public enum FontSynthesis: Property {

    case none

    case weight

    case style

    case smallCaps

    case position

    case combination([SynthesisOption])

    case global(Global)
}

extension FontSynthesis {
    public static let property: String = "font-synthesis"

    public enum SynthesisOption: String, Sendable, CustomStringConvertible {

        case weight

        case style

        case smallCaps = "small-caps"

        case position
    }
}

extension FontSynthesis.SynthesisOption {
    public var description: String {
        return rawValue
    }
}

extension FontSynthesis {
    public var description: String {
        switch self {
        case .none:
            return "none"

        case .weight:
            return "weight"

        case .style:
            return "style"

        case .smallCaps:
            return "small-caps"

        case .position:
            return "position"

        case .combination(let options):
            return options.map { $0.description }.joined(separator: " ")

        case .global(let value):
            return value.description
        }
    }
}
