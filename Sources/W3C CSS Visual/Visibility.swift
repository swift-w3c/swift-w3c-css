public import W3C_CSS_Shared

public enum Visibility: Property {

    case visible

    case hidden

    case collapse

    case global(Global)

}

extension Visibility {
    public static let property: String = "visibility"
}

extension Visibility: CustomStringConvertible {
    public var description: String {
        switch self {
        case .visible: return "visible"
        case .hidden: return "hidden"
        case .collapse: return "collapse"
        case .global(let value): return value.description
        }
    }
}
