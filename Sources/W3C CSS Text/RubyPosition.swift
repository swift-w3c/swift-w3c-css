public import W3C_CSS_Shared
import W3C_CSS_Values

public enum RubyPosition: Property, GlobalConvertible {

    case over

    case under

    case alternate

    case alternateOver

    case alternateUnder

    case interCharacter

    case global(Global)
}

extension RubyPosition {
    public static let property: String = "ruby-position"
    public var description: String {
        switch self {
        case .over:
            return "over"

        case .under:
            return "under"

        case .alternate:
            return "alternate"

        case .alternateOver:
            return "alternate over"

        case .alternateUnder:
            return "alternate under"

        case .interCharacter:
            return "inter-character"

        case .global(let global):
            return global.description
        }
    }
}
