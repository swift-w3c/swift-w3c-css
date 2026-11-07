public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum ImageResolution: Property {

    case fromImage(snap: Bool = false)

    case resolution(Resolution, snap: Bool = false)

    case fromImageWithFallback(Resolution, snap: Bool = false)

    case global(Global)

    public init(source: Source, snap: Bool = false) {
        switch source {
        case .fromImage:
            self = .fromImage(snap: snap)

        case .resolution(let resolution):
            self = .resolution(resolution, snap: snap)

        case .fromImageWithFallback(let resolution):
            self = .fromImageWithFallback(resolution, snap: snap)
        }
    }
}

extension ImageResolution {
    public static let property: String = "image-resolution"

    public enum Source: Sendable, Hashable {

        case fromImage

        case resolution(Resolution)

        case fromImageWithFallback(Resolution)
    }
}

extension ImageResolution {

    public func snapped() -> ImageResolution {
        switch self {
        case .fromImage:
            return .fromImage(snap: true)

        case .resolution(let resolution, _):
            return .resolution(resolution, snap: true)

        case .fromImageWithFallback(let resolution, _):
            return .fromImageWithFallback(resolution, snap: true)

        case .global:
            return self
        }
    }
}

extension ImageResolution: CustomStringConvertible {
    public var description: String {
        switch self {
        case .fromImage(let snap):
            return snap ? "from-image snap" : "from-image"

        case .resolution(let resolution, let snap):
            return snap ? "\(resolution.description) snap" : resolution.description

        case .fromImageWithFallback(let resolution, let snap):
            return snap
                ? "from-image \(resolution.description) snap"
                : "from-image \(resolution.description)"

        case .global(let global):
            return global.description
        }
    }
}

extension ImageResolution {

    public static var fromImage: ImageResolution {
        .fromImage()
    }

    public static func dpi(_ value: Double) throws(Resolution.ResolutionError) -> ImageResolution {
        try .resolution(.dpi(value))
    }
}
