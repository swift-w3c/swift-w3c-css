public import W3C_CSS_Shared
import W3C_CSS_Values

public enum TextUnderlinePosition: Property {

    case auto

    case fromFont

    case under

    case left

    case right

    case combined(Set<TextUnderlinePositionValue>)

    case global(Global)

    public init(_ values: Set<TextUnderlinePositionValue>) {
        if values.isEmpty {
            self = .auto
            return
        }

        if values.count == 1, let value = values.first {
            switch value {
            case .auto:
                self = .auto

            case .fromFont:
                self = .fromFont

            case .under:
                self = .under

            case .left:
                self = .left

            case .right:
                self = .right
            }
            return
        }

        self = .combined(values)
    }

    public init(_ values: [TextUnderlinePositionValue]) {
        self.init(Set(values))
    }

    public init(_ values: TextUnderlinePositionValue...) {
        self.init(values)
    }
}

extension TextUnderlinePosition {
    public static let property: String = "text-underline-position"
}

public enum TextUnderlinePositionValue: Sendable, Hashable, CustomStringConvertible {

    case auto

    case fromFont

    case under

    case left

    case right
}

extension TextUnderlinePositionValue {
    public var description: String {
        switch self {
        case .auto: return "auto"
        case .fromFont: return "from-font"
        case .under: return "under"
        case .left: return "left"
        case .right: return "right"
        }
    }
}

extension TextUnderlinePosition: CustomStringConvertible {

    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .fromFont:
            return "from-font"

        case .under:
            return "under"

        case .left:
            return "left"

        case .right:
            return "right"

        case .combined(let values):
            return values.map { $0.description }.joined(separator: " ")

        case .global(let global):
            return global.description
        }
    }
}
