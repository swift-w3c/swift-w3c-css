public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum BorderRightWidth: Property {

    case width(BorderWidth)

    case global(Global)

    public init(_ width: BorderWidth) {
        self = .width(width)
    }
}

extension BorderRightWidth: CustomStringConvertible {

    public var description: String {
        switch self {
        case .width(let width):
            return width.description

        case .global(let global):
            return global.description
        }
    }
}
extension BorderRightWidth: LengthConvertible {
    public static func length(_ length: Length) -> BorderRightWidth {
        .width(.length(length))
    }
}

extension BorderRightWidth {
    public static let property: String = "border-right-width"

    public static let `default` = BorderRightWidth(.medium)

    public static let thin = BorderRightWidth(.thin)

    public static let medium = BorderRightWidth(.medium)

    public static let thick = BorderRightWidth(.thick)

}
