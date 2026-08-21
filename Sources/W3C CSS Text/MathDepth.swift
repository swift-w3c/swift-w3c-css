public import W3C_CSS_Shared
import W3C_CSS_Values

public enum MathDepth: Property {

    case autoAdd

    case add(Int)

    case absolute(Int)

    case global(Global)
}

extension MathDepth {
    public static let property: String = "math-depth"
    public var description: String {
        switch self {
        case .autoAdd:
            return "auto-add"

        case .add(let value):
            return "add(\(value))"

        case .absolute(let value):
            return "\(value)"

        case .global(let global):
            return global.description
        }
    }
}

extension MathDepth {

    public static var zero: MathDepth {
        .absolute(0)
    }

    public static var increaseByOne: MathDepth {
        .add(1)
    }

    public static var decreaseByOne: MathDepth {
        .add(-1)
    }
}
