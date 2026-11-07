public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum FontStretch: Property, PercentageConvertible {

    case keyword(Keyword)

    case percentage(Percentage)

    case global(Global)
}

extension FontStretch {
    public static let property: String = "font-stretch"

    public enum Keyword: String, Sendable, Hashable {

        case ultraCondensed = "ultra-condensed"

        case extraCondensed = "extra-condensed"

        case condensed

        case semiCondensed = "semi-condensed"

        case normal

        case semiExpanded = "semi-expanded"

        case expanded

        case extraExpanded = "extra-expanded"

        case ultraExpanded = "ultra-expanded"
    }
}

extension FontStretch.Keyword {

    public var percentage: Percentage {
        switch self {
        case .ultraCondensed: return 50
        case .extraCondensed: return 62.5
        case .condensed: return 75
        case .semiCondensed: return 87.5
        case .normal: return 100
        case .semiExpanded: return 112.5
        case .expanded: return 125
        case .extraExpanded: return 150
        case .ultraExpanded: return 200
        }
    }
}

extension FontStretch {

    public static let ultraCondensed: FontStretch = .keyword(.ultraCondensed)
    public static let extraCondensed: FontStretch = .keyword(.extraCondensed)
    public static let condensed: FontStretch = .keyword(.condensed)
    public static let semiCondensed: FontStretch = .keyword(.semiCondensed)
    public static let normal: FontStretch = .keyword(.normal)
    public static let semiExpanded: FontStretch = .keyword(.semiExpanded)
    public static let expanded: FontStretch = .keyword(.expanded)
    public static let extraExpanded: FontStretch = .keyword(.extraExpanded)
    public static let ultraExpanded: FontStretch = .keyword(.ultraExpanded)

    public var description: String {
        switch self {
        case .keyword(let keyword):
            return keyword.rawValue

        case .percentage(let percentage):

            return max(50, min(200, percentage)).description

        case .global(let value):
            return value.description
        }
    }
}
