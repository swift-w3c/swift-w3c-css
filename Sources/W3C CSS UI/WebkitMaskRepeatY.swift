public import W3C_CSS_Shared
import W3C_CSS_Values

public enum WebkitMaskRepeatY: Property {

    case `repeat`

    case noRepeat

    case space

    case round

    case multiple([WebkitMaskRepeatY])

    case global(Global)

    public init(_ repeats: [WebkitMaskRepeatY]) {
        if repeats.count == 1 {
            self = repeats[0]
        } else {
            self = .multiple(repeats)
        }
    }
}

extension WebkitMaskRepeatY: CustomStringConvertible {
    public static let property: String = "-webkit-mask-repeat-y"

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

extension WebkitMaskRepeatY {

    public static let `default` = WebkitMaskRepeatY.repeat

    public static func values(_ repeats: [WebkitMaskRepeatY]) -> WebkitMaskRepeatY {
        WebkitMaskRepeatY(repeats)
    }

    public static func values(_ repeats: WebkitMaskRepeatY...) -> WebkitMaskRepeatY {
        values(repeats)
    }
}
