public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum FontSmooth: Property {

    case auto

    case never

    case always

    case size(Length)

    case global(Global)
}

extension FontSmooth {
    public static let property: String = "font-smooth"

    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .never:
            return "never"

        case .always:
            return "always"

        case .size(let length):
            return length.description

        case .global(let value):
            return value.description
        }
    }
}

public enum WebkitFontSmoothing: Property {

    case auto

    case none

    case antialiased

    case subpixelAntialiased

    case global(Global)
}

extension WebkitFontSmoothing {
    public static let property: String = "-webkit-font-smoothing"

    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .none:
            return "none"

        case .antialiased:
            return "antialiased"

        case .subpixelAntialiased:
            return "subpixel-antialiased"

        case .global(let value):
            return value.description
        }
    }
}

public enum MozOsxFontSmoothing: Property {

    case auto

    case grayscale

    case global(Global)
}

extension MozOsxFontSmoothing {
    public static let property: String = "-moz-osx-font-smoothing"

    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .grayscale:
            return "grayscale"

        case .global(let value):
            return value.description
        }
    }
}
