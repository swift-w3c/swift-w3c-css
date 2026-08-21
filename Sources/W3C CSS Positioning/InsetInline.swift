public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum InsetInline: Property, LengthPercentageConvertible {

    case auto

    case same(LengthPercentage)

    case sides(start: LengthPercentage, end: LengthPercentage?)

    case global(Global)
}

extension InsetInline {
    public static let property: String = "inset-inline"

    public enum Value: Hashable, Sendable {

        case auto

        case lengthPercentage(LengthPercentage)
    }

    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .same(let value):
            return value.description

        case .sides(let start, let end):
            if start == end {
                return start.description
            } else {
                switch end {
                case .some(let end):
                    return "\(start.description) \(end.description)"

                case .none:
                    return start.description
                }
            }

        case .global(let global):
            return global.description
        }
    }
}

extension InsetInline.Value {
    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description
        }
    }
}

extension InsetInline {
    public static func lengthPercentage(_ value: LengthPercentage) -> InsetInline {
        .same(value)
    }

    public init(start: LengthPercentage, end: LengthPercentage) {
        self = .sides(start: start, end: end)
    }

}
