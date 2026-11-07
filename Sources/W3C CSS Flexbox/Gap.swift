public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum Gap: Property {

    case single(GapValue)

    case double(GapValue, GapValue)

    case global(Global)
}

extension Gap {
    public static let property: String = "gap"
}

extension Gap: LengthConvertible {

    public static func length(_ value: Length) -> Gap {
        .single(.length(value))
    }
}

extension Gap: PercentageConvertible {

    public static func percentage(_ value: Percentage) -> Gap {
        .single(.percentage(value))
    }
}

extension Gap {

    public static func percentage(_ rowGap: Percentage, _ columnGap: Percentage) -> Gap {
        .double(.percentage(rowGap), .percentage(columnGap))
    }
}

public enum GapValue: Sendable, Hashable {

    case normal

    case length(Length)

    case percentage(Percentage)
}

extension GapValue: CustomStringConvertible {

    public var description: String {
        switch self {
        case .normal:
            return "normal"

        case .length(let value):
            return value.description

        case .percentage(let percentage):
            return percentage.description
        }
    }
}

extension Gap: CustomStringConvertible {

    public var description: String {
        switch self {
        case .single(let gap):
            return gap.description

        case .double(let rowGap, let columnGap):
            return "\(rowGap) \(columnGap)"

        case .global(let global):
            return global.description
        }
    }
}
