public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum ColumnWidth: Property, LengthConvertible {

    case auto

    case length(Length)

    case global(Global)
}

extension ColumnWidth {
    public static let property: String = "column-width"
}

extension ColumnWidth: CustomStringConvertible {
    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .length(let length):
            return length.description

        case .global(let global):
            return global.description
        }
    }
}
