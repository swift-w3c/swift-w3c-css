public import W3C_CSS_Shared
import W3C_CSS_Values

public enum MaskMode: Property {

    case alpha

    case luminance

    case matchSource

    case multiple([MaskingMode])

    case global(Global)
}

extension MaskMode {
    public static let property: String = "mask-mode"

    public enum MaskingMode: String, Sendable, Hashable {

        case alpha

        case luminance

        case matchSource = "match-source"
    }
}

extension MaskMode: CustomStringConvertible {

    public var description: String {
        switch self {
        case .alpha:
            return "alpha"

        case .luminance:
            return "luminance"

        case .matchSource:
            return "match-source"

        case .multiple(let modes):
            return modes.map { $0.rawValue }.joined(separator: ", ")

        case .global(let global):
            return global.description
        }
    }
}

extension MaskMode {

    public static let `default` = MaskMode.matchSource

    public static func values(_ modes: [MaskingMode]) -> MaskMode {
        if modes.count == 1 {
            switch modes[0] {
            case .alpha: return .alpha
            case .luminance: return .luminance
            case .matchSource: return .matchSource
            }
        }
        return .multiple(modes)
    }

    public static func values(_ modes: MaskingMode...) -> MaskMode {
        values(modes)
    }
}
