public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum ImageOrientation: Property {

    case none

    case fromImage

    case angle(Angle, flip: Bool)

    case global(Global)
}

extension ImageOrientation {
    public static let property: String = "image-orientation"

    public var description: String {
        switch self {
        case .none:
            return "none"

        case .fromImage:
            return "from-image"

        case .angle(let angle, let flip):
            return flip ? "\(angle) flip" : angle.description

        case .global(let global):
            return global.description
        }
    }
}

extension ImageOrientation {

    public static var rotate90: ImageOrientation {
        .angle(.deg(90), flip: false)
    }

    public static var rotate180: ImageOrientation {
        .angle(.deg(180), flip: false)
    }

    public static var rotate270: ImageOrientation {
        .angle(.deg(270), flip: false)
    }

    public static var rotate90Flip: ImageOrientation {
        .angle(.deg(90), flip: true)
    }

    public static var flip: ImageOrientation {
        .angle(.deg(0), flip: true)
    }
}
