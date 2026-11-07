public import W3C_CSS_Shared
import W3C_CSS_Values

public enum MaskBorderRepeat: Property {

    case all(RepeatStyle)

    case horizontalVertical(RepeatStyle, RepeatStyle)

    case global(Global)

    public init(_ style: RepeatStyle) {
        self = .all(style)
    }

    public init(_ horizontal: RepeatStyle, _ vertical: RepeatStyle) {
        self = .horizontalVertical(horizontal, vertical)
    }
}

extension MaskBorderRepeat {
    public static let property: String = "mask-border-repeat"

    public enum RepeatStyle: String, Sendable, Hashable {

        case stretch

        case `repeat`

        case round

        case space
    }

    public static let `default` = MaskBorderRepeat(.stretch)

    public static let stretch = MaskBorderRepeat(.stretch)

    public static let `repeat` = MaskBorderRepeat(.repeat)

    public static let round = MaskBorderRepeat(.round)

    public static let space = MaskBorderRepeat(.space)
}

extension MaskBorderRepeat: CustomStringConvertible {

    public var description: String {
        switch self {
        case .all(let style):
            return style.rawValue

        case .horizontalVertical(let horizontal, let vertical):
            return "\(horizontal.rawValue) \(vertical.rawValue)"

        case .global(let global):
            return global.description
        }
    }
}
