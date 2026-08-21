public import W3C_CSS_Color
public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum BorderColor: Property, ColorConvertible {

    case all(W3C_CSS_Values.Color)

    case verticalHorizontal(W3C_CSS_Values.Color, W3C_CSS_Values.Color)

    case topHorizontalBottom(W3C_CSS_Values.Color, W3C_CSS_Values.Color, W3C_CSS_Values.Color)

    case topRightBottomLeft(
        W3C_CSS_Values.Color,
        W3C_CSS_Values.Color,
        W3C_CSS_Values.Color,
        W3C_CSS_Values.Color
    )

    case global(Global)

    public init(_ color: W3C_CSS_Values.Color) {
        self = .all(color)
    }

    public init(_ vertical: W3C_CSS_Values.Color, _ horizontal: W3C_CSS_Values.Color) {
        self = .verticalHorizontal(vertical, horizontal)
    }

    public init(
        _ top: W3C_CSS_Values.Color,
        _ horizontal: W3C_CSS_Values.Color,
        _ bottom: W3C_CSS_Values.Color
    ) {
        self = .topHorizontalBottom(top, horizontal, bottom)
    }

    public init(
        _ top: W3C_CSS_Values.Color,
        _ right: W3C_CSS_Values.Color,
        _ bottom: W3C_CSS_Values.Color,
        _ left: W3C_CSS_Values.Color
    ) {
        self = .topRightBottomLeft(top, right, bottom, left)
    }
}

extension BorderColor {
    public static let property: String = "border-color"
}

extension BorderColor: CustomStringConvertible {

    public var description: String {
        switch self {
        case .all(let color):
            return color.description

        case .verticalHorizontal(let vertical, let horizontal):
            return "\(vertical.description) \(horizontal.description)"

        case .topHorizontalBottom(let top, let horizontal, let bottom):
            return "\(top.description) \(horizontal.description) \(bottom.description)"

        case .topRightBottomLeft(let top, let right, let bottom, let left):
            return
                "\(top.description) \(right.description) \(bottom.description) \(left.description)"

        case .global(let global):
            return global.description
        }
    }
}

extension BorderColor {

    public static func color(_ color: W3C_CSS_Values.Color) -> Self {
        .all(color)
    }
}
