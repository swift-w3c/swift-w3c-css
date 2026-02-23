public import ASCII
public import W3C_CSS_Shared
public import W3C_CSS_Syntax
public import W3C_CSS_Values

/// Represents a CSS @color-profile at-rule.
///
/// The @color-profile CSS at-rule defines and names a color profile which can later
/// be used in the color() function to specify a color.
///
/// Examples:
/// ```swift
/// // Basic color profile with a source URL
/// ColorProfile("--swop5c")
///     .src("https://example.org/SWOP2006_Coated5v2.icc")
///
/// // Color profile with rendering intent
/// ColorProfile("--srgb")
///     .src("https://example.org/sRGB_ICC_v4.icc")
///     .renderingIntent(.perceptual)
/// ```
public struct ColorProfile: AtRule {
    public static let identifier: String = "color-profile"

    public var rawValue: String
    private var name: String
    private var descriptors: [String: String] = [:]

    public init(rawValue: String) {
        self.rawValue = rawValue
        // Extract name from rawValue using standard utilities
        // Parse "@color-profile name {" to extract "name"
        var cleaned = rawValue
        if cleaned.hasPrefix("@color-profile") {
            cleaned = String(cleaned.dropFirst(14))
        }

        // Trim whitespace using INCITS 4-1986
        cleaned = cleaned.trimming(.ascii.whitespaces)

        // Extract name until whitespace or '{'
        if let endIndex = cleaned.firstIndex(where: { $0.ascii.isWhitespace || $0 == "{" }) {
            self.name = String(cleaned[..<endIndex])
        } else {
            self.name = cleaned
        }
    }

    /// Creates a color profile with the specified name.
    ///
    /// - Parameter name: The name of the color profile. Must start with `--` or be `device-cmyk`.
    public init(_ name: String) {
        self.name = name
        self.rawValue = "@color-profile \(name) {}"
    }

    /// Predefined device-cmyk color profile.
    public static let deviceCMYK = ColorProfile("device-cmyk")

    /// Sets the source URL for the color profile.
    ///
    /// - Parameter url: The URL to retrieve the color profile information from.
    /// - Returns: An updated ColorProfile instance.
    public func src(_ url: Url) -> ColorProfile {
        var profile = self
        profile.descriptors["src"] = url.description
        profile.updateRawValue()
        return profile
    }

    /// Sets the rendering intent for the color profile.
    ///
    /// - Parameter intent: The rendering intent to use.
    /// - Returns: An updated ColorProfile instance.
    public func renderingIntent(_ intent: RenderingIntent) -> ColorProfile {
        var profile = self
        profile.descriptors["rendering-intent"] = intent.rawValue
        profile.updateRawValue()
        return profile
    }

    /// Updates the raw value based on the current descriptors.
    private mutating func updateRawValue() {
        let descriptorString = descriptors.map { key, value in
            "  \(key): \(value);"
        }.joined(separator: "\n")

        if descriptorString.isEmpty {
            rawValue = "@color-profile \(name) {}"
        } else {
            rawValue = "@color-profile \(name) {\n\(descriptorString)\n}"
        }
    }
}

extension ColorProfile {
    /// Represents rendering intent options for color profiles.
    public enum RenderingIntent: String, Hashable, Sendable {
        /// Media-relative colorimetric intent.
        case relativeColorimetric = "relative-colorimetric"

        /// ICC-absolute colorimetric intent.
        case absoluteColorimetric = "absolute-colorimetric"

        /// Perceptual rendering intent, often preferred for images.
        case perceptual

        /// Saturation rendering intent, preserves relative saturation.
        case saturation
    }
}
