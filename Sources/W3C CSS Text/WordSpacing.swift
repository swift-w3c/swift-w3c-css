public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum WordSpacing: Property {

    case normal

    case length(Length)

    case global(Global)
}

extension WordSpacing {
    public static let property: String = "word-spacing"
    public var description: String {
        switch self {
        case .normal:
            return "normal"

        case .length(let length):
            return length.description

        case .global(let global):
            return global.description
        }
    }
}

extension WordSpacing: LengthConvertible {}
