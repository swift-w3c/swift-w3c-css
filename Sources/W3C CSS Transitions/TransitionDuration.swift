public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum TransitionDuration: Property {

    case time(Time)

    case list([Time])

    case global(Global)

    public init(_ time: Time) {
        self = .time(time)
    }

    public init(_ times: [Time]) {
        if times.isEmpty {
            self = .time(.zero)
        } else if times.count == 1 {
            self = .time(times[0])
        } else {
            self = .list(times)
        }
    }

    public init(_ times: Time...) {
        self.init(times)
    }
}

extension TransitionDuration {
    public static let property: String = "transition-duration"

    public var description: String {
        switch self {
        case .time(let time):
            return time.description

        case .list(let times):
            return times.map { $0.description }.joined(separator: ", ")

        case .global(let global):
            return global.description
        }
    }

    public static func seconds(_ value: Double) -> TransitionDuration {
        .time(.s(value))
    }

    public static func milliseconds(_ value: Double) -> TransitionDuration {
        .time(.ms(value))
    }

    public static let zero = TransitionDuration(.zero)
}

extension TransitionDuration: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {

    public init(integerLiteral value: Int) {
        self = .time(Time(integerLiteral: value))
    }

    public init(floatLiteral value: Double) {
        self = .time(Time(floatLiteral: value))
    }
}
