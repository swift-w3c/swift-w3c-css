public import W3C_CSS_Shared
import W3C_CSS_Values

public enum MaskOrigin: Property {

    case borderBox

    case paddingBox

    case contentBox

    case fillBox

    case strokeBox

    case viewBox

    case multiple([Origin])

    case global(Global)
}

extension MaskOrigin {
    public static let property: String = "mask-origin"

    public enum Origin: String, Sendable, Hashable {

        case borderBox = "border-box"

        case paddingBox = "padding-box"

        case contentBox = "content-box"

        case fillBox = "fill-box"

        case strokeBox = "stroke-box"

        case viewBox = "view-box"
    }
}

extension MaskOrigin: CustomStringConvertible {

    public var description: String {
        switch self {
        case .borderBox:
            return "border-box"

        case .paddingBox:
            return "padding-box"

        case .contentBox:
            return "content-box"

        case .fillBox:
            return "fill-box"

        case .strokeBox:
            return "stroke-box"

        case .viewBox:
            return "view-box"

        case .multiple(let origins):
            return origins.map { $0.rawValue }.joined(separator: ", ")

        case .global(let global):
            return global.description
        }
    }
}

extension MaskOrigin {

    public static let `default` = MaskOrigin.borderBox

    public static func values(_ origins: [Origin]) -> MaskOrigin {
        if origins.count == 1 {
            switch origins[0] {
            case .borderBox: return .borderBox
            case .paddingBox: return .paddingBox
            case .contentBox: return .contentBox
            case .fillBox: return .fillBox
            case .strokeBox: return .strokeBox
            case .viewBox: return .viewBox
            }
        }
        return .multiple(origins)
    }

    public static func values(_ origins: Origin...) -> MaskOrigin {
        values(origins)
    }
}
