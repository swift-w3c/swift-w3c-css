public import W3C_CSS_Easing
public import W3C_CSS_Shared
public import W3C_CSS_Values

public struct AnimationProperties: Sendable, Hashable {

    public var name: AnimationName?

    public var duration: Time?

    public var timingFunction: EasingFunction?

    public var delay: Time?

    public var iterationCount: AnimationIterationCount?

    public var direction: AnimationDirection?

    public var fillMode: AnimationFillMode?

    public var playState: AnimationPlayState?

    public init(
        name: AnimationName? = nil,
        duration: Time? = nil,
        timingFunction: EasingFunction? = nil,
        delay: Time? = nil,
        iterationCount: AnimationIterationCount? = nil,
        direction: AnimationDirection? = nil,
        fillMode: AnimationFillMode? = nil,
        playState: AnimationPlayState? = nil
    ) {
        self.name = name
        self.duration = duration
        self.timingFunction = timingFunction
        self.delay = delay
        self.iterationCount = iterationCount
        self.direction = direction
        self.fillMode = fillMode
        self.playState = playState
    }

    public init(properties: [AnimationProperty]) {
        for property in properties {
            switch property {
            case .name(let value): name = value
            case .duration(let value): duration = value
            case .timingFunction(let value): timingFunction = value
            case .delay(let value): delay = value
            case .iterationCount(let value): iterationCount = value
            case .direction(let value): direction = value
            case .fillMode(let value): fillMode = value
            case .playState(let value): playState = value
            }
        }
    }
}
