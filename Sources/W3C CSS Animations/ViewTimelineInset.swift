public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum ViewTimelineInset: Property {

    case single(ViewTimelineInsetValue)

    case double(ViewTimelineInsetValue, ViewTimelineInsetValue)

    case global(Global)
}

extension ViewTimelineInset {
    public static let property: String = "view-timeline-inset"
}

public enum ViewTimelineInsetValue: Sendable, Hashable {

    case auto

    case length(Length)

    case percentage(Percentage)
}

extension ViewTimelineInsetValue: CustomStringConvertible {

    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .length(let length):
            return length.description

        case .percentage(let percentage):
            return percentage.description
        }
    }
}

extension ViewTimelineInset: CustomStringConvertible {

    public var description: String {
        switch self {
        case .single(let value):
            return value.description

        case .double(let start, let end):
            return "\(start) \(end)"

        case .global(let global):
            return global.description
        }
    }
}

extension ViewTimelineInset: LengthConvertible {
    public static func length(_ length: Length) -> ViewTimelineInset {
        .single(.length(length))
    }
}

extension ViewTimelineInset {

    public static func auto() -> Self {
        return .single(.auto)
    }
}
