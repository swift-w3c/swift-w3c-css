import W3C_CSS_Shared
public import W3C_CSS_Syntax

public struct Supports: AtRule {
    public var rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

extension Supports {
    public static let identifier: String = "supports"

    public static func property(_ property: String, _ value: String) -> Supports {
        Supports(rawValue: "@supports (\(property): \(value)) {}")
    }

    public static func selector(_ selector: String) -> Supports {
        Supports(rawValue: "@supports selector(\(selector)) {}")
    }

    public static func fontTech(_ technology: FontTechnology) -> Supports {
        Supports(rawValue: "@supports font-tech(\(technology.rawValue)) {}")
    }

    public static func fontFormat(_ format: FontFormat) -> Supports {
        Supports(rawValue: "@supports font-format(\(format.rawValue)) {}")
    }

    public static func not(_ condition: Supports) -> Supports {

        let start = condition.rawValue.index(condition.rawValue.startIndex, offsetBy: 10)
        let end = condition.rawValue.index(condition.rawValue.endIndex, offsetBy: -4)
        let conditionString = condition.rawValue[start..<end]

        return Supports(rawValue: "@supports not \(conditionString) {}")
    }

    public func and(_ other: Supports) -> Supports {
        let thisCondition = extractCondition(from: self)
        let otherCondition = extractCondition(from: other)

        return Supports(rawValue: "@supports \(thisCondition) and \(otherCondition) {}")
    }

    public func or(_ other: Supports) -> Supports {
        let thisCondition = extractCondition(from: self)
        let otherCondition = extractCondition(from: other)

        return Supports(rawValue: "@supports \(thisCondition) or \(otherCondition) {}")
    }

    private func extractCondition(from support: Supports) -> String {

        let start = support.rawValue.index(support.rawValue.startIndex, offsetBy: 10)
        let end = support.rawValue.index(support.rawValue.endIndex, offsetBy: -4)
        return String(support.rawValue[start..<end])
    }

    public func style(_ selector: String, _ declarations: String) -> Supports {
        let currentContent = rawValue

        if currentContent.hasSuffix("{}") {

            let newContent = currentContent.dropLast() + selector + " { " + declarations + " }}"
            return Supports(rawValue: String(newContent))
        } else {

            let newContent =
                currentContent.dropLast() + " " + selector + " { " + declarations + " }}"
            return Supports(rawValue: String(newContent))
        }
    }

}

extension Supports {

    public enum FontTechnology: String, Hashable, Sendable {

        case colorCOLRv0 = "color-COLRv0"
        case colorCOLRv1 = "color-COLRv1"
        case colorSVG = "color-svg"
        case colorSBIX = "color-sbix"
        case colorCBDT = "color-cbdt"

        case featuresOpenType = "features-opentype"
        case featuresAAT = "features-aat"
        case featuresGraphite = "features-graphite"

        case incrementalPatch = "incremental-patch"
        case incrementalRange = "incremental-range"
        case incrementalAuto = "incremental-auto"

        case variations = "variations"
        case palettes = "palettes"
    }

    public enum FontFormat: String, Hashable, Sendable {
        case collection = "collection"
        case embeddedOpenType = "embedded-opentype"
        case opentype = "opentype"
        case svg = "svg"
        case truetype = "truetype"
        case woff = "woff"
        case woff2 = "woff2"
    }
}
