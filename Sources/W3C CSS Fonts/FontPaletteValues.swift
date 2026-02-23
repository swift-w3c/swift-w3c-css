public import ASCII
public import W3C_CSS_Shared
public import W3C_CSS_Syntax
public import W3C_CSS_Values

/// Represents a CSS @font-palette-values at-rule.
///
/// The @font-palette-values CSS at-rule allows you to customize the default values
/// of font-palette created by the font-maker.
///
/// Examples:
/// ```swift
/// // Simple palette with font family
/// FontPaletteValues("--Grayscale")
///     .fontFamily("Bixa Color")
///
/// // Using a specific base palette
/// FontPaletteValues("--Alternate")
///     .fontFamily("Bixa Color")
///     .basePalette(2)
///
/// // Overriding colors
/// FontPaletteValues("--Custom")
///     .fontFamily("Bungee Spice")
///     .overrideColors([
///         (0, Color.hex("#00ffbb")),
///         (1, Color.hex("#007744"))
///     ])
///
/// // Complete customization
/// FontPaletteValues("--BrandColors")
///     .fontFamily("Rocher Color")
///     .basePalette(3)
///     .overrideColors([
///         (0, Color.hex("#3366CC")),
///         (1, Color.hex("#CC3366")),
///         (2, Color.hex("#66CC33"))
///     ])
/// ```
public struct FontPaletteValues: AtRule {
    public static let identifier: String = "font-palette-values"

    public var rawValue: String
    private var identifier: String
    private var descriptors: [String: String] = [:]

    public init(rawValue: String) {
        self.rawValue = rawValue

        // Extract identifier from rawValue using standard utilities
        // Parse "@font-palette-values identifier {" to extract "identifier"
        var cleaned = rawValue
        if cleaned.hasPrefix("@font-palette-values") {
            cleaned = String(cleaned.dropFirst(20))
        }

        // Trim whitespace using INCITS 4-1986
        cleaned = cleaned.trimming(.ascii.whitespaces)

        // Extract identifier until whitespace or '{'
        if let endIndex = cleaned.firstIndex(where: { $0.ascii.isWhitespace || $0 == "{" }) {
            self.identifier = String(cleaned[..<endIndex])
        } else {
            self.identifier = cleaned
        }
    }

    /// Creates a font palette values rule with the specified identifier.
    ///
    /// - Parameter identifier: The palette identifier, which should start with `--`.
    public init(_ identifier: String) {
        self.identifier = identifier
        self.rawValue = "@font-palette-values \(identifier) {}"
    }

    /// Updates the raw value based on the current descriptors.
    private mutating func updateRawValue() {
        let descriptorString = descriptors.map { key, value in
            "  \(key): \(value);"
        }.joined(separator: "\n")

        if descriptorString.isEmpty {
            rawValue = "@font-palette-values \(identifier) {}"
        } else {
            rawValue = "@font-palette-values \(identifier) {\n\(descriptorString)\n}"
        }
    }

    /// Sets the font-family descriptor.
    ///
    /// - Parameter family: The name of the font family.
    /// - Returns: An updated FontPaletteValues instance.
    public func fontFamily(_ family: String) -> FontPaletteValues {
        var palette = self
        palette.descriptors["font-family"] = "\"\(family)\""
        palette.updateRawValue()
        return palette
    }

    /// Sets the base-palette descriptor.
    ///
    /// - Parameter index: The index of the base palette to use.
    /// - Returns: An updated FontPaletteValues instance.
    public func basePalette(_ index: Int) -> FontPaletteValues {
        var palette = self
        palette.descriptors["base-palette"] = String(index)
        palette.updateRawValue()
        return palette
    }

    /// Sets the base-palette descriptor using a name.
    ///
    /// - Parameter name: The name of the base palette to use.
    /// - Returns: An updated FontPaletteValues instance.
    public func basePalette(_ name: String) -> FontPaletteValues {
        var palette = self
        palette.descriptors["base-palette"] = name
        palette.updateRawValue()
        return palette
    }

    /// Sets the override-colors descriptor.
    ///
    /// - Parameter colors: An array of tuples containing color indices and values.
    /// - Returns: An updated FontPaletteValues instance.
    public func overrideColors(_ colors: [(Int, Color)]) -> FontPaletteValues {
        var palette = self
        let colorString =
            colors
            .map { "\($0.0) \($0.1)" }
            .joined(separator: ",\n    ")

        if !colorString.isEmpty {
            palette.descriptors["override-colors"] = "\n    \(colorString)"
        }

        palette.updateRawValue()
        return palette
    }
}
