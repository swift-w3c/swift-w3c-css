public import W3C_CSS_Shared
import W3C_CSS_Values

public enum MaskBorderMode: Property {

    case alpha

    case luminance

    case global(Global)
}

extension MaskBorderMode {
    public static let property: String = "mask-border-mode"

    public static let `default` = MaskBorderMode.alpha

    public var description: String {
        switch self {
        case .alpha:
            return "alpha"

        case .luminance:
            return "luminance"

        case .global(let global):
            return global.description
        }
    }
}
