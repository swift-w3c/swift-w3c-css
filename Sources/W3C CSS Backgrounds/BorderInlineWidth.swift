public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum BorderInlineWidth: Property {

    case width(BorderWidth)

    case global(Global)

    public init(_ width: BorderWidth) {
        self = .width(width)
    }
}
extension BorderInlineWidth: LengthConvertible {
    public static func length(_ length: Length) -> BorderInlineWidth {
        .width(.length(length))
    }
}

extension BorderInlineWidth: CustomStringConvertible {

    public var description: String {
        switch self {
        case .width(let width):
            return width.description

        case .global(let global):
            return global.description
        }
    }
}

extension BorderInlineWidth {
    public static let property: String = "border-inline-width"

    public static let `default` = BorderInlineWidth(.medium)

    public static let thin = BorderInlineWidth(.thin)

    public static let medium = BorderInlineWidth(.medium)

    public static let thick = BorderInlineWidth(.thick)

}
