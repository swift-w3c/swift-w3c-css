public import W3C_CSS_Shared
import W3C_CSS_Values

public enum TextSpacingOption: String, Sendable, Hashable, CaseIterable {

    case trimStart = "trim-start"

    case trimEnd = "trim-end"

    case trimAll = "trim-all"

    case spaceFirst = "space-first"

    case spaceAll = "space-all"
}
