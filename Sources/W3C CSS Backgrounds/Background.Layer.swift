public import W3C_CSS_Color
public import W3C_CSS_Images
public import W3C_CSS_Shared
public import W3C_CSS_Values


extension Background {
    public struct Layer: Sendable, Hashable {

        public var image: Image?

        public var position: BackgroundPosition?

        public var size: BackgroundSize?

        public var `repeat`: BackgroundRepeat?

        public var attachment: BackgroundAttachment?

        public var origin: BackgroundOrigin?

        public var clip: BackgroundClip?

        public var color: W3C_CSS_Values::Color?

        public init(
            image: Image? = nil,
            position: BackgroundPosition? = nil,
            size: BackgroundSize? = nil,
            repeat: BackgroundRepeat? = nil,
            attachment: BackgroundAttachment? = nil,
            origin: BackgroundOrigin? = nil,
            clip: BackgroundClip? = nil,
            color: W3C_CSS_Values::Color? = nil
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
