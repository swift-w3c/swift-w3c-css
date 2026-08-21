public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum OffsetPosition: Property {

    case normal

    case auto

    case position(Position)

    case global(Global)

    public init(_ position: Position) {
        self = .position(position)
    }
}

extension OffsetPosition {
    public static let property: String = "offset-position"
}

extension OffsetPosition: CustomStringConvertible {

    public var description: String {
        switch self {
        case .normal:
            return "normal"

        case .auto:
            return "auto"

        case .position(let position):
            return position.description

        case .global(let global):
            return global.description
        }
    }
}

extension OffsetPosition {

    public static let center = OffsetPosition(.center)

    public static let top = OffsetPosition(.top)

    public static let right = OffsetPosition(.right)

    public static let bottom = OffsetPosition(.bottom)

    public static let left = OffsetPosition(.left)

    public static let topLeft = OffsetPosition(.topLeft)

    public static let topRight = OffsetPosition(.topRight)

    public static let bottomLeft = OffsetPosition(.bottomLeft)

    public static let bottomRight = OffsetPosition(.bottomRight)

    public static func offsets(
        _ edge1: Position.Keyword,
        _ offset1: LengthPercentage,
        _ edge2: Position.Keyword,
        _ offset2: LengthPercentage
    ) -> OffsetPosition {
        OffsetPosition(.offsets(edge1, offset1, edge2, offset2))
    }

    public static func offset(
        _ edge: Position.Keyword,
        _ offset: LengthPercentage
    ) -> OffsetPosition {
        OffsetPosition(.keywordValue(edge, offset))
    }
}

extension OffsetPosition: LengthPercentageConvertible {
    public static func lengthPercentage(_ value: LengthPercentage) -> OffsetPosition {
        .position(.init(value))
    }
}
