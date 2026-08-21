public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum MaxWidth: Property, LengthPercentageConvertible {
    case lengthPercentage(LengthPercentage)

    case none

    case maxContent

    case minContent

    case fitContent(LengthPercentage? = nil)

    case stretch

    case global(Global)
}

extension MaxWidth {
    public static let property: String = "max-width"

    public static let fitContent: Self = .fitContent(nil)
}

extension MaxWidth: CustomStringConvertible {

    public var description: String {
        switch self {
        case .lengthPercentage(let lengthPercentage):
            lengthPercentage.description

        case .none:
            "none"

        case .maxContent:
            "max-content"

        case .minContent:
            "min-content"

        case .fitContent(let lengthPercentage):
            if let description = lengthPercentage?.description {
                "fit-content(\(description)"
            } else {
                "fit-content"
            }

        case .stretch:
            "stretch"

        case .global(let global):
            global.description
        }
    }
}

extension MaxWidth: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {

    public init(integerLiteral value: Int) {
        self = .px(Double(value))
    }

    public init(floatLiteral value: Double) {
        self = .px(value)
    }
}
