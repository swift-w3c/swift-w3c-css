public import W3C_CSS_Shared
import W3C_CSS_Values

public enum TextDecorationSkipValue: Sendable, Hashable, CustomStringConvertible {

    case none

    case auto

    case objects

    case spaces

    case leadingSpaces

    case trailingSpaces

    case edges

    case boxDecoration
}

extension TextDecorationSkipValue {
    public var description: String {
        switch self {
        case .none:
            return "none"

        case .auto:
            return "auto"

        case .objects:
            return "objects"

        case .spaces:
            return "spaces"

        case .leadingSpaces:
            return "leading-spaces"

        case .trailingSpaces:
            return "trailing-spaces"

        case .edges:
            return "edges"

        case .boxDecoration:
            return "box-decoration"
        }
    }
}

public enum TextDecorationSkip: Property {

    case value(TextDecorationSkipValue)

    case values([TextDecorationSkipValue])

    case global(Global)
}

extension TextDecorationSkip {
    public static let property: String = "text-decoration-skip"
}

extension TextDecorationSkip: CustomStringConvertible {
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
