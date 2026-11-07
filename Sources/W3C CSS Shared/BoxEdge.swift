public enum BoxEdge: String, Sendable, Hashable {

    case contentBox = "content-box"

    case paddingBox = "padding-box"

    case borderBox = "border-box"

    case marginBox = "margin-box"

    case fillBox = "fill-box"

    case strokeBox = "stroke-box"

    case viewBox = "view-box"
}

extension BoxEdge {
}

extension BoxEdge: CustomStringConvertible {

    public var description: String {
        return rawValue
    }
}

extension BoxEdge.Visual: CustomStringConvertible {
    public var description: String { return rawValue }
}

extension BoxEdge.Layout: CustomStringConvertible {
    public var description: String { return rawValue }
}

extension BoxEdge.Paint: CustomStringConvertible {
    public var description: String { return rawValue }
}

extension BoxEdge.Coordinate: CustomStringConvertible {
    public var description: String { return rawValue }
}

extension BoxEdge.Geometry: CustomStringConvertible {
    public var description: String { return rawValue }
}
