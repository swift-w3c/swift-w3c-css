public import W3C_CSS_Color
public import W3C_CSS_Images
public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum Background: Property, ColorConvertible {

    case none

    case layer(Layer)

    case layers([Layer])

    case color(W3C_CSS_Values.Color)

    case global(Global)
}

extension Background {
    public static let property: String = "background"
}

extension Background {

    public struct Layer: Sendable, Hashable {

        public var image: Image?

        public var position: BackgroundPosition?

        public var size: BackgroundSize?

        public var `repeat`: BackgroundRepeat?

        public var attachment: BackgroundAttachment?

        public var origin: BackgroundOrigin?

        public var clip: BackgroundClip?

        public var color: W3C_CSS_Values.Color?

        public init(
            image: Image? = nil,
            position: BackgroundPosition? = nil,
            size: BackgroundSize? = nil,
            repeat: BackgroundRepeat? = nil,
            attachment: BackgroundAttachment? = nil,
            origin: BackgroundOrigin? = nil,
            clip: BackgroundClip? = nil,
            color: W3C_CSS_Values.Color? = nil
        ) {
            self.image = image
            self.position = position
            self.size = size
            self.repeat = `repeat`
            self.attachment = attachment
            self.origin = origin
            self.clip = clip
            self.color = color
        }
    }
}

extension Background.Layer {

    public static func color(_ color: W3C_CSS_Values.Color) -> Background.Layer {
        Background.Layer(color: color)
    }

    public static func image(
        _ image: Image,
        position: BackgroundPosition? = nil,
        size: BackgroundSize? = nil,
        repeat: BackgroundRepeat? = nil,
        attachment: BackgroundAttachment? = nil,
        origin: BackgroundOrigin? = nil,
        clip: BackgroundClip? = nil
    ) -> Background.Layer {
        Background.Layer(
            image: image,
            position: position,
            size: size,
            repeat: `repeat`,
            attachment: attachment,
            origin: origin,
            clip: clip
        )
    }

}

extension Background: CustomStringConvertible {

    public var description: String {
        switch self {
        case .none:
            return "none"

        case .layer(let layer):
            return layer.description

        case .layers(let layers):
            if layers.isEmpty {
                return "none"
            }
            return layers.map { $0.description }.joined(separator: ", ")

        case .color(let color):
            return color.description

        case .global(let global):
            return global.description
        }
    }
}

extension Background.Layer: CustomStringConvertible {

    public var description: String {
        var components: [String] = []

        if let image {
            components.append(image.description)
        }

        if let position {
            var positionStr = position.description
            if let size {
                positionStr += "/\(size.description)"
            }
            components.append(positionStr)
        } else if let size {

            components.append("0% 0%/\(size.description)")
        }

        if let repeatStyle = self.repeat {
            components.append(repeatStyle.description)
        }

        if let attachment {
            components.append(attachment.description)
        }

        if let origin {
            components.append(origin.description)
        }

        if let clip {
            components.append(clip.description)
        }

        if let color {
            components.append(color.description)
        }

        if components.isEmpty {
            return "none"
        }

        return components.joined(separator: " ")
    }
}

extension Background {

    public static func image(
        _ url: Url,
        position: BackgroundPosition? = nil,
        size: BackgroundSize? = nil,
        repeat: BackgroundRepeat? = nil
    ) -> Background {
        .layer(Layer.image(.url(url), position: position, size: size, repeat: `repeat`))
    }
}
