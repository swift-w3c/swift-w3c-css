public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum AnimationDuration: Property {

    case auto

    case time(Time)

    case global(Global)
}

extension AnimationDuration {
    public static let property: String = "animation-duration"
}

extension AnimationDuration {

    public static func s(_ seconds: Double) -> AnimationDuration {
        return .time(Time.s(max(0, seconds)))
    }

    public static func ms(_ milliseconds: Double) -> AnimationDuration {
        return .time(Time.ms(max(0, milliseconds)))
    }

    public static let zero = AnimationDuration.time(Time.zero)
}

extension AnimationDuration: CustomStringConvertible {

    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .time(let time):
            return time.description

        case .global(let global):
            return global.description
        }
    }
}
