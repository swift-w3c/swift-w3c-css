public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum Top: Sendable, Hashable, LengthPercentageConvertible, Property {
    case lengthPercentage(LengthPercentage)

    case auto

    /// The edge of an anchor element: `anchor(--bar bottom)`.
    case anchor(W3C.CSS.Anchor)

    case global(Global)
}

extension Top {
    public static let property: String = "top"
}

extension Top: CustomStringConvertible {

    public var description: String {
        switch self {
        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description

        case .auto:
            return "auto"

        case .anchor(let anchor):
            return anchor.description

        case .global(let global):
            return global.description
        }
    }
}

extension Top {

    public static let zero: Top = .px(0)
}

extension Top: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {

    public init(integerLiteral value: Int) {
        self = .px(Double(value))
    }

    public init(floatLiteral value: Double) {
        self = .px(value)
    }
}
