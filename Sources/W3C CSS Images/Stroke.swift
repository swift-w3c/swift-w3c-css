public import W3C_CSS_Color
public import W3C_CSS_Shared
public import W3C_CSS_Values

public indirect enum Stroke: Property, ColorConvertible {

    case none

    case contextStroke

    case color(W3C_CSS_Values.Color)

    case url(Url)

    case urlWithFallback(url: Url, fallback: Stroke = .none)

    case global(Global)
}

extension Stroke {
    public static let property: String = "stroke"

    public var description: String {
        switch self {
        case .none:
            return "none"

        case .contextStroke:
            return "context-stroke"

        case .color(let color):
            return color.description

        case .url(let url):
            return url.description

        case .urlWithFallback(let url, let fallback):
            return "\(url) \(fallback)"

        case .global(let value):
            return value.description
        }
    }
}
