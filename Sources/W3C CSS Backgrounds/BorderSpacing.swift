public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum BorderSpacing: Property {

    case all(Length)

    case horizontalVertical(Length, Length)

    case global(Global)

    public init(_ length: Length) {
        self = .all(length)
    }

    public init(_ horizontal: Length, _ vertical: Length) {
        self = .horizontalVertical(horizontal, vertical)
    }
}
extension BorderSpacing: LengthConvertible {
    public static func length(_ length: Length) -> BorderSpacing {
        .all(.length(length))
    }
}

extension BorderSpacing {

    public var description: String {
        switch self {
        case .all(let length):
            return length.description

        case .horizontalVertical(let horizontal, let vertical):
            return "\(horizontal.description) \(vertical.description)"

        case .global(let global):
            return global.description
        }
    }
}

extension BorderSpacing {
    public static let property: String = "border-spacing"

    public static let `default` = BorderSpacing(.px(0))

}
