public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum BorderLeftWidth: Property {

    case width(BorderWidth)

    case global(Global)

    public init(_ width: BorderWidth) {
        self = .width(width)
    }
}
extension BorderLeftWidth: LengthConvertible {
    public static func length(_ length: Length) -> BorderLeftWidth {
        .width(.length(length))
    }
}

extension BorderLeftWidth: CustomStringConvertible {

    public var description: String {
        switch self {
        case .width(let width):
            return width.description

        case .global(let global):
            return global.description
        }
    }
}

extension BorderLeftWidth {
    public static let property: String = "border-left-width"

    public static let `default` = BorderLeftWidth(.medium)

    public static let thin = BorderLeftWidth(.thin)

    public static let medium = BorderLeftWidth(.medium)

    public static let thick = BorderLeftWidth(.thick)
}
