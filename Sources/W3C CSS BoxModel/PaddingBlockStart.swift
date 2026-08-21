public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum PaddingBlockStart: Property, LengthPercentageConvertible {

    case lengthPercentage(LengthPercentage)

    case global(Global)
}

extension PaddingBlockStart {
    public static let property: String = "padding-block-start"
}

extension PaddingBlockStart: CustomStringConvertible {

    public var description: String {
        switch self {
        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description

        case .global(let global):
            return global.description
        }
    }
}

extension PaddingBlockStart: ExpressibleByIntegerLiteral {

    public init(integerLiteral value: Int) {
        self = .lengthPercentage(.px(Double(value)))
    }
}

extension PaddingBlockStart: ExpressibleByFloatLiteral {

    public init(floatLiteral value: Double) {
        self = .lengthPercentage(.px(value))
    }
}
