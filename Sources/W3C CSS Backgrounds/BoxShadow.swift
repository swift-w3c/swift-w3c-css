import W3C_CSS_Color
public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum BoxShadow: Property {

    case none

    case shadow(Shadow)

    case multiple([Shadow])

    case global(Global)

    public init(_ shadow: Shadow) {
        self = .shadow(shadow)
    }

    public init(_ shadows: [Shadow]) {
        if shadows.isEmpty {
            self = .none
        } else if shadows.count == 1 {
            self = .shadow(shadows[0])
        } else {
            self = .multiple(shadows)
        }
    }

    public init(_ shadows: Shadow...) {
        self.init(shadows)
    }
}

extension BoxShadow {
    public static let property: String = "border-shadow"

    public struct Shadow: Sendable, Hashable, CustomStringConvertible {

        public let offsetX: Length

        public let offsetY: Length

        public let blurRadius: Length?

        public let spreadRadius: Length?

        public let color: W3C_CSS_Values.Color?

        public let isInset: Bool

        public init(
            offsetX: Length,
            offsetY: Length,
            blurRadius: Length? = nil,
            spreadRadius: Length? = nil,
            color: W3C_CSS_Values.Color? = nil,
            isInset: Bool = false
        ) {
            self.offsetX = offsetX
            self.offsetY = offsetY
            self.blurRadius = blurRadius
            self.spreadRadius = spreadRadius
            self.color = color
            self.isInset = isInset
        }
    }
}

extension BoxShadow.Shadow {

    public var description: String {
        var result = ""

        if isInset {
            result += "inset "
        }

        result += "\(offsetX.description) \(offsetY.description)"

        if let blur = blurRadius {
            result += " \(blur.description)"
        }

        if let spread = spreadRadius {
            result += " \(spread.description)"
        }

        if let shadowColor = color {
            result += " \(shadowColor.description)"
        }

        return result
    }
}

extension BoxShadow: CustomStringConvertible {

    public var description: String {
        switch self {
        case .none:
            return "none"

        case .shadow(let shadow):
            return shadow.description

        case .multiple(let shadows):
            return shadows.map { $0.description }.joined(separator: ", ")

        case .global(let global):
            return global.description
        }
    }
}
