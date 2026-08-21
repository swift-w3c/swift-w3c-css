public import W3C_CSS_Shared

public enum FontWeight: Property, ExpressibleByIntegerLiteral {

    case number(Int)

    case normal

    case bold

    case lighter

    case bolder

    case global(Global)

    public init(integerLiteral value: Int) {
        self = .number(value)
    }
}

extension FontWeight {
    public static let property: String = "font-weight"

    public static let thin: FontWeight = .number(100)

    public static let extraLight: FontWeight = .number(200)

    public static let light: FontWeight = .number(300)

    public static let medium: FontWeight = .number(500)

    public static let semiBold: FontWeight = .number(600)

    public static let extraBold: FontWeight = .number(800)

    public static let black: FontWeight = .number(900)

    public static let extraBlack: FontWeight = .number(950)

    public var description: String {
        switch self {
        case .number(let number):

            let clampedValue = max(1, min(1000, number))
            return "\(clampedValue)"

        case .normal:
            return "normal"

        case .bold:
            return "bold"

        case .lighter:
            return "lighter"

        case .bolder:
            return "bolder"

        case .global(let value):
            return value.description
        }
    }
}
