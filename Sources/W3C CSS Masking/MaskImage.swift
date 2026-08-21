public import W3C_CSS_Images
public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum MaskImage: Property {

    case none

    case single(Image)

    case multiple([Image])

    case global(Global)

    public init(_ image: Image) {
        self = .single(image)
    }

    public init(_ images: [Image]) {
        if images.count == 1 {
            self = .single(images[0])
        } else {
            self = .multiple(images)
        }
    }
}

extension MaskImage {
    public static let property: String = "mask-image"
}

extension MaskImage: CustomStringConvertible {

    public var description: String {
        switch self {
        case .none:
            return "none"

        case .single(let image):
            return image.description

        case .multiple(let images):
            return images.map { $0.description }.joined(separator: ", ")

        case .global(let global):
            return global.description
        }
    }
}

extension MaskImage {

    public static let `default` = MaskImage.none

    public static func url(_ url: Url) -> MaskImage {
        MaskImage.single(.url(url))
    }

    public static func gradientString(_ gradient: Gradient) -> MaskImage {
        MaskImage(.gradient(gradient))
    }

    public static func linearGradient(_ stops: [Color]) -> MaskImage {
        MaskImage(.linearGradient(stops))
    }

    public static func linearGradient(
        to side: Gradient.Direction.Side,
        stops: [Color]
    ) -> MaskImage {

        MaskImage.single(.linearGradient(to: side, stops: stops))
    }

    public static func radialGradient(_ stops: [Color]) -> MaskImage {
        MaskImage(.radialGradient(stops))
    }

    public static func conicGradient(from angle: Angle, stops: [Color]) -> MaskImage {
        MaskImage(.conicGradient(from: angle, stops: stops))
    }

    public static func values(_ images: [Image]) -> MaskImage {
        MaskImage(images)
    }

    public static func values(_ images: Image...) -> MaskImage {
        values(images)
    }
}
