public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum AnimationDelay: Property {

    case time(Time)

    case global(Global)
}

extension AnimationDelay {
    public static let property: String = "animation-delay"
}

extension AnimationDelay {

    public static func s(_ seconds: Double) -> AnimationDelay {
        return .time(Time.s(seconds))
    }

    public static func ms(_ milliseconds: Double) -> AnimationDelay {
        return .time(Time.ms(milliseconds))
    }

    public static let zero = AnimationDelay.time(Time.zero)
}

extension AnimationDelay: CustomStringConvertible {

    public var description: String {
        switch self {
        case .time(let time):
            return time.description

        case .global(let global):
            return global.description
        }
    }
}
