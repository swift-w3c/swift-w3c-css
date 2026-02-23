public import W3C_CSS_Shared

/// Represents CSS color interpolation methods used in gradients and color mixing.
///
/// The `ColorInterpolationMethod` data type specifies the color space and hue interpolation
/// method to use when interpolating between colors in functions like `color-mix()`
/// and gradients.
///
/// Example:
/// ```swift
/// .backgroundImage(.linearGradient(
///     .rectangular(.oklab),
///     .toRight,
///     [.blue, .red]
/// ))
/// ```
///
/// - Note: When no interpolation method is specified, the default is typically `oklab`,
///         which provides perceptually uniform color transitions.
///
/// - SeeAlso: [MDN Web Docs on color interpolation methods](https://developer.mozilla.org/en-US/docs/Web/CSS/color-interpolation-method)
public struct ColorInterpolationMethod: Sendable, Hashable, CustomStringConvertible {
    /// Rectangular color spaces for color interpolation
    public enum RectangularColorSpace: String, Sendable, Hashable, CustomStringConvertible {
        /// The standard sRGB color space
        case srgb = "srgb"

        /// The linearized sRGB color space
        case srgbLinear = "srgb-linear"

        /// The Display P3 wide-gamut color space
        case displayP3 = "display-p3"

        /// The Adobe RGB (1998) color space
        case a98rgb = "a98-rgb"

        /// The ProPhoto RGB color space
        case prophotoRgb = "prophoto-rgb"

        /// The Rec. 2020 color space for ultra-high-definition TV
        case rec2020 = "rec2020"

        /// The CIELAB color space
        case lab = "lab"

        /// The Oklab perceptual color space
        case oklab = "oklab"

        /// The CIE XYZ color space
        case xyz = "xyz"

        /// The CIE XYZ color space with D50 white point
        case xyzD50 = "xyz-d50"

        /// The CIE XYZ color space with D65 white point
        case xyzD65 = "xyz-d65"

        public var description: String { rawValue }
    }

    /// Polar color spaces for color interpolation
    public enum PolarColorSpace: String, Sendable, Hashable, CustomStringConvertible {
        /// The HSL (Hue, Saturation, Lightness) color space
        case hsl

        /// The HWB (Hue, Whiteness, Blackness) color space
        case hwb

        /// The LCH (Lightness, Chroma, Hue) color space
        case lch

        /// The Oklch perceptual color space
        case oklch

        public var description: String { rawValue }
    }

    /// Hue interpolation methods for polar color spaces
    public enum HueInterpolationMethod: String, Sendable, Hashable, CustomStringConvertible {
        /// Follows the shorter arc around the color wheel (default)
        case shorter = "shorter hue"

        /// Follows the longer arc around the color wheel
        case longer = "longer hue"

        /// Interpolates in the direction of increasing hue values
        case increasing = "increasing hue"

        /// Interpolates in the direction of decreasing hue values
        case decreasing = "decreasing hue"

        public var description: String { rawValue }
    }

    // MARK: - Storage

    private let colorSpace: String
    private let hueMethod: String?

    // MARK: - Initialization

    /// Creates a color interpolation method with a custom color space.
    ///
    /// This initializer allows you to specify any color space, including custom
    /// `@color-profile` references using dashed-ident syntax.
    ///
    /// - Parameters:
    ///   - colorSpace: The name of the color space (e.g., "srgb", "--my-profile")
    ///   - hueMethod: Optional hue interpolation method for polar color spaces
    public init(colorSpace: String, hueMethod: String? = nil) {
        self.colorSpace = colorSpace
        self.hueMethod = hueMethod
    }

    // MARK: - Static Factory Methods

    /// Creates a color interpolation method using a rectangular color space.
    ///
    /// - Parameter space: The rectangular color space to use
    /// - Returns: A color interpolation method configured for the specified space
    public static func rectangular(_ space: RectangularColorSpace) -> Self {
        Self(colorSpace: space.rawValue)
    }

    /// Creates a color interpolation method using a polar color space.
    ///
    /// - Parameters:
    ///   - space: The polar color space to use
    ///   - method: Optional hue interpolation method (defaults to `shorter` if not specified)
    /// - Returns: A color interpolation method configured for the specified space and hue method
    public static func polar(
        _ space: PolarColorSpace,
        _ method: HueInterpolationMethod? = nil
    ) -> Self {
        Self(colorSpace: space.rawValue, hueMethod: method?.rawValue)
    }

    /// Creates a color interpolation method using a custom color profile.
    ///
    /// This method creates an interpolation method that references a custom `@color-profile`
    /// using a dashed-ident. The profile name will be automatically quoted in the CSS output.
    ///
    /// - Parameter profile: The name of the custom color profile
    /// - Returns: A color interpolation method for the custom profile
    ///
    /// Example:
    /// ```swift
    /// ColorInterpolationMethod.custom("my-profile")
    /// // Outputs: in "my-profile"
    /// ```
    public static func custom(_ profile: String) -> Self {
        Self(colorSpace: CSSString(profile).description)
    }

    // MARK: - CustomStringConvertible

    /// Converts the color interpolation method to its CSS string representation
    ///
    /// This method formats the interpolation method for use in CSS functions.
    public var description: String {
        if let hueMethod = hueMethod {
            return "in \(colorSpace) \(hueMethod)"
        } else {
            return "in \(colorSpace)"
        }
    }
}
