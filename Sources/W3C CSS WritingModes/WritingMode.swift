public import W3C_CSS_Shared

public enum WritingMode: Property {

    case horizontalTb

    case verticalLr

    case verticalRl

    case sidewaysLr

    case sidewaysRl

    case global(Global)
}

extension WritingMode {
    public static let property: String = "writing-mode"

    public var description: String {
        switch self {
        case .horizontalTb:
            return "horizontal-tb"

        case .verticalLr:
            return "vertical-lr"

        case .verticalRl:
            return "vertical-rl"

        case .sidewaysLr:
            return "sideways-lr"

        case .sidewaysRl:
            return "sideways-rl"

        case .global(let global):
            return global.description
        }
    }
}
