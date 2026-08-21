public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum WebkitMaskPositionY: Property, LengthPercentageConvertible {

    case top

    case center

    case bottom

    case lengthPercentage(LengthPercentage)

    case multiple([WebkitMaskPositionY])

    case global(Global)

    public init(_ positions: [WebkitMaskPositionY]) {
        if positions.count == 1 {
            self = positions[0]
        } else {
            self = .multiple(positions)
        }
    }
}

extension WebkitMaskPositionY: CustomStringConvertible {
    public static let property: String = "-webkit-mask-position-y"

    public var description: String {
        switch self {
        case .top:
            return "top"

        case .center:
            return "center"

        case .bottom:
            return "bottom"

        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description

        case .multiple(let positions):
            return positions.map { $0.description }.joined(separator: ", ")

        case .global(let global):
            return global.description
        }
    }
}

extension WebkitMaskPositionY {

    public static func values(_ positions: [WebkitMaskPositionY]) -> WebkitMaskPositionY {
        WebkitMaskPositionY(positions)
    }

    public static func values(_ positions: WebkitMaskPositionY...) -> WebkitMaskPositionY {
        values(positions)
    }
}
