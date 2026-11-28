public import W3C_CSS_Shared

/// The axis a legacy flexible box lays its children along. Browsers know it under a vendor prefix only,
/// where line clamping still needs it.
public enum BoxOrient: Property {

    case horizontal

    case vertical

    case inlineAxis

    case blockAxis

    case global(Global)
}

extension BoxOrient {
    public static let property: String = "box-orient"

    public var description: String {
        switch self {
        case .horizontal:
            return "horizontal"

        case .vertical:
            return "vertical"

        case .inlineAxis:
            return "inline-axis"

        case .blockAxis:
            return "block-axis"

        case .global(let global):
            return global.description
        }
    }
}
