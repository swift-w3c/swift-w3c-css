public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum TextSizeAdjust: Property {

    case auto

    case none

    case percentage(Percentage)

    case global(Global)
}

extension TextSizeAdjust {
    public static let property: String = "text-size-adjust"
}

extension TextSizeAdjust: CustomStringConvertible {

    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .none:
            return "none"

        case .percentage(let percentage):
            return percentage.description

        case .global(let global):
            return global.description
        }
    }
}
