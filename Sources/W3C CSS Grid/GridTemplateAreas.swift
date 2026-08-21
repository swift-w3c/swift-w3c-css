public import W3C_CSS_Shared

public enum GridTemplateAreas: Property {

    case none

    case areas([String])

    case global(Global)
}

extension GridTemplateAreas {
    public static let property: String = "grid-template-areas"

    public var description: String {
        switch self {
        case .none:
            return "none"

        case .areas(let areas):
            return areas.map { "\"\($0)\"" }.joined(separator: " ")

        case .global(let value):
            return value.description
        }
    }
}
