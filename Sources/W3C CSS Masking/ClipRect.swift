public import W3C_CSS_Shared
public import W3C_CSS_Values

public struct ClipRect: Sendable, Hashable {

    public var top: ClipValue

    public var right: ClipValue

    public var bottom: ClipValue

    public var left: ClipValue

    public init(top: ClipValue, right: ClipValue, bottom: ClipValue, left: ClipValue) {
        self.top = top
        self.right = right
        self.bottom = bottom
        self.left = left
    }

    public init(top: Double, right: Double, bottom: Double, left: Double) {
        self.top = .length(.px(top))
        self.right = .length(.px(right))
        self.bottom = .length(.px(bottom))
        self.left = .length(.px(left))
    }
}
