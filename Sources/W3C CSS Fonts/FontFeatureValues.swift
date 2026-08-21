public import W3C_CSS_Syntax

public struct FontFeatureValues: AtRule {
    public var rawValue: String
    private var families: [String]
    private var blocks: [String: [String: String]] = [:]

    public init(rawValue: String) {
        self.rawValue = rawValue

        var cleaned = rawValue
        if cleaned.hasPrefix("@font-feature-values") {
            cleaned = String(cleaned.dropFirst(21))
        }

        while cleaned.first?.isWhitespace == true {
            cleaned = String(cleaned.dropFirst())
        }

        if let braceIndex = cleaned.firstIndex(of: "{") {
            var familiesString = String(cleaned[..<braceIndex])

            while familiesString.last?.isWhitespace == true {
                familiesString = String(familiesString.dropLast())
            }

            let famBytes = Array(familiesString.utf8)
            var famResults: [String] = []
            var famStart = 0
            for idx in 0..<famBytes.count {
                if famBytes[idx] == 0x2C {
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

    public init(_ family: String) {
        self.families = [family]
        self.rawValue = "@font-feature-values \(family) {}"
    }

    public init(_ families: [String]) {
        self.families = families
        let familiesString = families.map { "\"\($0)\"" }.joined(separator: ", ")
        self.rawValue = "@font-feature-values \(familiesString) {}"
    }
}

extension FontFeatureValues {
    public static let identifier: String = "font-feature-values"

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

    public func stylistic(_ features: [String: Int]) -> FontFeatureValues {
        var fontFeatureValues = self
        for (name, value) in features {
            fontFeatureValues.blocks["stylistic", default: [:]][name] = String(value)
        }
        fontFeatureValues.updateRawValue()
        return fontFeatureValues
    }

    public func swash(_ features: [String: Int]) -> FontFeatureValues {
        var fontFeatureValues = self
        for (name, value) in features {
            fontFeatureValues.blocks["swash", default: [:]][name] = String(value)
        }
        fontFeatureValues.updateRawValue()
        return fontFeatureValues
    }

    public func annotation(_ features: [String: Int]) -> FontFeatureValues {
        var fontFeatureValues = self
        for (name, value) in features {
            fontFeatureValues.blocks["annotation", default: [:]][name] = String(value)
        }
        fontFeatureValues.updateRawValue()
        return fontFeatureValues
    }

    public func ornaments(_ features: [String: Int]) -> FontFeatureValues {
        var fontFeatureValues = self
        for (name, value) in features {
            fontFeatureValues.blocks["ornaments", default: [:]][name] = String(value)
        }
        fontFeatureValues.updateRawValue()
        return fontFeatureValues
    }

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
