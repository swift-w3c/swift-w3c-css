public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum MarginInline: Property {

    case single(Margin)

    case double(Margin, Margin)

    case global(Global)

}

extension MarginInline {
    public static let property: String = "margin-inline"

    public static var auto: MarginInline {
        .single(.auto)
    }

    public static func percentage(_ start: Percentage, _ end: Percentage) -> MarginInline {
        .double(.percentage(start), .percentage(end))
    }
}

extension MarginInline: LengthConvertible {
    public static func length(_ length: Length) -> MarginInline {
        .single(.length(length))
    }
}

extension MarginInline: PercentageConvertible {
    public static func percentage(_ length: Percentage) -> MarginInline {
        .single(.percentage(length))
    }
}

extension MarginInline: CustomStringConvertible {

    public var description: String {
        switch self {
        case .single(let margin):
            return margin.description

        case .double(let start, let end):
            return "\(start) \(end)"

        case .global(let global):
            return global.description
        }
    }
}
