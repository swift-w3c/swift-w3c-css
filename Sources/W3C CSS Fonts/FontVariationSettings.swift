public import W3C_CSS_Shared

public enum FontVariationSettings: Property {

    case normal

    case axes([String: Double])

    case global(Global)

    public init(_ axis: String, _ value: Double) {
        self = .axes([axis: value])
    }

    public init(_ axes: [String: Double]) {
        if axes.isEmpty {
            self = .normal
        } else {
            self = .axes(axes)
        }
    }
}

extension FontVariationSettings {
    public static let property: String = "font-variation-settings"
}

extension FontVariationSettings: CustomStringConvertible {

    public var description: String {
        switch self {
        case .normal:
            return "normal"

        case .axes(let axes):
            let axisStrings = axes.map { axis, value -> String in
                return "\"\(axis)\" \(value)"
            }
            return axisStrings.joined(separator: ", ")

        case .global(let global):
            return global.description
        }
    }
}

extension FontVariationSettings {

    public static func weight(_ value: Double) -> Self {
        .axes(["wght": value])
    }

    public static func width(_ value: Double) -> Self {
        .axes(["wdth": value])
    }

    public static func slant(_ value: Double) -> Self {
        .axes(["slnt": value])
    }

    public static func italic(_ value: Double) -> Self {
        .axes(["ital": value])
    }

    public static func opticalSize(_ value: Double) -> Self {
        .axes(["opsz": value])
    }

}
