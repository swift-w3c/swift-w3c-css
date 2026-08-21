public import W3C_CSS_Color
public import W3C_CSS_Shared
public import W3C_CSS_Values

public indirect enum Fill: Property, ColorConvertible {

    case none

    case contextFill

    case contextStroke

    case color(W3C_CSS_Values.Color)

    case url(Url)

    case urlWithFallback(url: Url, fallback: Fill = .none)

    case global(Global)
}

extension Fill {
    public static let property: String = "fill"

    public var description: String {
        switch self {
        case .none:
            return "none"

        case .contextFill:
            return "context-fill"

        case .contextStroke:
            return "context-stroke"

        case .color(let color):
            return color.description

        case .url(let url):
            return url.description

        case .urlWithFallback(let url, let fallback):
            return "url(\(url)) \(fallback)"

        case .global(let value):
            return value.description
        }
    }
}
