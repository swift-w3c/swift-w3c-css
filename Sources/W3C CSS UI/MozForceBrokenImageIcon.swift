public import W3C_CSS_Shared
import W3C_CSS_Values

public enum MozForceBrokenImageIcon: Property {

    case off

    case on

    case global(Global)
}

extension MozForceBrokenImageIcon {
    public static let property: String = "-moz-force-broken-image-icon"

    public var description: String {
        switch self {
        case .off:
            return "0"

        case .on:
            return "1"

        case .global(let global):
            return global.description
        }
    }
}
