import ASCII_Primitives
public import W3C_CSS_Shared

public struct Import: AtRule {
    public var rawValue: String
    private var urlString: String
    private var conditions: [String] = []
    private var layerName: String?

    public init(rawValue: String) {
        self.rawValue = rawValue

        var cleaned = rawValue
        if cleaned.hasPrefix("@import") {
            cleaned = String(cleaned.dropFirst(7))
        }
        if cleaned.hasSuffix(";") {
            cleaned = String(cleaned.dropLast())
        }

        while cleaned.first?.isWhitespace == true { cleaned.removeFirst() }
        while cleaned.last?.isWhitespace == true { cleaned.removeLast() }

        if let spaceIndex = cleaned.firstIndex(where: { $0.isWhitespace }) {
            self.urlString = String(cleaned[..<spaceIndex])
        } else {
            self.urlString = cleaned
        }
    }

    public init(_ path: String) {
        self.urlString = "\"\(path)\""
        self.rawValue = "@import \(self.urlString);"
    }
}

extension Import {
    public static let identifier: String = "import"
}

extension Import {

    public static func url(_ url: Url) -> Import {
        let formattedUrl = url.description
        var importRule = Import(rawValue: "@import \(formattedUrl);")
        importRule.urlString = formattedUrl
        return importRule
    }

    private mutating func updateRawValue() {
        var parts: [String] = ["@import", urlString]

        if let layerName {
            if layerName.isEmpty {
                parts.append("layer")
            } else {
                parts.append("layer(\(layerName))")
            }
        }

        parts.append(contentsOf: conditions)
        rawValue = parts.joined(separator: " ") + ";"
    }

    public func media(_ media: String) -> Import {
        var importRule = self
        importRule.conditions = importRule.conditions.filter {
            !$0.starts(with: "screen") && !$0.starts(with: "print") && !$0.starts(with: "all")
        }
        importRule.conditions.append(media)
        importRule.updateRawValue()
        return importRule
    }

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

    public func supports(_ condition: String) -> Import {
        var importRule = self
        importRule.conditions = importRule.conditions.filter { !$0.starts(with: "supports") }
        importRule.conditions.append("supports(\(condition))")
        importRule.updateRawValue()
        return importRule
    }

    public func layer(_ name: String = "") -> Import {
        var importRule = self
        importRule.layerName = name
        importRule.updateRawValue()
        return importRule
    }
}
