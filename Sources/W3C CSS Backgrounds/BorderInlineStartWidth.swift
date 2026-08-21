public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum BorderInlineStartWidth: Property {

    case width(BorderWidth.Width)

    case global(Global)

    public init(_ width: BorderWidth.Width) {
        self = .width(width)
    }
}

extension BorderInlineStartWidth {
    public static let property: String = "border-inline-start-width"
}

extension BorderInlineStartWidth: CustomStringConvertible {

    public var description: String {
        switch self {
        case .width(let width):
            return width.description

        case .global(let global):
            return global.description
        }
    }
}

extension BorderInlineStartWidth: LengthConvertible {
    public static func length(_ length: Length) -> BorderInlineStartWidth {
        BorderInlineStartWidth.width(.length(length))
    }

}

extension BorderInlineStartWidth {

    public static let `default` = BorderInlineStartWidth(.medium)

    public static let thin = BorderInlineStartWidth(.thin)

    public static let medium = BorderInlineStartWidth(.medium)

    public static let thick = BorderInlineStartWidth(.thick)
}
