public import W3C_CSS_Shared
import W3C_CSS_Values

public enum BackgroundOrigin: Property {

    case borderBox

    case paddingBox

    case contentBox

    case multiple([BackgroundOrigin])

    case global(Global)
}

extension BackgroundOrigin {
    public static let property: String = "background-origin"
}

extension BackgroundOrigin: CustomStringConvertible {

    public var description: String {
        switch self {
        case .borderBox:
            return "border-box"

        case .paddingBox:
            return "padding-box"

        case .contentBox:
            return "content-box"

        case .multiple(let origins):
            return origins.map { $0.description }.joined(separator: ", ")

        case .global(let global):
            return global.description
        }
    }
}

extension BackgroundOrigin {

    public static let `default` = BackgroundOrigin.paddingBox

    public static func values(_ origins: [BackgroundOrigin]) -> BackgroundOrigin {
        if origins.count == 1, case let origin = origins[0] {
            return origin
        }
        return .multiple(origins)
    }

    public static func values(_ origins: BackgroundOrigin...) -> BackgroundOrigin {
        values(origins)
    }
}
