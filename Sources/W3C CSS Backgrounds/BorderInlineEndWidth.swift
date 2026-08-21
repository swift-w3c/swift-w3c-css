public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum BorderInlineEndWidth: Property {

    case width(BorderWidth.Width)

    case global(Global)

    public init(_ width: BorderWidth.Width) {
        self = .width(width)
    }
}

extension BorderInlineEndWidth {
    public static let property: String = "border-inline-end-width"
}

extension BorderInlineEndWidth: CustomStringConvertible {

    public var description: String {
        switch self {
        case .width(let width):
            return width.description

        case .global(let global):
            return global.description
        }
    }
}

extension BorderInlineEndWidth {

    public static let `default` = BorderInlineEndWidth(.medium)

    public static let thin = BorderInlineEndWidth(.thin)

    public static let medium = BorderInlineEndWidth(.medium)

    public static let thick = BorderInlineEndWidth(.thick)
}

extension BorderInlineEndWidth: LengthConvertible {
    public static func length(_ length: Length) -> BorderInlineEndWidth {
        .width(.length(length))
    }
}
