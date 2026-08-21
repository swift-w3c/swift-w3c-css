public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum ContainIntrinsicHeight: Property, LengthConvertible {

    case none

    case length(Length)

    case auto(Length)

    case autoNone

    case global(Global)
}

extension ContainIntrinsicHeight {
    public static let property: String = "contain-intrinsic-height"

    public var description: String {
        switch self {
        case .none:
            return "none"

        case .length(let length):
            return length.description

        case .auto(let length):
            return "auto \(length.description)"

        case .autoNone:
            return "auto none"

        case .global(let value):
            return value.description
        }
    }
}
