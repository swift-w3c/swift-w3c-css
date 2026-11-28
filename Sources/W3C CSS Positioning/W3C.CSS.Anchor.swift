public import W3C_CSS_Shared
public import W3C_CSS_Values

extension W3C.CSS {
    /// The `anchor()` function: the position of one edge of an anchor element.
    public struct Anchor: Sendable, Hashable {
        /// The anchor's name without its dashes, or nil for the element's default anchor.
        public var name: String?

        public var side: Side

        /// The value to use where the anchor cannot be found.
        public var fallback: LengthPercentage?

        public init(_ name: String? = nil, _ side: Side, fallback: LengthPercentage? = nil) {
            self.name = name
            self.side = side
            self.fallback = fallback
        }
    }
}

extension W3C.CSS.Anchor {
    public enum Side: Sendable, Hashable {
        case inside
        case outside
        case top
        case left
        case right
        case bottom
        case start
        case end
        case selfStart
        case selfEnd
        case center
        case percentage(Percentage)
    }
}

extension W3C.CSS.Anchor.Side: CustomStringConvertible {
    public var description: String {
        switch self {
        case .inside: "inside"
        case .outside: "outside"
        case .top: "top"
        case .left: "left"
        case .right: "right"
        case .bottom: "bottom"
        case .start: "start"
        case .end: "end"
        case .selfStart: "self-start"
        case .selfEnd: "self-end"
        case .center: "center"
        case .percentage(let percentage): percentage.description
        }
    }
}

extension W3C.CSS.Anchor: CustomStringConvertible {
    public var description: String {
        var parts = name.map { "--\($0) \(side)" } ?? side.description
        if let fallback { parts += ", \(fallback)" }
        return "anchor(\(parts))"
    }
}
