public import W3C_CSS_Values

public enum ColorValidation {}

extension ColorValidation {

    public static func validateRGB(
        _ red: Int,
        _ green: Int,
        _ blue: Int
    ) -> (red: Int, green: Int, blue: Int) {
        return (
            min(255, max(0, red)),
            min(255, max(0, green)),
            min(255, max(0, blue))
        )
    }

    public static func validateRGBA(
        _ red: Int,
        _ green: Int,
        _ blue: Int,
        _ alpha: Double
    ) -> (red: Int, green: Int, blue: Int, alpha: Double) {
        return (
            min(255, max(0, red)),
            min(255, max(0, green)),
            min(255, max(0, blue)),
            min(1.0, max(0.0, alpha))
        )
    }

    public static func validateHSL(
        _ hue: Hue,
        _ saturation: Double,
        _ lightness: Double
    ) -> (hue: Hue, saturation: Double, lightness: Double) {
        return (
            hue,
            min(100, max(0, saturation)),
            min(100, max(0, lightness))
        )
    }

    public static func validateHSLA(
        _ hue: Hue,
        _ saturation: Double,
        _ lightness: Double,
        _ alpha: Double
    ) -> (hue: Hue, saturation: Double, lightness: Double, alpha: Double) {
        return (
            hue,
            min(100, max(0, saturation)),
            min(100, max(0, lightness)),
            min(1.0, max(0.0, alpha))
        )
    }

    public static func validateHWB(
        _ hue: Hue,
        _ whiteness: Double,
        _ blackness: Double
    ) -> (hue: Hue, whiteness: Double, blackness: Double) {
        return (
            hue,
            min(100, max(0, whiteness)),
            min(100, max(0, blackness))
        )
    }

    public static func validateOklch(
        _ lightness: Double,
        _ chroma: Double,
        _ hue: Double
    ) -> (lightness: Double, chroma: Double, hue: Double) {
        return (
            min(1.0, max(0.0, lightness)),
            max(0, chroma),
            hue.truncatingRemainder(dividingBy: 360)
        )
    }
}

extension Color {

    public static func validatedRGB(_ red: Int, _ green: Int, _ blue: Int) -> Color {
        let validated = ColorValidation.validateRGB(red, green, blue)
        return .rgb(validated.red, validated.green, validated.blue)
    }

    public static func validatedRGBA(
        _ red: Int,
        _ green: Int,
        _ blue: Int,
        _ alpha: Double
    ) -> Color {
        let validated = ColorValidation.validateRGBA(red, green, blue, alpha)
        return .rgba(validated.red, validated.green, validated.blue, validated.alpha)
    }

    public static func validatedHSL(_ hue: Hue, _ saturation: Double, _ lightness: Double) -> Color
    {
        let validated = ColorValidation.validateHSL(hue, saturation, lightness)
        return .hsl(validated.hue, validated.saturation, validated.lightness)
    }

    public static func validatedHSLA(
        _ hue: Hue,
        _ saturation: Double,
        _ lightness: Double,
        _ alpha: Double
    ) -> Color {
        let validated = ColorValidation.validateHSLA(hue, saturation, lightness, alpha)
        return .hsla(validated.hue, validated.saturation, validated.lightness, validated.alpha)
    }

    public static func validatedHWB(_ hue: Hue, _ whiteness: Double, _ blackness: Double) -> Color {
        let validated = ColorValidation.validateHWB(hue, whiteness, blackness)
        return .hwb(validated.hue, validated.whiteness, validated.blackness)
    }

    public static func validatedOklch(
        _ lightness: Percentage,
        _ chroma: Percentage,
        _ hue: Percentage
    ) -> Color {
        let validated = ColorValidation.validateOklch(lightness.value, chroma.value, hue.value)
        return .oklch(.init(validated.lightness), .init(validated.chroma), .init(validated.hue))
    }
}
