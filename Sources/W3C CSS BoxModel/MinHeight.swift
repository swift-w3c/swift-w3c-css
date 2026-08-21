public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum MinHeight: Property, LengthPercentageConvertible {
    case lengthPercentage(LengthPercentage)

    case auto

    case none

    case maxContent

    case minContent

    case fitContent(LengthPercentage? = nil)

    case stretch

    case global(Global)
}

extension MinHeight {
    public static let property: String = "min-height"

    public static let fitContent: Self = .fitContent(nil)
}

extension MinHeight: CustomStringConvertible {

    public var description: String {
        switch self {
        case .lengthPercentage(let lengthPercentage):
            lengthPercentage.description

        case .auto:
            "auto"

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

extension MinHeight: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {

    public init(integerLiteral value: Int) {
        self = .px(Double(value))
    }

    public init(floatLiteral value: Double) {
        self = .px(value)
    }
}
