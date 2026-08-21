public import W3C_CSS_Values

extension Color {

    public struct Safe {}
}

extension Color.Safe {

    public static func rgb(_ red: Int, _ green: Int, _ blue: Int) -> Color {
        return Color.validatedRGB(red, green, blue)
    }

    public static func rgba(_ red: Int, _ green: Int, _ blue: Int, _ alpha: Double) -> Color {
        return Color.validatedRGBA(red, green, blue, alpha)
    }

    public static func hsl(_ hue: Hue, _ saturation: Double, _ lightness: Double) -> Color {
        return Color.validatedHSL(hue, saturation, lightness)
    }

    public static func hsla(
        _ hue: Hue,
        _ saturation: Double,
        _ lightness: Double,
        _ alpha: Double
    ) -> Color {
        return Color.validatedHSLA(hue, saturation, lightness, alpha)
    }

    public static func hwb(_ hue: Hue, _ whiteness: Double, _ blackness: Double) -> Color {
        return Color.validatedHWB(hue, whiteness, blackness)
    }

    public static func oklch(
        _ lightness: Percentage,
        _ chroma: Percentage,
        _ hue: Percentage
    ) -> Color {
        return Color.validatedOklch(lightness, chroma, hue)
    }
}
