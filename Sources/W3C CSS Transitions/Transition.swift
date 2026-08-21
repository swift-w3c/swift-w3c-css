public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum Transition: Property {

    case config(Configuration)

    case global(Global)

    public init(
        property: Property = .all,
        duration: Time = .zero,
        timingFunction: TimingFunction = .ease,
        delay: Time? = nil,
        behavior: Behavior? = nil
    ) {
        self = .config(
            Configuration(
                property: property,
                duration: duration,
                timingFunction: timingFunction,
                delay: delay,
                behavior: behavior
            )
        )
    }
}

extension Transition {
    public static let property: String = "transition"

    public typealias Property = TransitionProperty

    public typealias TimingFunction = TransitionTimingFunction

    public typealias Behavior = TransitionBehavior

    public typealias Time = W3C_CSS_Values.Time

    public struct Configuration: Sendable, Hashable, CustomStringConvertible {

        public let property: Property

        public let duration: Time

        public let timingFunction: TimingFunction

        public let delay: Time?

        public let behavior: Behavior?

        public init(
            property: Property,
            duration: Time,
            timingFunction: TimingFunction,
            delay: Time? = nil,
            behavior: Behavior? = nil
        ) {
            self.property = property
            self.duration = duration
            self.timingFunction = timingFunction
            self.delay = delay
            self.behavior = behavior
        }
    }
}

extension Transition.Configuration {
    public var description: String {
        var result = [property.description, duration.description, timingFunction.description]

        if let delay {
            result.append(delay.description)
        }

        if let behavior {
            result.append(behavior.description)
        }

        return result.joined(separator: " ")
    }
}

extension Transition: CustomStringConvertible {

    public var description: String {
        switch self {
        case .config(let config):
            return config.description

        case .global(let global):
            return global.description
        }
    }
}

extension Transition {

    public static func all(
        duration: Time,
        timingFunction: TimingFunction = .ease,
        delay: Time? = nil,
        behavior: Behavior? = nil
    ) -> Transition {
        .config(
            Configuration(
                property: .all,
                duration: duration,
                timingFunction: timingFunction,
                delay: delay,
                behavior: behavior
            )
        )
    }

    public static func none() -> Transition {
        .config(
            Configuration(
                property: .none,
                duration: .zero,
                timingFunction: .ease
            )
        )
    }

    public static func custom(
        _ propertyName: String,
        duration: Time,
        timingFunction: TimingFunction = .ease,
        delay: Time? = nil,
        behavior: Behavior? = nil
    ) -> Transition {
        .config(
            Configuration(
                property: .custom(.init(propertyName)),
                duration: duration,
                timingFunction: timingFunction,
                delay: delay,
                behavior: behavior
            )
        )
    }
}
