public import W3C_CSS_Shared

public enum ListStyle: Property {

    case type(ListStyleType)

    case position(ListStylePosition)

    case image(ListStyleImage)

    case combined(type: ListStyleType?, position: ListStylePosition?, image: ListStyleImage?)

    case none

    case global(Global)
}

extension ListStyle {
    public static let property: String = "list-style"

    public var description: String {
        switch self {
        case .type(let type):
            return type.description

        case .position(let position):
            return position.description

        case .image(let image):
            return image.description

        case .combined(let type, let position, let image):
            var parts: [String] = []

            if let type {
                parts.append(type.description)
            }

            if let position {
                parts.append(position.description)
            }

            if let image {
                parts.append(image.description)
            }

            return parts.isEmpty ? "initial" : parts.joined(separator: " ")

        case .none:
            return "none"

        case .global(let global):
            return global.description
        }
    }
}

extension ListStyle {

    public static func disc() -> ListStyle {
        return .type(.disc)
    }

    public static func disc(position: ListStylePosition) -> ListStyle {
        return .combined(type: .disc, position: position, image: nil)
    }

    public static func withImage(_ url: Url) -> ListStyle {
        return .image(.url(url))
    }

    public static func decimal() -> ListStyle {
        return .type(.decimal)
    }

    public static func decimal(position: ListStylePosition) -> ListStyle {
        return .combined(type: .decimal, position: position, image: nil)
    }
}
