public import W3C_CSS_Syntax

/// Represents a CSS @font-feature-values at-rule.
///
/// The @font-feature-values CSS at-rule lets you use a common name in the
/// font-variant-alternates property for features activated differently in OpenType.
/// This helps simplify CSS when using multiple fonts.
///
/// Examples:
/// ```swift
/// // Single font family with styleset
/// FontFeatureValues("Font One")
///     .styleset(["nice-style": [12]])
///
/// // Multiple font families with stylistic and swash features
/// FontFeatureValues(["Gentium", "Palatino"])
///     .stylistic(["emphasis": 1])
///     .swash(["decorated": 4])
///
/// // Complex font features with multiple types
/// FontFeatureValues("Brill")
///     .styleset(["headline": [1, 2, 3]])
///     .stylistic(["emphasis": 2])
///     .annotation(["circled": 1])
///     .ornaments(["fleurons": 5])
///     .characterVariant(["beta": (1, 2)])
/// ```
public struct FontFeatureValues: AtRule {
    public static let identifier: String = "font-feature-values"
    public var rawValue: String
    private var families: [String]
    private var blocks: [String: [String: String]] = [:]

    public init(rawValue: String) {
        self.rawValue = rawValue

        // Extract families from rawValue - simplified implementation without Foundation
        // Parse "@font-feature-values families {" to extract "families"
        var cleaned = rawValue
        if cleaned.hasPrefix("@font-feature-values") {
            cleaned = String(cleaned.dropFirst(21))  // Remove "@font-feature-values"
        }

        // Trim leading whitespace
        while cleaned.first?.isWhitespace == true {
            cleaned = String(cleaned.dropFirst())
        }

        // Extract families until '{'
        if let braceIndex = cleaned.firstIndex(of: "{") {
            var familiesString = String(cleaned[..<braceIndex])

            // Trim trailing whitespace
            while familiesString.last?.isWhitespace == true {
                familiesString = String(familiesString.dropLast())
            }

            // Split by comma and trim each family name
            let famBytes = Array(familiesString.utf8)
            var famResults: [String] = []
            var famStart = 0
            for idx in 0..<famBytes.count {
                if famBytes[idx] == 0x2C {  // ','
                    famResults.append(String(decoding: famBytes[famStart..<idx], as: UTF8.self))
                    famStart = idx &+ 1
                }
            }
            famResults.append(String(decoding: famBytes[famStart..<famBytes.count], as: UTF8.self))
            self.families = famResults.map { family in
                var trimmed = family
                while trimmed.first?.isWhitespace == true {
                    trimmed = String(trimmed.dropFirst())
                }
                while trimmed.last?.isWhitespace == true {
                    trimmed = String(trimmed.dropLast())
                }
                return trimmed
            }
        } else {
            self.families = []
        }
    }

    /// Creates a font feature values rule for a single font family.
    ///
    /// - Parameter family: The font family name.
    public init(_ family: String) {
        self.families = [family]
        self.rawValue = "@font-feature-values \(family) {}"
    }

    /// Creates a font feature values rule for multiple font families.
    ///
    /// - Parameter families: The font family names.
    public init(_ families: [String]) {
        self.families = families
        let familiesString = families.map { "\"\($0)\"" }.joined(separator: ", ")
        self.rawValue = "@font-feature-values \(familiesString) {}"
    }

    /// Updates the raw value based on the current blocks.
    private mutating func updateRawValue() {
        let familiesString = families.map { "\"\($0)\"" }.joined(separator: ", ")

        var blockStrings: [String] = []
        for (blockType, features) in blocks {
            var featureStrings: [String] = []
            for (name, value) in features {
                featureStrings.append("    \(name): \(value);")
            }

            if !featureStrings.isEmpty {
                let featureString = featureStrings.joined(separator: "\n")
                blockStrings.append("  @\(blockType) {\n\(featureString)\n  }")
            }
        }

        let blockString = blockStrings.joined(separator: "\n\n")

        if blockString.isEmpty {
            rawValue = "@font-feature-values \(familiesString) {}"
        } else {
            rawValue = "@font-feature-values \(familiesString) {\n\(blockString)\n}"
        }
    }

    /// Sets the styleset feature values.
    ///
    /// - Parameter features: A dictionary mapping feature names to values.
    /// - Returns: An updated FontFeatureValues instance.
    public func styleset(_ features: [String: [Int]]) -> FontFeatureValues {
        var fontFeatureValues = self
        for (name, values) in features {
            fontFeatureValues.blocks["styleset", default: [:]][name] = values.map(String.init)
                .joined(
                    separator: " "
                )
        }
        fontFeatureValues.updateRawValue()
        return fontFeatureValues
    }

    /// Sets the stylistic feature values.
    ///
    /// - Parameter features: A dictionary mapping feature names to values.
    /// - Returns: An updated FontFeatureValues instance.
    public func stylistic(_ features: [String: Int]) -> FontFeatureValues {
        var fontFeatureValues = self
        for (name, value) in features {
            fontFeatureValues.blocks["stylistic", default: [:]][name] = String(value)
        }
        fontFeatureValues.updateRawValue()
        return fontFeatureValues
    }

    /// Sets the swash feature values.
    ///
    /// - Parameter features: A dictionary mapping feature names to values.
    /// - Returns: An updated FontFeatureValues instance.
    public func swash(_ features: [String: Int]) -> FontFeatureValues {
        var fontFeatureValues = self
        for (name, value) in features {
            fontFeatureValues.blocks["swash", default: [:]][name] = String(value)
        }
        fontFeatureValues.updateRawValue()
        return fontFeatureValues
    }

    /// Sets the annotation feature values.
    ///
    /// - Parameter features: A dictionary mapping feature names to values.
    /// - Returns: An updated FontFeatureValues instance.
    public func annotation(_ features: [String: Int]) -> FontFeatureValues {
        var fontFeatureValues = self
        for (name, value) in features {
            fontFeatureValues.blocks["annotation", default: [:]][name] = String(value)
        }
        fontFeatureValues.updateRawValue()
        return fontFeatureValues
    }

    /// Sets the ornaments feature values.
    ///
    /// - Parameter features: A dictionary mapping feature names to values.
    /// - Returns: An updated FontFeatureValues instance.
    public func ornaments(_ features: [String: Int]) -> FontFeatureValues {
        var fontFeatureValues = self
        for (name, value) in features {
            fontFeatureValues.blocks["ornaments", default: [:]][name] = String(value)
        }
        fontFeatureValues.updateRawValue()
        return fontFeatureValues
    }

    /// Sets the character-variant feature values.
    ///
    /// - Parameter features: A dictionary mapping feature names to value tuples.
    /// - Returns: An updated FontFeatureValues instance.
    public func characterVariant(_ features: [String: (Int, Int?)]) -> FontFeatureValues {
        var fontFeatureValues = self
        for (name, values) in features {
            let valueString = values.1 != nil ? "\(values.0) \(values.1!)" : String(values.0)
            fontFeatureValues.blocks["character-variant", default: [:]][name] = valueString
        }
        fontFeatureValues.updateRawValue()
        return fontFeatureValues
    }
}
