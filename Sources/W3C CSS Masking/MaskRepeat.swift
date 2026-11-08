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
        self =
            if repeats.count == 1 {
                repeats[0]
            } else {
                .multiple(repeats)
            }
    }
}

extension MaskRepeat {
    public static let property: String = "mask-repeat"

}

extension MaskRepeat: CustomStringConvertible {

    public var description: String {
        switch self {
        case .single(let style):
            return style.rawValue

        case .twoValue(let horizontal, let vertical):

            return if horizontal == .repeat && vertical == .noRepeat {
                RepeatStyle.repeatX.rawValue
            } else if horizontal == .noRepeat && vertical == .repeat {
                RepeatStyle.repeatY.rawValue
            } else {
                "\(horizontal.rawValue) \(vertical.rawValue)"
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
