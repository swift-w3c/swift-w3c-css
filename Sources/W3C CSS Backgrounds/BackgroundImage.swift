public import W3C_CSS_Images
public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum BackgroundImage: Property {

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

extension BackgroundImage {
    public static let property: String = "background-image"
}

extension BackgroundImage: CustomStringConvertible {

    public var description: String {
        switch self {
        case .single(let image):
            return image.description

        case .multiple(let images):
            return images.map { $0.description }.joined(separator: ", ")

        case .global(let global):
            return global.description
        }
    }
}

extension BackgroundImage {

    public static let `default` = BackgroundImage(.none)

    public static let none = BackgroundImage(.none)

    public static func url(_ url: Url) -> BackgroundImage {
        BackgroundImage.single(.url(url))
    }

    public static func linearGradient(stops: [Color]) -> BackgroundImage {
        BackgroundImage(.linearGradient(stops))
    }

    public static func linearGradient(
        to side: Gradient.Direction.Side,
        stops: [Color]
    ) -> BackgroundImage {
        BackgroundImage(.linearGradient(to: side, stops: stops))
    }

    public static func radialGradient(stops: [Color]) -> BackgroundImage {
        BackgroundImage(.radialGradient(stops))
    }

    public static func conicGradient(
        from angle: Angle,
        stops: [Color]
    ) -> BackgroundImage {
        BackgroundImage(.conicGradient(from: angle, stops: stops))
    }

    public static func values(_ images: [Image]) -> BackgroundImage {
        BackgroundImage(images)
    }

    public static func values(_ images: Image...) -> BackgroundImage {
        values(images)
    }
}
