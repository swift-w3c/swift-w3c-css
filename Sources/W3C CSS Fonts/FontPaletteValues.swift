import ASCII
import W3C_CSS_Shared
public import W3C_CSS_Syntax
public import W3C_CSS_Values

public struct FontPaletteValues: AtRule {
    public var rawValue: String
    private var identifier: String
    private var descriptors: [String: String] = [:]

    public init(rawValue: String) {
        self.rawValue = rawValue

        var cleaned = rawValue
        if cleaned.hasPrefix("@font-palette-values") {
            cleaned = String(cleaned.dropFirst(20))
        }

        while cleaned.first?.isWhitespace == true { cleaned.removeFirst() }
        while cleaned.last?.isWhitespace == true { cleaned.removeLast() }

        if let endIndex = cleaned.firstIndex(where: { $0.isWhitespace || $0 == "{" }) {
            self.identifier = String(cleaned[..<endIndex])
        } else {
            self.identifier = cleaned
        }
    }

    public init(_ identifier: String) {
        self.identifier = identifier
        self.rawValue = "@font-palette-values \(identifier) {}"
    }
}

extension FontPaletteValues {
    public static let identifier: String = "font-palette-values"

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

    public func fontFamily(_ family: String) -> FontPaletteValues {
        var palette = self
        palette.descriptors["font-family"] = "\"\(family)\""
        palette.updateRawValue()
        return palette
    }

    public func basePalette(_ index: Int) -> FontPaletteValues {
        var palette = self
        palette.descriptors["base-palette"] = String(index)
        palette.updateRawValue()
        return palette
    }

    public func basePalette(_ name: String) -> FontPaletteValues {
        var palette = self
        palette.descriptors["base-palette"] = name
        palette.updateRawValue()
        return palette
    }

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
