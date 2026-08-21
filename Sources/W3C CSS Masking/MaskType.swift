public import W3C_CSS_Shared

public enum MaskType: Property {

    case luminance

    case alpha

    case global(Global)
}

extension MaskType {
    public static let property: String = "mask-type"
}

extension MaskType: CustomStringConvertible {

    public var description: String {
        switch self {
        case .luminance:
            return "luminance"

        case .alpha:
            return "alpha"

        case .global(let global):
            return global.description
        }
    }
}

extension MaskType {

    public static let `default` = MaskType.luminance
}
