public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum BackdropFilter: Property {

    case none

    case filter(FilterFunction)

    case filters([FilterFunction])

    case url(Url)

    case combined(url: Url, filters: [FilterFunction])

    case global(Global)
}

extension BackdropFilter {
    public static let property: String = "backdrop-filter"

    public static func filters(_ filters: FilterFunction...) -> BackdropFilter {
        return Self.filters(filters)
    }

}

extension BackdropFilter: CustomStringConvertible {

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

        case .combined(let url, let filters):
            let filterString = filters.map { $0.description }.joined(separator: " ")
            return "\(url.description) \(filterString)"

        case .global(let global):
            return global.description
        }
    }
}

extension BackdropFilter {

    public static func blur(_ radius: Length) -> BackdropFilter {
        .filter(.blur(radius))
    }

    public static func brightness(_ amount: Double) -> BackdropFilter {
        .filter(.brightness(amount))
    }

    public static func contrast(_ amount: Double) -> BackdropFilter {
        .filter(.contrast(amount))
    }

    public static func dropShadow(
        offsetX: Length,
        offsetY: Length,
        blurRadius: Length?,
        color: Color?
    ) -> BackdropFilter {
        .filter(
            .dropShadow(offsetX: offsetX, offsetY: offsetY, blurRadius: blurRadius, color: color)
        )
    }

    public static func grayscale(_ amount: Double) -> BackdropFilter {
        .filter(.grayscale(amount))
    }

    public static func hueRotate(_ angle: Angle) -> BackdropFilter {
        .filter(.hueRotate(angle))
    }

    public static func invert(_ amount: Double) -> BackdropFilter {
        .filter(.invert(amount))
    }

    public static func opacity(_ amount: Double) -> BackdropFilter {
        .filter(.opacity(amount))
    }

    public static func saturate(_ amount: Double) -> BackdropFilter {
        .filter(.saturate(amount))
    }

    public static func sepia(_ amount: Double) -> BackdropFilter {
        .filter(.sepia(amount))
    }

    public static func urlWithFilters(_ url: Url, _ filters: [FilterFunction]) -> BackdropFilter {
        return .combined(url: url, filters: filters)
    }
}
