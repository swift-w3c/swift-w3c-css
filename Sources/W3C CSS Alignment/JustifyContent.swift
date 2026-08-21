public import W3C_CSS_Shared

public enum JustifyContent: Property {

    case normal

    case distribution(ContentDistribution)

    case position(OverflowPosition?, ContentPosition)

    case left

    case right

    case global(Global)
}

extension JustifyContent {
    public static let property: String = "justify-content"
}

extension JustifyContent: CustomStringConvertible {

    public var description: String {
        switch self {
        case .normal:
            return "normal"

        case .distribution(let distribution):
            return distribution.description

        case .position(let overflow, let position):
            if let overflow {
                return "\(overflow) \(position)"
            } else {
                return position.description
            }

        case .left:
            return "left"

        case .right:
            return "right"

        case .global(let global):
            return global.description
        }
    }
}

extension JustifyContent {

    public static var spaceBetween: Self {
        return .distribution(.spaceBetween)
    }

    public static var spaceAround: Self {
        return .distribution(.spaceAround)
    }

    public static var spaceEvenly: Self {
        return .distribution(.spaceEvenly)
    }

    public static var stretch: Self {
        return .distribution(.stretch)
    }

    public static var center: Self {
        .center()
    }

    public static func center(
        overflowPosition: OverflowPosition? = nil
    ) -> Self {
        return .position(overflowPosition, .center)
    }

    public static var start: Self {
        .start()
    }

    public static func start(
        overflowPosition: OverflowPosition? = nil
    ) -> Self {
        return .position(overflowPosition, .start)
    }

    public static var end: Self {
        .end()
    }

    public static func end(
        overflowPosition: OverflowPosition? = nil
    ) -> Self {
        return .position(overflowPosition, .end)
    }

    public static func flexStart(
        overflowPosition: OverflowPosition? = nil
    ) -> Self {
        return .position(overflowPosition, .flexStart)
    }

    public static func flexEnd(
        overflowPosition: OverflowPosition? = nil
    ) -> Self {
        return .position(overflowPosition, .flexEnd)
    }

    public static func safe(
        _ position: ContentPosition
    ) -> Self {
        return .position(.safe, position)
    }

    public static func unsafe(
        _ position: ContentPosition
    ) -> Self {
        return .position(.unsafe, position)
    }
}
