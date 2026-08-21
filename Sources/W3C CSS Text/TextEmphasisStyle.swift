public import W3C_CSS_Shared
import W3C_CSS_Values

public enum TextEmphasisStyle: Property {

    case none

    case shape(EmphasisShape, EmphasisFill)

    case string(CSSString)

    case global(Global)
}

extension TextEmphasisStyle {
    public static let property: String = "text-emphasis-style"
    public var description: String {
        switch self {
        case .none:
            return "none"

        case .shape(let shape, let fill):
            return "\(fill.rawValue) \(shape.rawValue)"

        case .string(let string):
            return string.description

        case .global(let global):
            return global.description
        }
    }
}

public enum EmphasisFill: String, Sendable, Hashable {

    case filled

    case open
}

public enum EmphasisShape: String, Sendable, Hashable {

    case dot

    case circle

    case doubleCircle = "double-circle"

    case triangle

    case sesame
}

extension TextEmphasisStyle {

    public static var filledDot: TextEmphasisStyle {
        .shape(.dot, .filled)
    }

    public static var openDot: TextEmphasisStyle {
        .shape(.dot, .open)
    }

    public static var filledCircle: TextEmphasisStyle {
        .shape(.circle, .filled)
    }

    public static var openCircle: TextEmphasisStyle {
        .shape(.circle, .open)
    }

    public static var filledDoubleCircle: TextEmphasisStyle {
        .shape(.doubleCircle, .filled)
    }

    public static var openDoubleCircle: TextEmphasisStyle {
        .shape(.doubleCircle, .open)
    }

    public static var filledTriangle: TextEmphasisStyle {
        .shape(.triangle, .filled)
    }

    public static var openTriangle: TextEmphasisStyle {
        .shape(.triangle, .open)
    }

    public static var filledSesame: TextEmphasisStyle {
        .shape(.sesame, .filled)
    }

    public static var openSesame: TextEmphasisStyle {
        .shape(.sesame, .open)
    }
}
