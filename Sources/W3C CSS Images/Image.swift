public import W3C_CSS_Shared
public import W3C_CSS_Values

public indirect enum Image: Sendable, Hashable {

    case url(Url)

    case gradient(Gradient)

    case element(id: String)

    case crossFade(percentage: Percentage, from: Image, to: Image)

    case imageSet(images: [ImageSetItem])

    case paint(name: String, arguments: [String] = [])

    case none
}

extension Image: CustomStringConvertible {

    public var description: String {
        switch self {
        case .url(let url):
            return url.description

        case .gradient(let gradientString):
            return gradientString.description

        case .element(let id):
            return "element(#\(id))"

        case .crossFade(let percentage, let from, let to):
            return "cross-fade(\(percentage.value.formatted(.number))% \(from), \(to))"

        case .imageSet(let images):
            let imageParts = images.map { "\($0.url.description) \($0.resolution)" }
            return "image-set(\(imageParts.joined(separator: ", ")))"

        case .paint(let name, let arguments):
            if arguments.isEmpty {
                return "paint(\(name))"
            } else {
                return "paint(\(name), \(arguments.joined(separator: ", ")))"
            }

        case .none:
            return "none"
        }
    }
}

extension Image {

    public static func linearGradient(_ stops: [Color]) -> Self {
        return .gradient(
            Gradient.linear(direction: nil, colorStops: stops.map { Gradient.ColorStop($0) })
        )
    }

    public static func linearGradient(angle: Angle, stops: [Color]) -> Self {
        return .gradient(
            Gradient.linear(
                direction: .angle(angle),
                colorStops: stops.map { Gradient.ColorStop($0) }
            )
        )
    }

    public static func linearGradient(to side: Gradient.Direction.Side, stops: [Color]) -> Self {
        return .gradient(
            Gradient.linear(
                direction: .to(side),
                colorStops: stops.map { Gradient.ColorStop($0) }
            )
        )
    }

    public static func radialGradient(_ stops: [Color]) -> Self {
        return .gradient(
            Gradient.radial(
                options: nil,
                colorStops: stops.map { Gradient.ColorStop($0) }
            )
        )
    }

    public static func conicGradient(from angle: Angle, stops: [Color]) -> Self {
        return .gradient(
            Gradient.conic(
                angle: angle,
                at: nil,
                colorStops: stops.map { Gradient.ColorStop($0) }
            )
        )
    }

    public static func paint(_ name: String, arguments: [String] = []) -> Self {
        return .paint(name: name, arguments: arguments)
    }

    public static func imageSet(_ items: [(url: Url, resolution: String)]) -> Self {
        let imageItems = items.map { ImageSetItem(url: $0.url, resolution: $0.resolution) }
        return .imageSet(images: imageItems)
    }
}

public struct ImageSetItem: Sendable, Hashable {
    public let url: Url
    public let resolution: String

    public init(url: Url, resolution: String) {
        self.url = url
        self.resolution = resolution
    }
}
