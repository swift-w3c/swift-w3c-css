public import W3C_CSS_Shared
import W3C_CSS_Values

public enum ScrollTimelineAxis: Property {

    case axis(Axis)

    case global(Global)

}

extension ScrollTimelineAxis {
    public static let property: String = "scroll-timeline-axis"

    public enum Axis: String, Sendable {

        case block

        case inline

        case y

        case x
    }

    public var description: String {
        switch self {
        case .axis(let axis):
            return axis.rawValue

        case .global(let global):
            return global.description
        }
    }

    public static let block: Self = .axis(.block)

    public static let inline: Self = .axis(.inline)

    public static let y: Self = .axis(.y)

    public static let x: Self = .axis(.x)
}
