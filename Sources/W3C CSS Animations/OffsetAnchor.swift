public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum OffsetAnchor: Property {

    case auto

    case position(Position)

    case global(Global)
}

extension OffsetAnchor {
    public static let property: String = "offset-anchor"
}

extension OffsetAnchor: LengthPercentageConvertible {
    public static func lengthPercentage(_ value: LengthPercentage) -> OffsetAnchor {
        .position(.init(value))
    }
}

extension OffsetAnchor: CustomStringConvertible {

    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .position(let position):
            return position.description

        case .global(let global):
            return global.description
        }
    }
}

extension OffsetAnchor {

    public static let center: OffsetAnchor = .position(.center)

    public static let top: OffsetAnchor = .position(.top)

    public static let right: OffsetAnchor = .position(.right)

    public static let bottom: OffsetAnchor = .position(.bottom)

    public static let left: OffsetAnchor = .position(.left)

    public static let topLeft: OffsetAnchor = .position(.topLeft)

    public static let topRight: OffsetAnchor = .position(.topRight)

    public static let bottomLeft: OffsetAnchor = .position(.bottomLeft)

    public static let bottomRight: OffsetAnchor = .position(.bottomRight)
}
