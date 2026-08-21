public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum Height: Property, LengthPercentageConvertible {

    case lengthPercentage(LengthPercentage)

    case auto

    case maxContent

    case minContent

    case fitContent

    case fitContentLength(LengthPercentage)

    case stretch

    case global(Global)
}

extension Height {
    public static let property: String = "height"

    public var description: String {
        switch self {
        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description

        case .auto:
            return "auto"

        case .maxContent:
            return "max-content"

        case .minContent:
            return "min-content"

        case .fitContent:
            return "fit-content"

        case .fitContentLength(let lengthPercentage):
            return "fit-content(\(lengthPercentage.description))"

        case .stretch:
            return "stretch"

        case .global(let global):
            return global.description
        }
    }
}
