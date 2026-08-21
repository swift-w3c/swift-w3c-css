import W3C_CSS_Shared

public indirect enum Color: Sendable, Hashable {

    case named(NamedColor)

    case hex(HexColor)

    case rgb(Int, Int, Int)

    case rgba(Int, Int, Int, Double)

    case hsl(Hue, Double, Double)

    case hsla(Hue, Double, Double, Double)

    case hwb(Hue, Double, Double)

    case lab(Double, Double, Double)

    case lch(Double, Double, Double)

    case oklab(Double, Double, Double)

    case oklch(Double, Double, Double)

    case mix(ColorInterpolationMethod, Color, Color, Double? = nil)

    case system(SystemColor)

    case currentColor

    case transparent

}

extension Color: CustomStringConvertible {

    public var description: String {
        switch self {
        case .named(let name):
            return name.description

        case .hex(let hex):
            return hex.description

        case .rgb(let r, let g, let b):
            return "rgb(\(r), \(g), \(b))"

        case .rgba(let r, let g, let b, let a):
            return "rgba(\(r), \(g), \(b), \(a.formatted(.number)))"

        case .hsl(let h, let s, let l):
            return "hsl(\(h), \(s.formatted(.number))%, \(l.formatted(.number))%)"

        case .hsla(let h, let s, let l, let a):
            return
                "hsla(\(h), \(s.formatted(.number))%, \(l.formatted(.number))%, \(a.formatted(.number)))"

        case .hwb(let h, let w, let b):
            return "hwb(\(h) \(w.formatted(.number))% \(b.formatted(.number))%)"

        case .lab(let l, let a, let b):
            return "lab(\(l.formatted(.number))% \(a.formatted(.number)) \(b.formatted(.number)))"

        case .lch(let l, let c, let h):
            return "lch(\(l.formatted(.number))% \(c.formatted(.number)) \(h.formatted(.number)))"

        case .oklab(let l, let a, let b):
            return "oklab(\(l.formatted(.number)) \(a.formatted(.number)) \(b.formatted(.number)))"

        case .oklch(let l, let c, let h):
            return "oklch(\(l.formatted(.number)) \(c.formatted(.number)) \(h.formatted(.number)))"

        case .mix(let method, let color1, let color2, let percentage):
            if let percentage {
                return
                    "color-mix(\(method), \(color1), \(color2) \(percentage.formatted(.number))%)"
            } else {
                return "color-mix(\(method), \(color1), \(color2))"
            }

        case .system(let color):
            return color.description

        case .currentColor:
            return "currentColor"

        case .transparent:
            return "transparent"
        }
    }
}

extension Color {

    public static func hex(_ hex: String) -> Color {
        return .hex(HexColor(hex))
    }

    public static func rgb(red: Int, green: Int, blue: Int) -> Color {
        return .rgb(red, green, blue)
    }

    public static func rgba(red: Int, green: Int, blue: Int, alpha: Double) -> Color {
        return .rgba(red, green, blue, alpha)
    }

    public static func hsl(hue: Hue, saturation: Double, lightness: Double) -> Color {
        return .hsl(hue, saturation, lightness)
    }

    public static func hsla(hue: Hue, saturation: Double, lightness: Double, alpha: Double) -> Color
    {
        return .hsla(hue, saturation, lightness, alpha)
    }

    public static func hwb(hue: Hue, whiteness: Double, blackness: Double) -> Color {
        return .hwb(hue, whiteness, blackness)
    }

    public static func lab(lightness: Double, aAxis: Double, bAxis: Double) -> Color {
        return .lab(lightness, aAxis, bAxis)
    }

    public static func lch(lightness: Double, chroma: Double, hue: Double) -> Color {
        return .lch(lightness, chroma, hue)
    }

    public static func oklab(lightness: Double, aAxis: Double, bAxis: Double) -> Color {
        return .oklab(lightness, aAxis, bAxis)
    }

    public static func oklch(lightness: Double, chroma: Double, hue: Double) -> Color {
        return .oklch(lightness, chroma, hue)
    }
}
