public import W3C_CSS_Shared
import W3C_CSS_Values

public enum BackgroundBlendMode: Property {

    case single(BlendMode)

    case multiple([BlendMode])

    case global(Global)

    public init(_ mode: BlendMode) {
        self = .single(mode)
    }
}

extension BackgroundBlendMode {
    public static let property: String = "background-blend-mode"
}

extension BackgroundBlendMode: CustomStringConvertible {

    public var description: String {
        switch self {
        case .single(let mode):
            return mode.description

        case .multiple(let modes):
            return modes.map { $0.description }.joined(separator: ", ")

        case .global(let global):
            return global.description
        }
    }
}

extension BackgroundBlendMode {

    public static let `default` = BackgroundBlendMode(.normal)

    public static func values(_ modes: [BlendMode]) -> BackgroundBlendMode {
        if modes.count == 1 {
            return .single(modes[0])
        }
        return .multiple(modes)
    }

    public static func values(_ modes: BlendMode...) -> BackgroundBlendMode {
        values(modes)
    }

    public static let normal = BackgroundBlendMode(.normal)

    public static let multiply = BackgroundBlendMode(.multiply)

    public static let screen = BackgroundBlendMode(.screen)

    public static let overlay = BackgroundBlendMode(.overlay)

    public static let darken = BackgroundBlendMode(.darken)

    public static let lighten = BackgroundBlendMode(.lighten)

    public static let colorDodge = BackgroundBlendMode(.colorDodge)

    public static let colorBurn = BackgroundBlendMode(.colorBurn)

    public static let hardLight = BackgroundBlendMode(.hardLight)

    public static let softLight = BackgroundBlendMode(.softLight)

    public static let difference = BackgroundBlendMode(.difference)

    public static let exclusion = BackgroundBlendMode(.exclusion)

    public static let hue = BackgroundBlendMode(.hue)

    public static let saturation = BackgroundBlendMode(.saturation)

    public static let color = BackgroundBlendMode(.color)

    public static let luminosity = BackgroundBlendMode(.luminosity)
}
