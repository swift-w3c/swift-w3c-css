public import W3C_CSS_Shared

public enum StrokeLinecap: Property {

    case butt

    case round

    case square

    case global(Global)
}

extension StrokeLinecap {
    public static let property: String = "stroke-linecap"

    public var description: String {
        switch self {
        case .butt:
            return "butt"

        case .round:
            return "round"

        case .square:
            return "square"

        case .global(let global):
            return global.description
        }
    }
}
