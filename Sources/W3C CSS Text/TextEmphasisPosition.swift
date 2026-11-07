public import W3C_CSS_Shared
import W3C_CSS_Values

public enum TextEmphasisPosition: Property {

    case auto

    case position(HorizontalEmphasisPosition, VerticalEmphasisPosition?)

    case global(Global)
}

extension TextEmphasisPosition {
    public static let property: String = "text-emphasis-position"
    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .position(let horizontal, let vertical):
            if let vertical {
                return "\(horizontal.rawValue) \(vertical.rawValue)"
            }
            return horizontal.rawValue

        case .global(let global):
            return global.description
        }
    }
}

public enum HorizontalEmphasisPosition: String, Sendable, Hashable {

    case over

    case under
}

public enum VerticalEmphasisPosition: String, Sendable, Hashable {

    case right

    case left
}

extension TextEmphasisPosition {

    public static var overRight: TextEmphasisPosition {
        .position(.over, .right)
    }

    public static var overLeft: TextEmphasisPosition {
        .position(.over, .left)
    }

    public static var underRight: TextEmphasisPosition {
        .position(.under, .right)
    }

    public static var underLeft: TextEmphasisPosition {
        .position(.under, .left)
    }

    public static var over: TextEmphasisPosition {
        .position(.over, nil)
    }

    public static var under: TextEmphasisPosition {
        .position(.under, nil)
    }
}
