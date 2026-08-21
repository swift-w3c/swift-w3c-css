public import W3C_CSS_Shared

public enum AlignmentBaseline: Property {

    case baseline

    case alphabetic

    case central

    case ideographic

    case mathematical

    case middle

    case textBottom

    case textTop

    case global(Global)

    @available(*, deprecated, message: "Use 'baseline' instead")
    case auto

    @available(*, deprecated, message: "Use 'textTop' instead")
    case beforeEdge

    @available(*, deprecated, message: "Use 'textBottom' instead")
    case afterEdge

    @available(*, deprecated, message: "This value is deprecated")
    case hanging

    @available(*, deprecated, message: "Use 'textTop' instead")
    case textBeforeEdge

    @available(*, deprecated, message: "Use 'textBottom' instead")
    case textAfterEdge
}

extension AlignmentBaseline {
    public static let property: String = "alignment-baseline"
}

extension AlignmentBaseline {

    public var description: String {
        switch self {
        case .baseline:
            return "baseline"

        case .alphabetic:
            return "alphabetic"

        case .central:
            return "central"

        case .ideographic:
            return "ideographic"

        case .mathematical:
            return "mathematical"

        case .middle:
            return "middle"

        case .textBottom:
            return "text-bottom"

        case .textTop:
            return "text-top"

        case .global(let global):
            return global.description

        case .auto:
            return "auto"

        case .beforeEdge:
            return "before-edge"

        case .afterEdge:
            return "after-edge"

        case .hanging:
            return "hanging"

        case .textBeforeEdge:
            return "text-before-edge"

        case .textAfterEdge:
            return "text-after-edge"
        }
    }
}
