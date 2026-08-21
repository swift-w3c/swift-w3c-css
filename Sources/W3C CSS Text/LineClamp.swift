public import W3C_CSS_Shared
import W3C_CSS_Values

public enum LineClamp: Property {

    case none

    case lines(Int)

    case global(Global)
}

extension LineClamp {
    public static let property: String = "line-clamp"
    public var description: String {
        switch self {
        case .none:
            return "none"

        case .lines(let count):

            let safeCount = max(1, count)
            return "\(safeCount)"

        case .global(let global):
            return global.description
        }
    }
}

extension LineClamp: ExpressibleByIntegerLiteral {

    public init(integerLiteral value: Int) {
        self = .lines(value)
    }
}
