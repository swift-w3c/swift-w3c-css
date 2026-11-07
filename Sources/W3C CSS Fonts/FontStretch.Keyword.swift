public import W3C_CSS_Shared
public import W3C_CSS_Values


extension FontStretch {
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
