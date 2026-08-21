public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum LetterSpacing: Property, LengthPercentageConvertible {

    case normal

    case lengthPercentage(LengthPercentage)

    case global(Global)
}

extension LetterSpacing {
    public static let property: String = "letter-spacing"

    public var description: String {
        switch self {
        case .normal:
            return "normal"

        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description

        case .global(let global):
            return global.description
        }
    }
}

extension LetterSpacing: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {

    public init(integerLiteral value: Int) {
        self = .px(Double(value))
    }

    public init(floatLiteral value: Double) {
        self = .px(value)
    }
}

extension LetterSpacing {

    public static let zero: LetterSpacing = .px(0)

    public static let tight: LetterSpacing = .em(-0.05)

    public static let wide: LetterSpacing = .em(0.1)

    public static let veryWide: LetterSpacing = .em(0.25)
}
