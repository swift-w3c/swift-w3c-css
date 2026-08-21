public import W3C_CSS_Shared
import W3C_CSS_Values

public enum ForcedColorAdjust: Property {

    case auto

    case none

    case preserveParentColor

    case global(Global)
}

extension ForcedColorAdjust {
    public static let property: String = "forced-color-adjust"

    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .none:
            return "none"

        case .preserveParentColor:
            return "preserve-parent-color"

        case .global(let global):
            return global.description
        }
    }
}
