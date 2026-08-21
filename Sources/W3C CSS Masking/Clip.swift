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

public enum ClipValue: Sendable, Hashable, LengthConvertible {

    case length(Length)

    case auto
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
