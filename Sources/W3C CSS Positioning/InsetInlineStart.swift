public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum InsetInlineStart: Property, LengthPercentageConvertible {

    case auto

    case lengthPercentage(LengthPercentage)

    case global(Global)
}

extension InsetInlineStart {
    public static let property: String = "inset-inline-start"

    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .lengthPercentage(let value):
            return value.description

        case .global(let value):
            return value.description
        }
    }
}

extension InsetInlineStart {

    public init(_ value: Double) {
        self = .lengthPercentage(.px(value))
    }

    public init(_ value: Int) {
        self = .lengthPercentage(.px(Double(value)))
    }
}

extension InsetInlineStart: LengthConvertible {}
