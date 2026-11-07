public import W3C_CSS_Shared
import W3C_CSS_Values

public enum BorderImageRepeat: Property {

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

extension BorderImageRepeat {
    public static let property: String = "border-image-repeat"
}

extension BorderImageRepeat {

    public enum RepeatStyle: String, Sendable, Hashable {

        case stretch

        case `repeat`

        case round

        case space
    }
}

extension BorderImageRepeat {

    public static let `default` = BorderImageRepeat(.stretch)

    public static let stretch = BorderImageRepeat(.stretch)

    public static let `repeat` = BorderImageRepeat(.repeat)

    public static let round = BorderImageRepeat(.round)

    public static let space = BorderImageRepeat(.space)
}

extension BorderImageRepeat: CustomStringConvertible {

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
