public import W3C_CSS_Shared
import W3C_CSS_Values

public enum WebkitMaskRepeatX: Property {

    case `repeat`

    case noRepeat

    case space

    case round

    case multiple([WebkitMaskRepeatX])

    case global(Global)

    public init(_ repeats: [WebkitMaskRepeatX]) {
        if repeats.count == 1 {
            self = repeats[0]
        } else {
            self = .multiple(repeats)
        }
    }
}

extension WebkitMaskRepeatX: CustomStringConvertible {
    public static let property: String = "-webkit-mask-repeat-x"

    public var description: String {
        switch self {
        case .repeat:
            return "repeat"

        case .noRepeat:
            return "no-repeat"

        case .space:
            return "space"

        case .round:
            return "round"

        case .multiple(let repeats):
            return repeats.map { $0.description }.joined(separator: ", ")

        case .global(let global):
            return global.description
        }
    }
}

extension WebkitMaskRepeatX {

    public static let `default` = WebkitMaskRepeatX.repeat

    public static func values(_ repeats: [WebkitMaskRepeatX]) -> WebkitMaskRepeatX {
        WebkitMaskRepeatX(repeats)
    }

    public static func values(_ repeats: WebkitMaskRepeatX...) -> WebkitMaskRepeatX {
        values(repeats)
    }
}
