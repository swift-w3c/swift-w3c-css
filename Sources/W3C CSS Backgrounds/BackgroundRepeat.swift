public import W3C_CSS_Shared
import W3C_CSS_Values

public enum BackgroundRepeat: Property {

    case single(RepeatStyle)

    case twoValue(RepeatStyle, RepeatStyle)

    case multiple([BackgroundRepeat])

    case global(Global)

    public init(_ style: RepeatStyle) {
        self = .single(style)
    }

    public init(_ horizontal: RepeatStyle, _ vertical: RepeatStyle) {
        self = .twoValue(horizontal, vertical)
    }

    public init(_ repeats: [BackgroundRepeat]) {
        if repeats.count == 1 {
            self = repeats[0]
        } else {
            self = .multiple(repeats)
        }
    }
}

extension BackgroundRepeat {
    public static let property: String = "background-repeat"
}

extension BackgroundRepeat {

    public enum RepeatStyle: String, Sendable, Hashable {

        case `repeat` = "repeat"

        case noRepeat = "no-repeat"

        case repeatX = "repeat-x"

        case repeatY = "repeat-y"

        case space = "space"

        case round = "round"
    }
}

extension BackgroundRepeat: CustomStringConvertible {

    public var description: String {
        switch self {
        case .single(let style):
            return style.rawValue

        case .twoValue(let horizontal, let vertical):

            if horizontal == .repeat && vertical == .noRepeat {
                return RepeatStyle.repeatX.rawValue
            } else if horizontal == .noRepeat && vertical == .repeat {
                return RepeatStyle.repeatY.rawValue
            } else {
                return "\(horizontal.rawValue) \(vertical.rawValue)"
            }

        case .multiple(let repeats):
            return repeats.map { $0.description }.joined(separator: ", ")

        case .global(let global):
            return global.description
        }
    }
}

extension BackgroundRepeat {

    public static let `default` = BackgroundRepeat(.repeat)

    public static let `repeat` = BackgroundRepeat(.repeat)

    public static let noRepeat = BackgroundRepeat(.noRepeat)

    public static let repeatX = BackgroundRepeat(.repeatX)

    public static let repeatY = BackgroundRepeat(.repeatY)

    public static let space = BackgroundRepeat(.space)

    public static let round = BackgroundRepeat(.round)

    public static func values(_ repeats: [BackgroundRepeat]) -> BackgroundRepeat {
        BackgroundRepeat(repeats)
    }

    public static func values(_ repeats: BackgroundRepeat...) -> BackgroundRepeat {
        values(repeats)
    }
}
