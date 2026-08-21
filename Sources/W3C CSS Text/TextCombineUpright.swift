public import W3C_CSS_Shared
import W3C_CSS_Values

public enum TextCombineUpright: Property {

    case none

    case all

    case digits(Int)

    case global(Global)
}

extension TextCombineUpright {
    public static let property: String = "text-combine-upright"
}

extension TextCombineUpright: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self = .digits(value)
    }
}

extension TextCombineUpright: CustomStringConvertible {

    public var description: String {
        switch self {
        case .none:
            return "none"

        case .all:
            return "all"

        case .digits(let count):
            return "digits \(count)"

        case .global(let global):
            return global.description
        }
    }
}

extension TextCombineUpright {

    public static var digits2: TextCombineUpright {
        .digits(2)
    }

    public static var digits3: TextCombineUpright {
        .digits(3)
    }

    public static var digits4: TextCombineUpright {
        .digits(4)
    }
}
