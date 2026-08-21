public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum BorderTopWidth: Property {

    case width(BorderWidth)

    case global(Global)

    public init(_ width: BorderWidth) {
        self = .width(width)
    }
}

extension BorderTopWidth: CustomStringConvertible {

    public var description: String {
        switch self {
        case .width(let width):
            return width.description

        case .global(let global):
            return global.description
        }
    }
}
extension BorderTopWidth: LengthConvertible {
    public static func length(_ length: Length) -> BorderTopWidth {
        .width(.length(length))
    }
}

extension BorderTopWidth {
    public static let property: String = "border-top-width"

    public static let `default` = BorderTopWidth(.medium)

    public static let thin = BorderTopWidth(.thin)

    public static let medium = BorderTopWidth(.medium)

    public static let thick = BorderTopWidth(.thick)

}
