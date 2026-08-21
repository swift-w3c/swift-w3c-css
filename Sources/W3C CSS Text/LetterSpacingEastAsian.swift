public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum LetterSpacingEastAsian: Property, LengthConvertible {

    case normal

    case length(Length)

    case global(Global)
}

extension LetterSpacingEastAsian {
    public static let property: String = "letter-spacing-east-asian"
}

extension LetterSpacingEastAsian: CustomStringConvertible {

    public var description: String {
        switch self {
        case .normal:
            return "normal"

        case .length(let value):
            return value.description

        case .global(let global):
            return global.description
        }
    }
}
