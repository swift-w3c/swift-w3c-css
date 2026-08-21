public import W3C_CSS_Images
public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum ListStyleImage: Property {

    case none

    case image(Image)

    case global(Global)
}

extension ListStyleImage {
    public static let property: String = "list-style-image"

    public var description: String {
        switch self {
        case .none:
            return "none"

        case .image(let image):
            return image.description

        case .global(let global):
            return global.description
        }
    }
}

extension ListStyleImage {

    public static func url(_ url: Url) -> ListStyleImage {
        return .image(.url(url))
    }

    public static func linearGradient(_ stops: [W3C_CSS_Values.Color]) -> ListStyleImage {
        return .image(.linearGradient(stops))
    }
}
