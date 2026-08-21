public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum Offset: Property {

    case path(
        path: OffsetPath,
        distance: OffsetDistance? = nil,
        rotate: OffsetRotate? = nil,
        anchor: OffsetAnchor? = nil
    )

    case position(OffsetPosition, OffsetAnchor?)

    case auto

    case none

    case global(Global)
}

extension Offset {
    public static let property: String = "offset"
}

extension Offset: CustomStringConvertible {

    public var description: String {
        switch self {
        case .path(let path, let distance, let rotate, let anchor):
            var result = "\(path)"

            if let d = distance {
                result += " \(d.description)"
            }

            if let r = rotate {
                result += " \(r.description)"
            }

            if let a = anchor {
                result += " / \(a.description)"
            }

            return result

        case .position(let position, let anchor):
            var result = position.description

            if let a = anchor {
                result += " / \(a.description)"
            }

            return result

        case .auto:
            return "auto"

        case .none:
            return "none"

        case .global(let global):
            return global.description
        }
    }
}

extension Offset {

    public static func path(_ pathData: String) -> Self {
        .path(path: OffsetPath.path(pathData), distance: nil, rotate: nil, anchor: nil)
    }

    public static func url(_ url: Url) -> Self {
        .path(path: .url(url), distance: nil, rotate: nil, anchor: nil)
    }

    public static func circle(
        _ radius: LengthPercentage,
        at position: Position? = nil
    ) -> Self {
        .path(path: .circle(radius, at: position), distance: nil, rotate: nil, anchor: nil)
    }

    public static func ray(_ angle: Angle, _ size: OffsetPath.RaySize? = nil) -> Self {
        .path(path: .ray(angle: angle, size: size), distance: nil, rotate: nil, anchor: nil)
    }

    public static func position(_ position: Position) -> Self {
        .position(.position(position), nil)
    }

    public static func percentage(_ x: Percentage, _ y: Percentage) -> Self {

        .position(.percentage(x), .percent(y))
    }
}
