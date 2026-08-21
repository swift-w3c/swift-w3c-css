public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum InlineSize: Property, LengthPercentageConvertible {

    case auto

    case lengthPercentage(LengthPercentage)

    case minContent

    case maxContent

    case fitContent

    case fitContentLength(LengthPercentage)

    case global(Global)
}

extension InlineSize {
    public static let property: String = "inline-size"

    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .lengthPercentage(let length):
            return length.description

        case .minContent:
            return "min-content"

        case .maxContent:
            return "max-content"

        case .fitContent:
            return "fit-content"

        case .fitContentLength(let length):
            return "fit-content(\(length))"

        case .global(let global):
            return global.description
        }
    }
}
