public import W3C_CSS_Shared
import W3C_CSS_Values

public enum MaskClip: Property {

    case borderBox

    case paddingBox

    case contentBox

    case marginBox

    case fillBox

    case strokeBox

    case viewBox

    case noClip

    case multiple([MaskClip])

    case global(Global)
}

extension MaskClip {
    public static let property: String = "mask-clip"
}

extension MaskClip: CustomStringConvertible {

    public var description: String {
        switch self {
        case .borderBox:
            return "border-box"

        case .paddingBox:
            return "padding-box"

        case .contentBox:
            return "content-box"

        case .marginBox:
            return "margin-box"

        case .fillBox:
            return "fill-box"

        case .strokeBox:
            return "stroke-box"

        case .viewBox:
            return "view-box"

        case .noClip:
            return "no-clip"

        case .multiple(let clips):
            return clips.map { $0.description }.joined(separator: ", ")

        case .global(let global):
            return global.description
        }
    }
}

extension MaskClip {

    public static let `default` = MaskClip.borderBox

    public static func values(_ clips: [MaskClip]) -> MaskClip {
        if clips.count == 1, case let clip = clips[0] {
            return clip
        }
        return .multiple(clips)
    }

    public static func values(_ clips: MaskClip...) -> MaskClip {
        values(clips)
    }
}
