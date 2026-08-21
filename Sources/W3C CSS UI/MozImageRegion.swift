public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum MozImageRegion: Property {

    case auto

    case rect(top: Length, right: Length, bottom: Length, left: Length)

    case global(Global)
}

extension MozImageRegion {
    public static let property: String = "moz-image-region"

    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .rect(let top, let right, let bottom, let left):
            return
                "rect(\(top.description), \(right.description), \(bottom.description), \(left.description))"

        case .global(let global):
            return global.description
        }
    }
}

extension MozImageRegion {

    public static func pxRect(
        top: Double,
        right: Double,
        bottom: Double,
        left: Double
    ) -> MozImageRegion {
        .rect(top: .px(top), right: .px(right), bottom: .px(bottom), left: .px(left))
    }
}
