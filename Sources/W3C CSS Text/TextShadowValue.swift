public import W3C_CSS_Shared
public import W3C_CSS_Values

public struct TextShadowValue: Sendable, Hashable {

    public var offsetX: Length

    public var offsetY: Length

    public var blurRadius: Length?

    public var color: Color?

    public init(offsetX: Length, offsetY: Length, blurRadius: Length? = nil, color: Color? = nil) {
        self.offsetX = offsetX
        self.offsetY = offsetY
        self.blurRadius = blurRadius
        self.color = color
    }
}
