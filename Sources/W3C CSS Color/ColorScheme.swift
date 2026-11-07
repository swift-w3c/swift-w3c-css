public import W3C_CSS_Shared
import W3C_CSS_Values

public enum ColorScheme: Property {

    case normal

    case schemes([ColorSchemeValue], only: Bool)

    case global(Global)
}

extension ColorScheme {
    public static let property: String = "color-scheme"
}

public enum ColorSchemeValue: Sendable, Hashable, CustomStringConvertible {

    case light

    case dark

    case custom(CSSString)
}

extension ColorSchemeValue {
    public var description: String {
        switch self {
        case .light:
            return "light"

        case .dark:
            return "dark"

        case .custom(let name):
            return name.description
        }
    }
}

extension ColorScheme: CustomStringConvertible {
    public var description: String {
        switch self {
        case .normal:
            return "normal"

        case .schemes(let schemes, let only):
            let schemeList = schemes.map { $0.description }.joined(separator: " ")
            return only ? "only \(schemeList)" : schemeList

        case .global(let global):
            return global.description
        }
    }
}

extension ColorScheme {

    public static func scheme(_ scheme: ColorSchemeValue, only: Bool = false) -> ColorScheme {
        .schemes([scheme], only: only)
    }

    public static let light: ColorScheme = .scheme(.light)

    public static let dark: ColorScheme = .scheme(.dark)

}
