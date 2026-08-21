public import W3C_CSS_Easing
public import W3C_CSS_Shared
import W3C_CSS_Values

public enum AnimationTimingFunction: Property {

    case function(EasingFunction)

    case global(Global)
}

extension AnimationTimingFunction {
    public static let property: String = "animation-timing-function"
}

extension AnimationTimingFunction {

    public static let linear = AnimationTimingFunction.function(.linear)

    public static let ease = AnimationTimingFunction.function(.ease)

    public static let easeIn = AnimationTimingFunction.function(.easeIn)

    public static let easeOut = AnimationTimingFunction.function(.easeOut)

    public static let easeInOut = AnimationTimingFunction.function(.easeInOut)

    public static let stepStart = AnimationTimingFunction.function(.stepStart)

    public static let stepEnd = AnimationTimingFunction.function(.stepEnd)

    public static func cubicBezier(
        _ x1: Double,
        _ y1: Double,
        _ x2: Double,
        _ y2: Double
    ) -> AnimationTimingFunction {
        return .function(.cubicBezier(x1, y1, x2, y2))
    }

    public static func steps(
        _ count: Int,
        _ position: StepPosition? = nil
    ) -> AnimationTimingFunction {
        return .function(.steps(count, position))
    }
}

extension AnimationTimingFunction: CustomStringConvertible {

    public var description: String {
        switch self {
        case .function(let function):
            return function.description

        case .global(let global):
            return global.description
        }
    }
}
