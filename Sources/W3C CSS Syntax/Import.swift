public import ASCII
public import W3C_CSS_Shared

/// Represents a CSS @import at-rule.
///
/// The @import CSS at-rule is used to import style rules from other stylesheets.
/// It must be defined at the top of the stylesheet, before any other at-rule
/// (except @charset and @layer) and style declarations.
///
/// Examples:
/// ```swift
/// // Simple import
/// Import("custom.css")
///
/// // Import with a URL
/// Import.url("https://example.com/styles/main.css")
///
/// // Import with a single media query
/// Import("print.css").media(Media.print)
///
/// // Import with multiple media queries
/// Import("responsive.css").media([Media.screen, Media.maxWidth(.px(768))])
///
/// // Import with supports condition
/// Import("grid.css").supports("display: grid")
///
/// // Import into a layer
/// Import("theme.css").layer("utilities")
///
/// // Complex import with all conditions
/// Import("responsive.css")
///     .layer("layout")
///     .supports("display: flex")
///     .media([Media.screen, Media.maxWidth(.px(500))])
/// ```
public struct Import: AtRule {
    public static let identifier: String = "import"

    public var rawValue: String
    private var urlString: String
    private var conditions: [String] = []
    private var layerName: String?

    public init(rawValue: String) {
        self.rawValue = rawValue

        // Extract URL from rawValue using standard utilities
        // Remove @import prefix and semicolon suffix
        var cleaned = rawValue
        if cleaned.hasPrefix("@import") {
            cleaned = String(cleaned.dropFirst(7))
        }
        if cleaned.hasSuffix(";") {
            cleaned = String(cleaned.dropLast())
        }

        // Trim whitespace using INCITS 4-1986
        cleaned = cleaned.trimming(.ascii.whitespaces)

        // Extract first token (the URL) before any conditions
        if let spaceIndex = cleaned.firstIndex(where: { $0.ascii.isWhitespace }) {
            self.urlString = String(cleaned[..<spaceIndex])
        } else {
            self.urlString = cleaned
        }
    }

    /// Creates an import rule with the specified path.
    ///
    /// - Parameter path: The path to the CSS file to import.
    public init(_ path: String) {
        self.urlString = "\"\(path)\""
        self.rawValue = "@import \(self.urlString);"
    }

    /// Creates an import rule with the specified URL.
    ///
    /// - Parameter url: The URL to the CSS file to import.
    /// - Returns: An Import instance.
    public static func url(_ url: Url) -> Import {
        let formattedUrl = url.description
        var importRule = Import(rawValue: "@import \(formattedUrl);")
        importRule.urlString = formattedUrl
        return importRule
    }

    /// Updates the raw value based on the current conditions.
    private mutating func updateRawValue() {
        var parts: [String] = ["@import", urlString]

        if let layerName = layerName {
            if layerName.isEmpty {
                parts.append("layer")
            } else {
                parts.append("layer(\(layerName))")
            }
        }

        parts.append(contentsOf: conditions)
        rawValue = parts.joined(separator: " ") + ";"
    }

    /// Sets the media query condition.
    ///
    /// - Parameter media: The media query string to apply (e.g., "screen", "print", "(max-width: 768px)").
    /// - Returns: An updated Import instance.
    public func media(_ media: String) -> Import {
        var importRule = self
        importRule.conditions = importRule.conditions.filter {
            !$0.starts(with: "screen") && !$0.starts(with: "print") && !$0.starts(with: "all")
        }
        importRule.conditions.append(media)
        importRule.updateRawValue()
        return importRule
    }

    /// Sets the media query conditions using multiple media query strings.
    ///
    /// - Parameter medias: An array of media query strings to apply.
    /// - Returns: An updated Import instance.
    public func media(_ medias: [String]) -> Import {
        var importRule = self
        let mediaQueryString = medias.joined(separator: ", ")
        importRule.conditions = importRule.conditions.filter {
            !$0.starts(with: "screen") && !$0.starts(with: "print") && !$0.starts(with: "all")
        }
        importRule.conditions.append(mediaQueryString)
        importRule.updateRawValue()
        return importRule
    }

    /// Sets the supports condition.
    ///
    /// - Parameter condition: The condition to check for support.
    /// - Returns: An updated Import instance.
    public func supports(_ condition: String) -> Import {
        var importRule = self
        importRule.conditions = importRule.conditions.filter { !$0.starts(with: "supports") }
        importRule.conditions.append("supports(\(condition))")
        importRule.updateRawValue()
        return importRule
    }

    /// Sets the layer to import into.
    ///
    /// - Parameter name: The name of the layer. Pass an empty string for an anonymous layer.
    /// - Returns: An updated Import instance.
    public func layer(_ name: String = "") -> Import {
        var importRule = self
        importRule.layerName = name
        importRule.updateRawValue()
        return importRule
    }
}
