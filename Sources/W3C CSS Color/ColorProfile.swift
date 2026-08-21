import ASCII_Primitives
public import W3C_CSS_Shared
public import W3C_CSS_Syntax
import W3C_CSS_Values

public struct ColorProfile: AtRule {
    public var rawValue: String
    private var name: String
    private var descriptors: [String: String] = [:]

    public init(rawValue: String) {
        self.rawValue = rawValue

        var cleaned = rawValue
        if cleaned.hasPrefix("@color-profile") {
            cleaned = String(cleaned.dropFirst(14))
        }

        while cleaned.first?.isWhitespace == true { cleaned.removeFirst() }
        while cleaned.last?.isWhitespace == true { cleaned.removeLast() }

        if let endIndex = cleaned.firstIndex(where: { $0.isWhitespace || $0 == "{" }) {
            self.name = String(cleaned[..<endIndex])
        } else {
            self.name = cleaned
        }
    }

    public init(_ name: String) {
        self.name = name
        self.rawValue = "@color-profile \(name) {}"
    }

}

extension ColorProfile {
    public static let identifier: String = "color-profile"

    public static let deviceCMYK = ColorProfile("device-cmyk")

    public func src(_ url: Url) -> ColorProfile {
        var profile = self
        profile.descriptors["src"] = url.description
        profile.updateRawValue()
        return profile
    }

    public func renderingIntent(_ intent: RenderingIntent) -> ColorProfile {
        var profile = self
        profile.descriptors["rendering-intent"] = intent.rawValue
        profile.updateRawValue()
        return profile
    }

    fileprivate mutating func updateRawValue() {
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

    public enum RenderingIntent: String, Hashable, Sendable {

        case relativeColorimetric = "relative-colorimetric"

        case absoluteColorimetric = "absolute-colorimetric"

        case perceptual

        case saturation
    }
}
