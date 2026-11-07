public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum TextShadow: Property {

    case none

    case shadow(TextShadowValue)

    case shadows([TextShadowValue])

    case global(Global)

    public init(_ shadow: TextShadowValue) {
        self = .shadow(shadow)
    }

    public init(_ shadows: [TextShadowValue]) {
        if shadows.isEmpty {
            self = .none
        } else if shadows.count == 1 {
            self = .shadow(shadows[0])
        } else {
            self = .shadows(shadows)
        }
    }

    public init(_ shadows: TextShadowValue...) {
        self.init(shadows)
    }
}

extension TextShadow {
    public static let property: String = "text-shadow"
}

extension TextShadow {

    public static func shadow(
        offsetX: Double,
        offsetY: Double,
        blurRadius: Double? = nil,
        color: Color? = nil
    ) -> TextShadow {
        .shadow(
            TextShadowValue(
                offsetX: .px(offsetX),
                offsetY: .px(offsetY),
                blurRadius: blurRadius.map { .px($0) },
                color: color
            )
        )
    }

}

public struct TextShadowValue: Sendable, Hashable {

    public var offsetX: Length

    public var offsetY: Length

    public var blurRadius: Length?

    public var color: Color?

    public init(offsetX: Length, offsetY: Length, blurRadius: Length? = nil, color: Color? = nil) {
        self.offsetX = offsetX
        self.offsetY = offsetY
        self.blurRadius = blurRadius
        self.color = color
    }
}

extension TextShadowValue: CustomStringConvertible {

    public var description: String {
        var result = ""

        result += "\(offsetX) \(offsetY)"

        if let blurRadius {
            result += " \(blurRadius)"
        }

        if let color {
            result += " \(color)"
        }

        return result
    }
}

extension TextShadow: CustomStringConvertible {

    public var description: String {
        switch self {
        case .none:
            return "none"

        case .shadow(let shadow):
            return shadow.description

        case .shadows(let shadows):
            return shadows.map { $0.description }.joined(separator: ", ")

        case .global(let global):
            return global.description
        }
    }
}
