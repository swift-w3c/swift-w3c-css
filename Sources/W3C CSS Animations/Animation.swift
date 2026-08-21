public import W3C_CSS_Easing
public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum Animation: Property {

    case single(AnimationProperties)

    case multiple([AnimationProperties])

    case none

    case global(Global)

    public init(_ properties: AnimationProperty...) {
        if properties.isEmpty {
            self = .none
        } else {
            self = .single(AnimationProperties(properties: properties))
        }
    }
}

extension Animation {
    public static let property: String = "animation"
}

extension Animation {

    public static func name(_ name: CSSString) -> Animation {
        return .single(AnimationProperties(properties: [.name(.keyframes(.string(name)))]))
    }
}

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

extension Animation: CustomStringConvertible {

    public var description: String {
        switch self {
        case .single(let properties):
            return properties.description

        case .multiple(let animations):
            return animations.map { $0.description }.joined(separator: ", ")

        case .none:
            return "none"

        case .global(let global):
            return global.description
        }
    }
}

extension AnimationProperties: CustomStringConvertible {

    public var description: String {
        var components: [String] = []

        if let duration {
            components.append(duration.description)
        }

        if let timingFunction {
            components.append(timingFunction.description)
        }

        if let delay {
            components.append(delay.description)
        }

        if let iterationCount {
            components.append(iterationCount.description)
        }

        if let direction {
            components.append(direction.description)
        }

        if let fillMode {
            components.append(fillMode.description)
        }

        if let playState {
            components.append(playState.description)
        }

        if let name {
            components.append(name.description)
        }

        return components.isEmpty ? "none" : components.joined(separator: " ")
    }
}
