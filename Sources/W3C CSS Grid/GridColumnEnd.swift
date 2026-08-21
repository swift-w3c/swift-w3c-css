public import W3C_CSS_Shared

public enum GridColumnEnd: Property {

    case auto

    case line(Int)

    case lineEnd(Int)

    case name(String)

    case span(Int)

    case spanTo(String)

    case global(Global)
}

extension GridColumnEnd {
    public static let property: String = "grid-column-end"

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

        case .global(let value):
            return value.description
        }
    }
}
