public import W3C_CSS_Easing
public import W3C_CSS_Shared
import W3C_CSS_Values

public enum TransitionTimingFunction: Property {

    case list([EasingFunction])

    case global(Global)

    public init(_ function: EasingFunction) {
        self = .list([function])
    }

    public init(_ functions: [EasingFunction]) {
        self = .list(functions)
    }

    public init(_ functions: EasingFunction...) {
        self = .list(functions)
    }
}

extension TransitionTimingFunction {
    public static let property: String = "transition-timing-function"

    public var description: String {
        switch self {
        case .list(let functions):
            return functions.map { $0.description }.joined(separator: ", ")

        case .global(let global):
            return global.description
        }
    }
}

extension TransitionTimingFunction {

    public static var ease: TransitionTimingFunction {
        .init(.ease)
    }

    public static var linear: TransitionTimingFunction {
        .init(.linear)
    }

    public static var easeIn: TransitionTimingFunction {
        .init(.easeIn)
    }

    public static var easeOut: TransitionTimingFunction {
        .init(.easeOut)
    }

    public static var easeInOut: TransitionTimingFunction {
        .init(.easeInOut)
    }

    public static var stepStart: TransitionTimingFunction {
        .init(.stepStart)
    }

    public static var stepEnd: TransitionTimingFunction {
        .init(.stepEnd)
    }

    public static func cubicBezier(
        x1: Double,
        y1: Double,
        x2: Double,
        y2: Double
    ) -> TransitionTimingFunction {
        .init(EasingFunction.cubicBezier(x1, y1, x2, y2))
    }

    public static func steps(count: Int, position: StepPosition = .end) -> TransitionTimingFunction
    {
        .init(EasingFunction.steps(count, position))
    }
}
