public import W3C_CSS_Shared

public enum FontFeatureSettings: Property {

    case normal

    case features([String: FeatureValue?])

    case global(Global)

    public init(_ featureTag: String, _ value: FeatureValue?) {
        self = .features([featureTag: value])
    }

    public init(_ features: [String: FeatureValue?]) {
        if features.isEmpty {
            self = .normal
        } else {
            self = .features(features)
        }
    }

    public init(_ features: [String: Int]) {
        let convertedFeatures = features.mapValues { value -> FeatureValue? in
            return .integer(value)
        }
        self.init(convertedFeatures)
    }

}

extension FontFeatureSettings {
    public static let property: String = "font-feature-settings"
}

public enum FeatureValue: Sendable, Hashable, CustomStringConvertible {

    case integer(Int)

    case on

    case off
}

extension FeatureValue {
    public var description: String {
        switch self {
        case .integer(let value):
            return "\(value)"

        case .on:
            return "on"

        case .off:
            return "off"
        }
    }
}
extension FeatureValue: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self = .integer(value)
    }
}

extension FontFeatureSettings: CustomStringConvertible {

    public var description: String {
        switch self {
        case .normal:
            return "normal"

        case .features(let features):
            let featureStrings = features.map { tag, value -> String in
                let valueStr = value.map { " \($0)" } ?? ""
                return "\"\(tag)\"\(valueStr)"
            }
            return featureStrings.joined(separator: ", ")

        case .global(let global):
            return global.description
        }
    }
}

extension FontFeatureSettings {

    public static func smallCaps() -> Self {
        .features(["smcp": nil])
    }

    public static func allSmallCaps() -> Self {
        .features(["c2sc": nil, "smcp": nil])
    }

    public static func slashedZero() -> Self {
        .features(["zero": nil])
    }

    public static func historical() -> Self {
        .features(["hist": nil])
    }

    public static func disableLigatures() -> Self {
        .features(["liga": .off])
    }

    public static func tabularFigures() -> Self {
        .features(["tnum": nil])
    }

    public static func fractions() -> Self {
        .features(["frac": nil])
    }

    public static func stylisticSet(_ number: Int) -> Self {
        guard number >= 1 && number <= 20 else {
            return .normal
        }

        let numStr = String(number)
        let paddedNum = numStr.count == 1 ? "0" + numStr : numStr
        let setName = "ss" + paddedNum
        return .features([setName: nil])
    }
}
