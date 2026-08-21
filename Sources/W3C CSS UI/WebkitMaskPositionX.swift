public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum WebkitMaskPositionX: Property, LengthPercentageConvertible {

    case left

    case center

    case right

    case lengthPercentage(LengthPercentage)

    case multiple([WebkitMaskPositionX])

    case global(Global)

    public init(_ positions: [WebkitMaskPositionX]) {
        if positions.count == 1 {
            self = positions[0]
        } else {
            self = .multiple(positions)
        }
    }
}

extension WebkitMaskPositionX: CustomStringConvertible {
    public static let property: String = "-webkit-mask-position-x"

    public var description: String {
        switch self {
        case .left:
            return "left"

        case .center:
            return "center"

        case .right:
            return "right"

        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description

        case .multiple(let positions):
            return positions.map { $0.description }.joined(separator: ", ")

        case .global(let global):
            return global.description
        }
    }
}

extension WebkitMaskPositionX {

    public static func values(_ positions: [WebkitMaskPositionX]) -> WebkitMaskPositionX {
        WebkitMaskPositionX(positions)
    }

    public static func values(_ positions: WebkitMaskPositionX...) -> WebkitMaskPositionX {
        values(positions)
    }
}
