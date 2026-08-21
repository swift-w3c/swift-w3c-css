public import W3C_CSS_Shared

public enum AlignContent: Property, BaselinePositionConvertible {

    case normal

    case baseline(BaselinePosition)

    case distribution(ContentDistribution)

    case position(OverflowPosition?, ContentPosition)

    case global(Global)
}

extension AlignContent {
    public static let property: String = "align-content"
}

extension AlignContent {

    public var description: String {
        switch self {
        case .normal:
            return "normal"

        case .baseline(let position):
            return position.description

        case .distribution(let distribution):
            return distribution.description

        case .position(let overflow, let position):
            if let overflow {
                return "\(overflow) \(position)"
            } else {
                return position.description
            }

        case .global(let global):
            return global.description
        }
    }
}

extension AlignContent {

    public static let baseline = Self.baseline(.baseline)

    public static let firstBaseline = Self.baseline(.firstBaseline)

    public static let lastBaseline = Self.baseline(.lastBaseline)

    public static let spaceBetween = Self.distribution(.spaceBetween)

    public static let spaceAround = Self.distribution(.spaceAround)

    public static let spaceEvenly = Self.distribution(.spaceEvenly)

    public static let stretch = Self.distribution(.stretch)

    public static let center = Self.position(nil, .center)

    public static let start = Self.position(nil, .start)

    public static let end = Self.position(nil, .end)

    public static let flexStart = Self.position(nil, .flexStart)

    public static let flexEnd = Self.position(nil, .flexEnd)

    public static func safe(_ position: ContentPosition) -> Self {
        return .position(.safe, position)
    }

    public static func unsafe(_ position: ContentPosition) -> Self {
        return .position(.unsafe, position)
    }
}
