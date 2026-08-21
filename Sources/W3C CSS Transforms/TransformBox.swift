public import W3C_CSS_Shared

public enum TransformBox: Property {

    case contentBox

    case borderBox

    case fillBox

    case strokeBox

    case viewBox

    case global(Global)
}

extension TransformBox {
    public static let property: String = "transform-box"
}

extension TransformBox: CustomStringConvertible {

    public var description: String {
        switch self {
        case .contentBox:
            return "content-box"

        case .borderBox:
            return "border-box"

        case .fillBox:
            return "fill-box"

        case .strokeBox:
            return "stroke-box"

        case .viewBox:
            return "view-box"

        case .global(let global):
            return global.description
        }
    }
}

extension TransformBox {

    public static let defaultValue: TransformBox = .viewBox

    public static func content() -> TransformBox {
        .contentBox
    }

    public static func border() -> TransformBox {
        .borderBox
    }

    public static func svgBoundingBox() -> TransformBox {
        .fillBox
    }

    public static func svgViewport() -> TransformBox {
        .viewBox
    }
}
