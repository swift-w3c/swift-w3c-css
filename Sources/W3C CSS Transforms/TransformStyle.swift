public import W3C_CSS_Shared

public enum TransformStyle: Property {

    case flat

    case preserve3D

    case global(Global)
}

extension TransformStyle {
    public static let property: String = "transform-style"
}

extension TransformStyle: CustomStringConvertible {

    public var description: String {
        switch self {
        case .flat:
            return "flat"

        case .preserve3D:
            return "preserve-3d"

        case .global(let global):
            return global.description
        }
    }
}

extension TransformStyle {

    public static let defaultValue: TransformStyle = .flat

    public static func create3DScene() -> TransformStyle {
        .preserve3D
    }

    public static func flatten() -> TransformStyle {
        .flat
    }
}
