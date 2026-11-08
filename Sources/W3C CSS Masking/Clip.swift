public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum Clip: Property {

    case auto

    case rect(ClipRect)

    case global(Global)
}

extension Clip {
    public static let property: String = "clip"
}

extension ClipValue: CustomStringConvertible {
    public var description: String {
        switch self {
        case .length(let length):
            return length.description

        case .auto:
            return "auto"
        }
    }
}

extension ClipRect: CustomStringConvertible {
    public var description: String {
        "rect(\(top), \(right), \(bottom), \(left))"
    }
}

extension Clip: CustomStringConvertible {
    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .rect(let rect):
            return rect.description

        case .global(let global):
            return global.description
        }
    }
}

extension Clip {

    public static func rect(
        top: ClipValue,
        right: ClipValue,
        bottom: ClipValue,
        left: ClipValue
    ) -> Clip {
        .rect(ClipRect(top: top, right: right, bottom: bottom, left: left))
    }

    public static func rect(top: Double, right: Double, bottom: Double, left: Double) -> Clip {
        .rect(ClipRect(top: top, right: right, bottom: bottom, left: left))
    }
}
