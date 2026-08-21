public import W3C_CSS_Shared

public enum FlexFlow: Property {

    case flexFlow(FlexDirection, FlexWrap)

    case global(Global)
}

extension FlexFlow {
    public static let property: String = "flex-flow"

    public var description: String {
        switch self {
        case .flexFlow(let direction, let wrap):
            return "\(direction) \(wrap)"

        case .global(let value):
            return value.description
        }
    }
}
