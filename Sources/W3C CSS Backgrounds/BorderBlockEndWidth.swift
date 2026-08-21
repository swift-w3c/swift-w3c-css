public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum BorderBlockEndWidth: Property {

    case width(BorderWidth)

    case global(Global)

    public init(_ width: BorderWidth) {
        self = .width(width)
    }
}

extension BorderBlockEndWidth {
    public static let property: String = "border-block-end-width"
}

extension BorderBlockEndWidth: LengthConvertible {
    public static func length(_ length: Length) -> BorderBlockEndWidth {
        .width(.init(length))
    }
}

extension BorderBlockEndWidth: CustomStringConvertible {

    public var description: String {
        switch self {
        case .width(let width):
            return width.description

        case .global(let global):
            return global.description
        }
    }
}

extension BorderBlockEndWidth {

    public static let `default` = BorderBlockEndWidth(.medium)

    public static let thin = BorderBlockEndWidth(.thin)

    public static let medium = BorderBlockEndWidth(.medium)

    public static let thick = BorderBlockEndWidth(.thick)

}
