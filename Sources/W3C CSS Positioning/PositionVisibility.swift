public import W3C_CSS_Shared
import W3C_CSS_Values

public enum PositionVisibility: Property {

    case always

    case anchorsVisible

    case noOverflow

    case combined([Condition])

    case global(Global)
}

extension PositionVisibility {
    public static let property: String = "position-visibility"

    public enum Condition: String, Sendable, Hashable {

        case anchorsVisible = "anchors-visible"

        case noOverflow = "no-overflow"
    }

    public var description: String {
        switch self {
        case .always:
            return "always"

        case .anchorsVisible:
            return "anchors-visible"

        case .noOverflow:
            return "no-overflow"

        case .combined(let conditions):
            return conditions.map { $0.rawValue }.joined(separator: " ")

        case .global(let global):
            return global.description
        }
    }
}
