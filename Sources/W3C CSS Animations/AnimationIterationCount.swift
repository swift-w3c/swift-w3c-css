public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum AnimationIterationCount: Property {

    case infinite

    case count(Number)

    case global(Global)
}

extension AnimationIterationCount {
    public static let property: String = "animation-iteration-count"
}

extension AnimationIterationCount: CustomStringConvertible {

    public var description: String {
        switch self {
        case .infinite:
            return "infinite"

        case .count(let count):
            return count.description

        case .global(let global):
            return global.description
        }
    }
}

extension AnimationIterationCount: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {

    public init(integerLiteral value: Int) {
        if value <= 0 {
            self = .count(1)
        } else {
            self = .count(.init(value))
        }
    }

    public init(floatLiteral value: Double) {
        if value <= 0 {
            self = .count(1)
        } else {
            self = .count(.init(value))
        }
    }
}
