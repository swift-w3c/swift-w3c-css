public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum Translate: Property {

    case none

    case x(LengthPercentage)

    case xy(x: LengthPercentage, y: LengthPercentage)

    case xyz(x: LengthPercentage, y: LengthPercentage, z: Length)

    case global(Global)
}

extension Translate {
    public static let property: String = "translate"
    public var description: String {
        switch self {
        case .none:
            return "none"

        case .x(let x):
            return x.description

        case .xy(let x, let y):
            return "\(x.description) \(y.description)"

        case .xyz(let x, let y, let z):
            return "\(x.description) \(y.description) \(z.description)"

        case .global(let global):
            return global.description
        }
    }
}
