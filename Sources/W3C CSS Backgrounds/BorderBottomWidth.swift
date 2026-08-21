public import W3C_CSS_Shared
import W3C_CSS_Values

public enum BorderBottomWidth: Property {

    case width(BorderWidth)

    case global(Global)

    public init(_ width: BorderWidth) {
        self = .width(width)
    }
}

extension BorderBottomWidth {
    public static let property: String = "border-bottom-width"
}

extension BorderBottomWidth: CustomStringConvertible {

    public var description: String {
        switch self {
        case .width(let width):
            return width.description

        case .global(let global):
            return global.description
        }
    }
}

extension BorderBottomWidth {

    public static let `default` = BorderBottomWidth(.medium)

    public static let thin = BorderBottomWidth(.thin)

    public static let medium = BorderBottomWidth(.medium)

    public static let thick = BorderBottomWidth(.thick)
}
