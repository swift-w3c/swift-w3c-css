public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum PerspectiveOrigin: Property {

    case position(Position)

    case global(Global)
}

extension PerspectiveOrigin {
    public static let property: String = "perspective-origin"
}

extension PerspectiveOrigin: CustomStringConvertible {

    public var description: String {
        switch self {
        case .position(let position):
            return position.description

        case .global(let global):
            return global.description
        }
    }
}

extension PerspectiveOrigin {

    public static func horizontal(_ x: LengthPercentage) -> PerspectiveOrigin {
        .position(.value(x))
    }

    public static func horizontal(_ keyword: Position.Keyword) -> PerspectiveOrigin {
        .position(.keyword(keyword))
    }

    public static func at(_ x: LengthPercentage, _ y: LengthPercentage) -> PerspectiveOrigin {
        .position(.values(x, y))
    }

    public static let center: PerspectiveOrigin = .position(.center)

    public static let top: PerspectiveOrigin = .position(.top)

    public static let right: PerspectiveOrigin = .position(.right)

    public static let bottom: PerspectiveOrigin = .position(.bottom)

    public static let left: PerspectiveOrigin = .position(.left)

    public static let topLeft: PerspectiveOrigin = .position(.topLeft)

    public static let topRight: PerspectiveOrigin = .position(.topRight)

    public static let bottomLeft: PerspectiveOrigin = .position(.bottomLeft)

    public static let bottomRight: PerspectiveOrigin = .position(.bottomRight)
}
