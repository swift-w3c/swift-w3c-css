public import W3C_CSS_Shared

/// The `all` shorthand, which takes the CSS-wide keywords only (CSS Cascading Level 4, section 3.2).
public enum All: Property {

    case global(Global)
}

extension All {

    public static let property: String = "all"

    public static let unset: All = .global(.unset)

    public static let initial: All = .global(.initial)

    public static let inherit: All = .global(.inherit)

    public static let revert: All = .global(.revert)
}

extension All: CustomStringConvertible {

    public var description: String {
        switch self {
        case .global(let global):
            return global.rawValue
        }
    }
}
