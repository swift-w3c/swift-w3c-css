public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum BorderWidth: Property {

    case values(Values)

    case global(Global)

}
extension BorderWidth {

    public struct Values: Sendable, Hashable, CustomStringConvertible {

        public let top: Width

        public let right: Width

        public let bottom: Width

        public let left: Width

        private let pattern: Pattern

        public init(_ width: Width) {
            self.top = width
            self.right = width
            self.bottom = width
            self.left = width
            self.pattern = .all
        }

        public init(vertical: Width, horizontal: Width) {
            self.top = vertical
            self.right = horizontal
            self.bottom = vertical
            self.left = horizontal
            self.pattern = .verticalHorizontal
        }

        public init(top: Width, horizontal: Width, bottom: Width) {
            self.top = top
            self.right = horizontal
            self.bottom = bottom
            self.left = horizontal
            self.pattern = .topHorizontalBottom
        }

        public init(_ top: Width, _ right: Width, _ bottom: Width, _ left: Width) {
            self.top = top
            self.right = right
            self.bottom = bottom
            self.left = left
            self.pattern = .fourSides
        }
    }
}

extension BorderWidth.Values {

    private enum Pattern {
        case all
        case verticalHorizontal
        case topHorizontalBottom
        case fourSides
    }
}

extension BorderWidth.Values {

    public var description: String {
        switch pattern {
        case .all:
            return top.description

        case .verticalHorizontal:
            return "\(top.description) \(right.description)"

        case .topHorizontalBottom:
            return "\(top.description) \(right.description) \(bottom.description)"

        case .fourSides:
            return
                "\(top.description) \(right.description) \(bottom.description) \(left.description)"
        }
    }
}
extension BorderWidth {

    public enum Width: Sendable, Hashable, CustomStringConvertible, LengthConvertible {

        case thin

        case medium

        case thick

        case length(Length)
    }
}

extension BorderWidth.Width {

    public var description: String {
        switch self {
        case .thin:
            return "thin"

        case .medium:
            return "medium"

        case .thick:
            return "thick"

        case .length(let length):
            return length.description
        }
    }
}

extension BorderWidth {
    public static let property: String = "border-width"

    public init(_ width: Width) {
        self = .values(.init(width))
    }

    public init(vertical: Width, horizontal: Width) {
        self = .values(.init(vertical, vertical, vertical, vertical))
    }

    public init(top: Width, horizontal: Width, bottom: Width) {
        self = .values(.init(top: top, horizontal: horizontal, bottom: bottom))
    }

    public init(_ top: Width, _ right: Width, _ bottom: Width, _ left: Width) {
        self = .values(.init(top, right, bottom, left))
    }
}

extension BorderWidth: LengthConvertible {
    public static func length(_ length: Length) -> BorderWidth {
        .values(.init(.init(length)))
    }
}

extension BorderWidth: CustomStringConvertible {

    public var description: String {
        switch self {
        case .values(let values):
            return values.description

        case .global(let global):
            return global.description
        }
    }
}

extension BorderWidth {

    public static let `default` = BorderWidth(.medium)

    public static let thin = BorderWidth(.thin)

    public static let medium = BorderWidth(.medium)

    public static let thick = BorderWidth(.thick)
}

extension BorderBottomWidth: LengthConvertible {
    public static func length(_ length: Length) -> BorderBottomWidth {
        .width(.values(.init(.length(length))))
    }
}
