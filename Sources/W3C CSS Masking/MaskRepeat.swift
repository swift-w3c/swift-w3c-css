public import W3C_CSS_Shared
import W3C_CSS_Values

public enum MaskRepeat: Property {

    case single(RepeatStyle)

    case twoValue(RepeatStyle, RepeatStyle)

    case multiple([MaskRepeat])

    case global(Global)

    public init(_ style: RepeatStyle) {
        self = .single(style)
    }

    public init(_ horizontal: RepeatStyle, _ vertical: RepeatStyle) {
        self = .twoValue(horizontal, vertical)
    }

    public init(_ repeats: [MaskRepeat]) {
        if repeats.count == 1 {
            self = repeats[0]
        } else {
            self = .multiple(repeats)
        }
    }
}

extension MaskRepeat {
    public static let property: String = "mask-repeat"

    public enum RepeatStyle: String, Sendable, Hashable {

        case `repeat` = "repeat"

        case noRepeat = "no-repeat"

        case repeatX = "repeat-x"

        case repeatY = "repeat-y"

        case space = "space"

        case round = "round"
    }
}

extension MaskRepeat: CustomStringConvertible {

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

extension MaskRepeat {

    public static let `default` = MaskRepeat(.repeat)

    public static let `repeat` = MaskRepeat(.repeat)

    public static let noRepeat = MaskRepeat(.noRepeat)

    public static let repeatX = MaskRepeat(.repeatX)

    public static let repeatY = MaskRepeat(.repeatY)

    public static let space = MaskRepeat(.space)

    public static let round = MaskRepeat(.round)

    public static func values(_ repeats: [MaskRepeat]) -> MaskRepeat {
        MaskRepeat(repeats)
    }

    public static func values(_ repeats: MaskRepeat...) -> MaskRepeat {
        values(repeats)
    }
}
