public import W3C_CSS_Shared
public import W3C_CSS_Values

public struct InsetShape: Sendable, Hashable {

    public var top: LengthPercentage

    public var right: LengthPercentage

    public var bottom: LengthPercentage

    public var left: LengthPercentage

    public var borderRadius: LengthPercentage?

    public init(
        top: LengthPercentage,
        right: LengthPercentage,
        bottom: LengthPercentage,
        left: LengthPercentage,
        borderRadius: LengthPercentage? = nil
    ) {
        self.top = top
        self.right = right
        self.bottom = bottom
        self.left = left
        self.borderRadius = borderRadius
    }

    public init(all: LengthPercentage, borderRadius: LengthPercentage? = nil) {
        self.top = all
        self.right = all
        self.bottom = all
        self.left = all
        self.borderRadius = borderRadius
    }
}
