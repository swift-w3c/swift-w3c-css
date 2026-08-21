import ASCII_Primitives
import W3C_CSS_Shared
public import W3C_CSS_Syntax

public struct CounterStyle: AtRule {
    public var rawValue: String
    private var name: String
    private var descriptors: [String: String] = [:]

    public init(rawValue: String) {
        self.rawValue = rawValue

        var cleaned = rawValue
        if cleaned.hasPrefix("@counter-style") {
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
        self.rawValue = "@counter-style \(name) {}"
    }
}

extension CounterStyle {
    public static let identifier: String = "container-style"

    private mutating func updateRawValue() {
        let descriptorString = descriptors.map { key, value in
            "  \(key): \(value);"
        }.joined(separator: "\n")

        if descriptorString.isEmpty {
            rawValue = "@counter-style \(name) {}"
        } else {
            rawValue = "@counter-style \(name) {\n\(descriptorString)\n}"
        }
    }

    public func system(_ system: System) -> CounterStyle {
        var style = self
        style.descriptors["system"] = system.rawValue
        style.updateRawValue()
        return style
    }

    public func symbols(_ symbols: [String]) -> CounterStyle {
        var style = self
        style.descriptors["symbols"] = symbols.joined(separator: " ")
        style.updateRawValue()
        return style
    }

    public func additiveSymbols(_ symbols: [(Int, String)]) -> CounterStyle {
        var style = self
        let symbolString =
            symbols
            .map { "\(String($0.0)) \"\($0.1)\"" }
            .joined(separator: " ")
        style.descriptors["additive-symbols"] = symbolString
        style.updateRawValue()
        return style
    }

    public func negative(prefix: String, suffix: String = "") -> CounterStyle {
        var style = self
        style.descriptors["negative"] = "\"\(prefix)\" \"\(suffix)\""
        style.updateRawValue()
        return style
    }

    public func prefix(_ prefix: String) -> CounterStyle {
        var style = self
        style.descriptors["prefix"] = "\"\(prefix)\""
        style.updateRawValue()
        return style
    }

    public func suffix(_ suffix: String) -> CounterStyle {
        var style = self
        style.descriptors["suffix"] = "\"\(suffix)\""
        style.updateRawValue()
        return style
    }

    public func range(_ range: Range) -> CounterStyle {
        var style = self
        style.descriptors["range"] = range.rawValue
        style.updateRawValue()
        return style
    }

    public func pad(length: Int, symbol: String) -> CounterStyle {
        var style = self
        style.descriptors["pad"] = "\(length) \"\(symbol)\""
        style.updateRawValue()
        return style
    }

    public func speakAs(_ speakAs: SpeakAs) -> CounterStyle {
        var style = self
        style.descriptors["speak-as"] = speakAs.rawValue
        style.updateRawValue()
        return style
    }

    public func fallback(_ fallback: String) -> CounterStyle {
        var style = self
        style.descriptors["fallback"] = fallback
        style.updateRawValue()
        return style
    }
}

extension CounterStyle {

    public enum System: String, Hashable, Sendable {

        case cyclic

        case numeric

        case alphabetic

        case symbolic

        case additive

        case fixed

        case extends
    }

    public enum Range: CustomStringConvertible, Hashable, Sendable {

        case specific(min: Int, max: Int)

        case auto

        case infinite
    }

    public enum SpeakAs: String, Hashable, Sendable {

        case numbers

        case words

        case counters

        case countersStyle = "counters style"

        case none

        case auto
    }
}

extension CounterStyle.Range {
    public var description: String {
        switch self {
        case .specific(let min, let max):
            return "\(min) \(max)"

        case .auto:
            return "auto"

        case .infinite:
            return "infinite"
        }
    }

    public var rawValue: String {
        description
    }
}
