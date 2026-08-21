public import W3C_CSS_Shared

public enum MixBlendMode: Property {

    case normal

    case multiply

    case screen

    case overlay

    case darken

    case lighten

    case colorDodge

    case colorBurn

    case hardLight

    case softLight

    case difference

    case exclusion

    case hue

    case saturation

    case color

    case luminosity

    case plusDarker

    case plusLighter

    case global(Global)
}

extension MixBlendMode {
    public static let property: String = "mix-blend-mode"
}

extension MixBlendMode: CustomStringConvertible {

    public var description: String {
        switch self {
        case .normal:
            "normal"

        case .multiply:
            "multiply"

        case .screen:
            "screen"

        case .overlay:
            "overlay"

        case .darken:
            "darken"

        case .lighten:
            "lighten"

        case .colorDodge:
            "color-dodge"

        case .colorBurn:
            "color-burn"

        case .hardLight:
            "hard-light"

        case .softLight:
            "soft-light"

        case .difference:
            "difference"

        case .exclusion:
            "exclusion"

        case .hue:
            "hue"

        case .saturation:
            "saturation"

        case .color:
            "color"

        case .luminosity:
            "luminosity"

        case .plusDarker:
            "plus-darker"

        case .plusLighter:
            "plus-lighter"

        case .global(let global):
            global.description
        }
    }
}

extension MixBlendMode {

    public init(_ blendMode: BlendMode) {
        switch blendMode {
        case .normal: self = .normal
        case .multiply: self = .multiply
        case .screen: self = .screen
        case .overlay: self = .overlay
        case .darken: self = .darken
        case .lighten: self = .lighten
        case .colorDodge: self = .colorDodge
        case .colorBurn: self = .colorBurn
        case .hardLight: self = .hardLight
        case .softLight: self = .softLight
        case .difference: self = .difference
        case .exclusion: self = .exclusion
        case .hue: self = .hue
        case .saturation: self = .saturation
        case .color: self = .color
        case .luminosity: self = .luminosity
        }
    }
}
