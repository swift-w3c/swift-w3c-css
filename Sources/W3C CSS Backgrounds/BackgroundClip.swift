public import W3C_CSS_Shared
import W3C_CSS_Values

public enum BackgroundClip: Property {

    case borderBox

    case paddingBox

    case contentBox

    case text

    case borderArea

    case multiple([BackgroundClip])

    case global(Global)
}

extension BackgroundClip {
    public static let property: String = "background-clip"
}

extension BackgroundClip: CustomStringConvertible {

    public var description: String {
        switch self {
        case .borderBox:
            return "border-box"

        case .paddingBox:
            return "padding-box"

        case .contentBox:
            return "content-box"

        case .text:
            return "text"

        case .borderArea:
            return "border-area"

        case .multiple(let clips):
            return clips.map { $0.description }.joined(separator: ", ")

        case .global(let global):
            return global.description
        }
    }
}

extension BackgroundClip {

    public static let `default` = BackgroundClip.borderBox

    public static func values(_ clips: [BackgroundClip]) -> BackgroundClip {
        if clips.count == 1, case let clip = clips[0] {
            return clip
        }
        return .multiple(clips)
    }

    public static func values(_ clips: BackgroundClip...) -> BackgroundClip {
        values(clips)
    }
}
