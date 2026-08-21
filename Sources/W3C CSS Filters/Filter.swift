public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum Filter: Property {

    case none

    case filter(FilterFunction)

    case filters([FilterFunction])

    case url(Url)

    case global(Global)
}

extension Filter {
    public static let property: String = "filter"

    public var description: String {
        switch self {
        case .none:
            return "none"

        case .filter(let filter):
            return filter.description

        case .filters(let filters):
            return filters.map { $0.description }.joined(separator: " ")

        case .url(let url):
            return url.description

        case .global(let value):
            return value.description
        }
    }
}
