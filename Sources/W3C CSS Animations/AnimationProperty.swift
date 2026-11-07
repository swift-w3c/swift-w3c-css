public import W3C_CSS_Easing
public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum AnimationProperty: Sendable, Hashable {

    case name(AnimationName)

    case duration(Time)

    case timingFunction(EasingFunction)

    case delay(Time)

    case iterationCount(AnimationIterationCount)

    case direction(AnimationDirection)

    case fillMode(AnimationFillMode)

    case playState(AnimationPlayState)
}
