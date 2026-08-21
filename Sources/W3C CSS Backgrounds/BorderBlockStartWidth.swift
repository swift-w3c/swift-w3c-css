public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum BorderBlockStartWidth: Property {

    case width(BorderWidth)

    case global(Global)

    public init(_ width: BorderWidth) {
        self = .width(width)
    }
}

extension BorderBlockStartWidth {
    public static let property: String = "border-block-start-width"
}

extension BorderBlockStartWidth: LengthConvertible {
    public static func length(_ length: Length) -> BorderBlockStartWidth {
        .width(.init(length))
    }
}

extension BorderBlockStartWidth: CustomStringConvertible {

    public var description: String {
        switch self {
        case .width(let width):
            return width.description

        case .global(let global):
            return global.description
        }
    }
}

extension BorderBlockStartWidth {

    public static let `default` = BorderBlockStartWidth(.medium)

    public static let thin = BorderBlockStartWidth(.thin)

    public static let medium = BorderBlockStartWidth(.medium)

    public static let thick = BorderBlockStartWidth(.thick)

}
