public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum BackgroundPosition: Property {

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

extension BackgroundPosition {
    public static let property: String = "background-position"
}

extension BackgroundPosition: CustomStringConvertible {

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

extension BackgroundPosition {

    public static let `default` = BackgroundPosition(.values(.percentage(0), .percentage(0)))

    public static let center = BackgroundPosition(.center)

    public static let top = BackgroundPosition(.top)

    public static let right = BackgroundPosition(.right)

    public static let bottom = BackgroundPosition(.bottom)

    public static let left = BackgroundPosition(.left)

    public static let topLeft = BackgroundPosition(.topLeft)

    public static let topRight = BackgroundPosition(.topRight)

    public static let bottomLeft = BackgroundPosition(.bottomLeft)

    public static let bottomRight = BackgroundPosition(.bottomRight)

    public static func percentage(_ x: Percentage, _ y: Percentage) -> BackgroundPosition {
        BackgroundPosition.single(.values(.percentage(x), .percentage(y)))
    }

    public static func offsets(
        _ edge1: Position.Keyword,
        _ offset1: LengthPercentage,
        _ edge2: Position.Keyword,
        _ offset2: LengthPercentage
    ) -> BackgroundPosition {
        BackgroundPosition(.offsets(edge1, offset1, edge2, offset2))
    }

    public static func values(_ positions: [Position]) -> BackgroundPosition {
        BackgroundPosition(positions)
    }

    public static func values(_ positions: Position...) -> BackgroundPosition {
        values(positions)
    }
}
