public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum BorderBlockWidth: Property {

    case all(BorderWidth.Width)

    case startEnd(BorderWidth.Width, BorderWidth.Width)

    case global(Global)

    public init(_ width: BorderWidth.Width) {
        self = .all(width)
    }

    public init(start: BorderWidth.Width, end: BorderWidth.Width) {
        self = .startEnd(start, end)
    }
}

extension BorderBlockWidth {
    public static let property: String = "border-block-width"
}

extension BorderBlockWidth {
    public var description: String {
        switch self {
        case .all(let width):
            return width.description

        case .startEnd(let start, let end):
            return "\(start.description) \(end.description)"

        case .global(let global):
            return global.description
        }
    }
}

extension BorderBlockWidth: LengthConvertible {
    public static func length(_ length: Length) -> Self {
        .all(.length(length))
    }
}

extension BorderBlockWidth {

    public static let `default` = BorderBlockWidth(.medium)

    public static let thin = BorderBlockWidth(.thin)

    public static let medium = BorderBlockWidth(.medium)

    public static let thick = BorderBlockWidth(.thick)

}
