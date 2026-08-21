import W3C_CSS_Shared
public import W3C_CSS_Syntax
public import W3C_CSS_Values

public struct FontFace: AtRule {
    public var rawValue: String
    private var descriptors: [String: String] = [:]

    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    public init() {
        self.rawValue = "@font-face {}"
    }
}

extension FontFace {
    public static let identifier: String = "font-face"

    private mutating func updateRawValue() {
        let descriptorString = descriptors.map { key, value in
            "  \(key): \(value);"
        }.joined(separator: "\n")

        if descriptorString.isEmpty {
            rawValue = "@font-face {}"
        } else {
            rawValue = "@font-face {\n\(descriptorString)\n}"
        }
    }

    public func fontFamily(_ name: String) -> FontFace {
        var fontFace = self
        fontFace.descriptors["font-family"] = "\"\(name)\""
        fontFace.updateRawValue()
        return fontFace
    }

    public func src(_ sources: [Source]) -> FontFace {
        var fontFace = self
        fontFace.descriptors["src"] = sources.map { $0.description }.joined(separator: ",\n    ")
        fontFace.updateRawValue()
        return fontFace
    }

    public func fontDisplay(_ display: FontDisplay) -> FontFace {
        var fontFace = self
        fontFace.descriptors["font-display"] = display.rawValue
        fontFace.updateRawValue()
        return fontFace
    }

    public func fontWeight(_ weight: FontWeight) -> FontFace {
        var fontFace = self
        fontFace.descriptors["font-weight"] = weight.description
        fontFace.updateRawValue()
        return fontFace
    }

    public func fontStyle(_ style: FontStyle) -> FontFace {
        var fontFace = self
        fontFace.descriptors["font-style"] = style.description
        fontFace.updateRawValue()
        return fontFace
    }

    public func fontStretch(_ stretch: FontStretch) -> FontFace {
        var fontFace = self
        fontFace.descriptors["font-stretch"] = stretch.description
        fontFace.updateRawValue()
        return fontFace
    }

    public func unicodeRange(_ ranges: [String]) -> FontFace {
        var fontFace = self
        fontFace.descriptors["unicode-range"] = ranges.joined(separator: ", ")
        fontFace.updateRawValue()
        return fontFace
    }

    public func fontFeatureSettings(_ settings: [(String, Int)]) -> FontFace {
        var fontFace = self
        let settingsString = settings.map { "\"\($0.0)\" \($0.1)" }.joined(separator: ", ")
        fontFace.descriptors["font-feature-settings"] = settingsString
        fontFace.updateRawValue()
        return fontFace
    }

    public func fontVariationSettings(_ settings: [(String, Int)]) -> FontFace {
        var fontFace = self
        let settingsString = settings.map { "\"\($0.0)\" \($0.1)" }.joined(separator: ", ")
        fontFace.descriptors["font-variation-settings"] = settingsString
        fontFace.updateRawValue()
        return fontFace
    }

    public func ascentOverride(_ value: Percentage) -> FontFace {
        var fontFace = self
        fontFace.descriptors["ascent-override"] = value.description
        fontFace.updateRawValue()
        return fontFace
    }

    public func descentOverride(_ value: Percentage) -> FontFace {
        var fontFace = self
        fontFace.descriptors["descent-override"] = value.description
        fontFace.updateRawValue()
        return fontFace
    }

    public func lineGapOverride(_ value: Percentage) -> FontFace {
        var fontFace = self
        fontFace.descriptors["line-gap-override"] = value.description
        fontFace.updateRawValue()
        return fontFace
    }

    public func sizeAdjust(_ value: Percentage) -> FontFace {
        var fontFace = self
        fontFace.descriptors["size-adjust"] = value.description
        fontFace.updateRawValue()
        return fontFace
    }
}

extension FontFace {

    public enum Source: CustomStringConvertible {

        case local(String)

        case url(String, format: String? = nil, tech: String? = nil)
    }

    public enum FontDisplay: String, Hashable, Sendable {

        case auto

        case block

        case swap

        case fallback

        case optional
    }

    public enum FontWeight: CustomStringConvertible, Hashable, Sendable {

        case value(Int)

        case range(Int, Int)

        case normal

        case bold
    }

    public enum FontStyle: CustomStringConvertible, Hashable, Sendable {

        case normal

        case italic

        case oblique(Int? = nil)

        case obliqueRange(Int, Int)
    }

    public enum FontStretch: CustomStringConvertible, Hashable, Sendable {

        case value(Int)

        case range(Int, Int)

        case normal

        case ultraCondensed

        case extraCondensed

        case condensed

        case semiCondensed

        case semiExpanded

        case expanded

        case extraExpanded

        case ultraExpanded
    }
}

extension FontFace.Source {
    public var description: String {
        switch self {
        case .local(let name):
            return "local(\"\(name)\")"

        case .url(let url, let format, let tech):
            var result = "url(\"\(url)\")"
            if let format {
                result += " format(\"\(format)\")"
            }
            if let tech {
                result += " tech(\(tech))"
            }
            return result
        }
    }
}

extension FontFace.FontWeight {
    public var description: String {
        switch self {
        case .value(let value):
            return String(value)

        case .range(let min, let max):
            return "\(min) \(max)"

        case .normal:
            return "normal"

        case .bold:
            return "bold"
        }
    }
}

extension FontFace.FontStyle {
    public var description: String {
        switch self {
        case .normal:
            return "normal"

        case .italic:
            return "italic"

        case .oblique(let angle):
            if let angle {
                return "oblique \(angle)deg"
            }
            return "oblique"

        case .obliqueRange(let min, let max):
            return "oblique \(min)deg \(max)deg"
        }
    }
}

extension FontFace.FontStretch {
    public var description: String {
        switch self {
        case .value(let value):
            return "\(value)%"

        case .range(let min, let max):
            return "\(min)% \(max)%"

        case .normal:
            return "normal"

        case .ultraCondensed:
            return "ultra-condensed"

        case .extraCondensed:
            return "extra-condensed"

        case .condensed:
            return "condensed"

        case .semiCondensed:
            return "semi-condensed"

        case .semiExpanded:
            return "semi-expanded"

        case .expanded:
            return "expanded"

        case .extraExpanded:
            return "extra-expanded"

        case .ultraExpanded:
            return "ultra-expanded"
        }
    }
}
