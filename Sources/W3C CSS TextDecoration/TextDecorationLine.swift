public import W3C_CSS_Shared
import W3C_CSS_Values

public enum TextDecorationLine: Property {

    case value(TextDecorationLineValue)

    case values([TextDecorationLineValue])

    case global(Global)
}

extension TextDecorationLine {
    public static let property: String = "text-decoration-line"
}

public enum TextDecorationLineValue: Sendable, Hashable, CustomStringConvertible {

    case none

    case underline

    case overline

    case lineThrough

    case blink

    case spellingError

    case grammarError
}

extension TextDecorationLineValue {
    public var description: String {
        switch self {
        case .none:
            return "none"

        case .underline:
            return "underline"

        case .overline:
            return "overline"

        case .lineThrough:
            return "line-through"

        case .blink:
            return "blink"

        case .spellingError:
            return "spelling-error"

        case .grammarError:
            return "grammar-error"
        }
    }
}

extension TextDecorationLine: CustomStringConvertible {
    public var description: String {
        switch self {
        case .value(let value):
            return value.description

        case .values(let values):
            return values.map { $0.description }.joined(separator: " ")

        case .global(let global):
            return global.description
        }
    }
}
