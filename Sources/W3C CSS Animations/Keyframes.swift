import ASCII
import W3C_CSS_Shared
public import W3C_CSS_Syntax
import W3C_CSS_Values

public struct Keyframes: AtRule {
    public var rawValue: String
    private var name: String
    private var keyframes: [Keyframe] = []

    public init(rawValue: String) {
        self.rawValue = rawValue

        var cleaned = rawValue
        if cleaned.hasPrefix("@keyframes") {
            cleaned = String(cleaned.dropFirst(10))
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
        self.rawValue = "@keyframes \(name) {}"
    }
}

extension Keyframes {
    public static let identifier: String = "keyframes"
}

extension Keyframes {

    private mutating func updateRawValue() {
        var sections: [String] = []

        for frame in keyframes {
            var styleLines: [String] = []

            for (property, value) in frame.styles {
                styleLines.append("    \(property): \(value);")
            }

            if !styleLines.isEmpty {
                let selectorString = frame.selectors.map { $0.rawValue }.joined(separator: ", ")
                let stylesString = styleLines.joined(separator: "\n")
                sections.append("  \(selectorString) {\n\(stylesString)\n  }")
            }
        }

        let keyframesString = sections.joined(separator: "\n\n")

        if keyframesString.isEmpty {
            rawValue = "@keyframes \(name) {}"
        } else {
            rawValue = "@keyframes \(name) {\n\(keyframesString)\n}"
        }
    }

    public func keyframe(_ selector: KeyframeSelector, _ styles: [String: String]) -> Keyframes {
        return keyframe([selector], styles)
    }

    public func keyframe(_ selectors: [KeyframeSelector], _ styles: [String: String]) -> Keyframes {
        var keyframes = self
        let frame = Keyframe(selectors: selectors, styles: styles)

        if let index = keyframes.keyframes.firstIndex(where: { $0.selectors == frame.selectors }) {

            var updatedFrame = keyframes.keyframes[index]
            for (key, value) in frame.styles {
                updatedFrame.styles[key] = value
            }
            keyframes.keyframes[index] = updatedFrame
        } else {

            keyframes.keyframes.append(frame)
        }

        keyframes.updateRawValue()
        return keyframes
    }
}

extension Keyframes {

    fileprivate struct Keyframe: Sendable, Hashable {
        var selectors: [KeyframeSelector]
        var styles: [String: String]
    }

    public enum KeyframeSelector: Sendable, Hashable {

        case from

        case to

        case percentage(Int)

        case timelineRange(String, Int)
    }
}

extension Keyframes.KeyframeSelector {
    public var rawValue: String {
        switch self {
        case .from:
            return "from"

        case .to:
            return "to"

        case .percentage(let value):
            return "\(value)%"

        case .timelineRange(let name, let value):
            return "\(name) \(value)%"
        }
    }
}
