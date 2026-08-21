public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum MaskPosition: Property {

    case single(Position)

    case multiple([Position])

    case global(Global)

    public init(_ position: Position) {
        self = .single(position)
    }

    public init(_ positions: [Position]) {
        if positions.count == 1 {
            self = .single(positions[0])
        } else {
            self = .multiple(positions)
        }
    }
}

extension MaskPosition {
    public static let property: String = "mask-position"
}

extension MaskPosition: CustomStringConvertible {

    public var description: String {
        switch self {
        case .single(let position):
            return position.description

        case .multiple(let positions):
            return positions.map { $0.description }.joined(separator: ", ")

        case .global(let global):
            return global.description
        }
    }
}

extension MaskPosition {

    public static let `default` = MaskPosition(.values(.percentage(0), .percentage(0)))

    public static let center = MaskPosition(.center)

    public static let top = MaskPosition(.top)

    public static let right = MaskPosition(.right)

    public static let bottom = MaskPosition(.bottom)

    public static let left = MaskPosition(.left)

    public static let topLeft = MaskPosition(.topLeft)

    public static let topRight = MaskPosition(.topRight)

    public static let bottomLeft = MaskPosition(.bottomLeft)

    public static let bottomRight = MaskPosition(.bottomRight)

    public static func percentage(_ x: Percentage, _ y: Percentage) -> MaskPosition {
        .single(.values(.percentage(x), .percentage(y)))
    }

    public static func offsets(
        _ edge1: Position.Keyword,
        _ offset1: LengthPercentage,
        _ edge2: Position.Keyword,
        _ offset2: LengthPercentage
    ) -> MaskPosition {
        MaskPosition(.offsets(edge1, offset1, edge2, offset2))
    }

    public static func values(_ positions: [Position]) -> MaskPosition {
        MaskPosition(positions)
    }

    public static func values(_ positions: Position...) -> MaskPosition {
        values(positions)
    }
}
