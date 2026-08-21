import W3C_CSS_Shared

public struct ColorInterpolationMethod: Sendable, Hashable, CustomStringConvertible {

    private let colorSpace: String
    private let hueMethod: String?

    public init(colorSpace: String, hueMethod: String? = nil) {
        self.colorSpace = colorSpace
        self.hueMethod = hueMethod
    }
}

extension ColorInterpolationMethod {

    public enum RectangularColorSpace: String, Sendable, Hashable, CustomStringConvertible {

        case srgb = "srgb"

        case srgbLinear = "srgb-linear"

        case displayP3 = "display-p3"

        case a98rgb = "a98-rgb"

        case prophotoRgb = "prophoto-rgb"

        case rec2020 = "rec2020"

        case lab = "lab"

        case oklab = "oklab"

        case xyz = "xyz"

        case xyzD50 = "xyz-d50"

        case xyzD65 = "xyz-d65"
    }

    public enum PolarColorSpace: String, Sendable, Hashable, CustomStringConvertible {

        case hsl

        case hwb

        case lch

        case oklch
    }

    public enum HueInterpolationMethod: String, Sendable, Hashable, CustomStringConvertible {

        case shorter = "shorter hue"

        case longer = "longer hue"

        case increasing = "increasing hue"

        case decreasing = "decreasing hue"
    }

    public static func rectangular(_ space: RectangularColorSpace) -> Self {
        Self(colorSpace: space.rawValue)
    }

    public static func polar(
        _ space: PolarColorSpace,
        _ method: HueInterpolationMethod? = nil
    ) -> Self {
        Self(colorSpace: space.rawValue, hueMethod: method?.rawValue)
    }

    public static func custom(_ profile: String) -> Self {
        Self(colorSpace: CSSString(profile).description)
    }

    public var description: String {
        if let hueMethod {
            return "in \(colorSpace) \(hueMethod)"
        } else {
            return "in \(colorSpace)"
        }
    }
}

extension ColorInterpolationMethod.RectangularColorSpace {
    public var description: String { rawValue }
}

extension ColorInterpolationMethod.PolarColorSpace {
    public var description: String { rawValue }
}

extension ColorInterpolationMethod.HueInterpolationMethod {
    public var description: String { rawValue }
}
