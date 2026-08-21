import W3C_CSS_Shared
public import W3C_CSS_Values

@available(
    *,
    deprecated,
    message: "The clip property is deprecated. Use clip-path with BasicShape instead."
)
public enum Shape: Sendable, Hashable {

    case rect(top: Length, right: Length, bottom: Length, left: Length)
}

@available(
    *,
    deprecated,
    message: "The clip property is deprecated. Use clip-path with BasicShape instead."
)
extension Shape: CustomStringConvertible {

    public var description: String {
        switch self {
        case .rect(let top, let right, let bottom, let left):
            return "rect(\(top), \(right), \(bottom), \(left))"
        }
    }
}

@available(
    *,
    deprecated,
    message: "The clip property is deprecated. Use clip-path with BasicShape instead."
)
extension Shape {

    public static func rect(top: Double, right: Double, bottom: Double, left: Double) -> Shape {
        return .rect(top: .px(top), right: .px(right), bottom: .px(bottom), left: .px(left))
    }

    public static func rect(all: Double) -> Shape {
        return .rect(top: all, right: all, bottom: all, left: all)
    }

    @available(
        *,
        deprecated,
        message:
            "Auto values are not well supported for rect(). Use clip-path with BasicShape instead."
    )
    public static let auto = Shape.rect(
        top: .auto,
        right: .auto,
        bottom: .auto,
        left: .auto
    )
}
