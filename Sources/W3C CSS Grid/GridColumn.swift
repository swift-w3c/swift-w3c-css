public import W3C_CSS_Shared

public enum GridColumn: Property {

    case auto

    case line(Int)

    case name(String)

    case span(Int)

    case spanTo(String)

    case placement(GridColumnValue, GridColumnValue)

    case global(Global)
}

extension GridColumn {
    public static let property: String = "grid-column"

    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .line(let lineNum):
            return "\(lineNum)"

        case .name(let name):
            return name

        case .span(let tracks):
            return "span \(tracks)"

        case .spanTo(let name):
            return "span \(name)"

        case .placement(let start, let end):
            return "\(start) / \(end)"

        case .global(let value):
            return value.description
        }
    }
}

public enum GridColumnValue: Sendable, Hashable, CustomStringConvertible {

    case auto

    case line(Int)

    case lineEnd(Int)

    case name(String)

    case span(Int)

    case spanTo(String)
}

extension GridColumnValue {
    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .line(let lineNum):
            return "\(lineNum)"

        case .lineEnd(let lineNum):

            let value = lineNum > 0 ? -lineNum : lineNum
            return "\(value)"

        case .name(let name):
            return name

        case .span(let tracks):
            return "span \(tracks)"

        case .spanTo(let name):
            return "span \(name)"
        }
    }
}
