public import W3C_CSS_Shared

public enum Marker: Property {

    case all(MarkerValue)

    case individual(start: MarkerValue?, mid: MarkerValue?, end: MarkerValue?)

    case global(Global)
}

extension Marker {
    public static let property: String = "marker"

    public enum MarkerValue: Sendable, Hashable, CustomStringConvertible {

        case none

        case url(Url)
    }
}

extension Marker.MarkerValue {
    public var description: String {
        switch self {
        case .none:
            return "none"

        case .url(let url):
            return url.description
        }
    }
}

extension Marker {
    public var description: String {
        switch self {
        case .all(let value):
            return value.description

        case .individual(let start, let mid, let end):
            var parts: [String] = []

            if let start {
                parts.append(start.description)
            }

            if let mid {
                parts.append(mid.description)
            }

            if let end {
                parts.append(end.description)
            }

            return parts.joined(separator: " ")

        case .global(let global):
            return global.description
        }
    }
}

extension Marker {

    public static let none = Marker.all(.none)

    public static func reference(id: String) -> Self {
        .all(.url(Url("#\(id)")))
    }

    public static func externalReference(file: String, id: String) -> Self {
        .all(.url(Url("\(file)#\(id)")))
    }

    public static func positions(
        start: MarkerValue? = nil,
        mid: MarkerValue? = nil,
        end: MarkerValue? = nil
    ) -> Self {
        .individual(start: start, mid: mid, end: end)
    }

    public static func start(_ value: MarkerValue) -> Self {
        .individual(start: value, mid: nil, end: nil)
    }

    public static func mid(_ value: MarkerValue) -> Self {
        .individual(start: nil, mid: value, end: nil)
    }

    public static func end(_ value: MarkerValue) -> Self {
        .individual(start: nil, mid: nil, end: value)
    }
}
