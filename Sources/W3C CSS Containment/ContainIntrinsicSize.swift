public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum ContainIntrinsicSize: Property, GlobalConvertible, LengthConvertible {

    case none

    case length(Length)

    case widthHeight(Length, Length)

    case auto(Length)

    case autoNone

    case autoWidthHeight(ContainIntrinsicWidth, ContainIntrinsicHeight)

    case global(Global)
}

extension ContainIntrinsicSize {
    public static let property: String = "contain-intrinsic-size"

    public var description: String {
        switch self {
        case .none:
            return "none"

        case .length(let length):
            return length.description

        case .widthHeight(let width, let height):
            return "\(width.description) \(height.description)"

        case .auto(let length):
            return "auto \(length.description)"

        case .autoNone:
            return "auto none"

        case .autoWidthHeight(let width, let height):
            return "\(width.description) \(height.description)"

        case .global(let value):
            return value.description
        }
    }
}

extension ContainIntrinsicSize {

    public static func auto(width: ContainIntrinsicWidth, height: ContainIntrinsicHeight) -> Self {
        .autoWidthHeight(width, height)
    }

    public static func size(width: Length, height: Length) -> Self {
        .widthHeight(width, height)
    }
}
