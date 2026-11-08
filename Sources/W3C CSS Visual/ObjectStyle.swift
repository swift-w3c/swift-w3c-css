import W3C_CSS_Positioning
public import W3C_CSS_Shared
public import W3C_CSS_Values

public struct ObjectStyle: Sendable, Hashable {

    public let position: ObjectPosition

    public init(position: ObjectPosition) {
        self.position = position
    }
}
