public import W3C_CSS_Shared
public import W3C_CSS_Text
import W3C_CSS_Values

public enum Font: Property {

    case style(Style?, Variant?, Weight?, FontFamily?, Size, LineHeight?)

    case custom(FontFamily?, Size, weight: Weight? = nil, style: Style? = nil)

    case caption, icon, menu, messageBox, smallCaption, statusBar

    case global(Global)
}

extension Font {
    public static let property: String = "font"

    public static func system(size: Size) -> Font {
        .custom(.generic(.systemUi), size)
    }

    public static func custom(_ family: String, size: Size) -> Font {
        .custom(.family(.specific(family)), size)
    }

    public var description: String {
        switch self {
        case .style(let style, let variant, let weight, let family, let size, let lineHeight):
            var components: [String] = []

            if let style {
                components.append(style.description)
            }

            if let variant {
                components.append(variant.rawValue)
            }

            if let weight {
                components.append(weight.description)
            }

            components.append(size.description)

            if let lineHeight {
                components[components.count - 1] += "/\(lineHeight)"
            }

            if let family {
                components.append(family.description)
            }

            return components.joined(separator: " ")

        case .custom(let family, let size, let weight, let style):
            var components: [String] = []

            if let style {
                components.append(style.description)
            }

            if let weight {
                components.append(weight.description)
            }

            components.append(size.description)

            if let family {
                components.append(family.description)
            }

            return components.joined(separator: " ")

        case .caption:
            return "caption"

        case .icon:
            return "icon"

        case .menu:
            return "menu"

        case .messageBox:
            return "message-box"

        case .smallCaption:
            return "small-caption"

        case .statusBar:
            return "status-bar"

        case .global(let value):
            return value.description
        }
    }

    public typealias Style = FontStyle

    public enum Variant: String, Sendable, Hashable {

        case normal

        case smallCaps = "small-caps"
    }

    public typealias Weight = FontWeight

    public typealias Size = FontSize

    public typealias Stretch = FontStretch
}
