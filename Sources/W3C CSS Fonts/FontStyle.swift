public import W3C_CSS_Shared

public enum FontStyle: Property {

    case normal

    case italic

    case oblique

    case obliqueAngle(Double)

    case global(Global)
}

extension FontStyle {
    public static let property: String = "font-style"

    public var description: String {
        switch self {
        case .normal:
            return "normal"

        case .italic:
            return "italic"

        case .oblique:
            return "oblique"

        case .obliqueAngle(let degrees):

            let clampedDegrees = max(-90, min(90, degrees))
            return "oblique \(clampedDegrees)deg"

        case .global(let value):
            return value.description
        }
    }
}
