public enum BlendMode: String, Sendable, Hashable {

    case normal

    case multiply

    case screen

    case overlay

    case darken

    case lighten

    case colorDodge = "color-dodge"

    case colorBurn = "color-burn"

    case hardLight = "hard-light"

    case softLight = "soft-light"

    case difference

    case exclusion

    case hue

    case saturation

    case color

    case luminosity
}

extension BlendMode: CustomStringConvertible {

    public var description: String {
        return rawValue
    }
}
