public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum VerticalAlign: Property {

    case baseline

    case sub

    case `super`

    case textTop

    case textBottom

    case middle

    case top

    case bottom

    case lengthPercentage(LengthPercentage)

    case global(Global)
}

extension VerticalAlign {
    public static let property: String = "vertical-align"
}

extension VerticalAlign {
    public var description: String {
        switch self {
        case .baseline:
            return "baseline"

        case .sub:
            return "sub"

        case .super:
            return "super"

        case .textTop:
            return "text-top"

        case .textBottom:
            return "text-bottom"

        case .middle:
            return "middle"

        case .top:
            return "top"

        case .bottom:
            return "bottom"

        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description

        case .global(let global):
            return global.description
        }
    }
}
