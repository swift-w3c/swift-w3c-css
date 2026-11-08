import W3C_CSS_Shared
public import W3C_CSS_Syntax
public import W3C_CSS_Values


extension Container {
    public enum ScrollDirection: String, Hashable, Sendable {
        case none
        case top
        case right
        case bottom
        case left
        case x
        case y
        case blockStart = "block-start"
        case blockEnd = "block-end"
        case inlineStart = "inline-start"
        case inlineEnd = "inline-end"
        case block
        case inline
        case both
    }
}
