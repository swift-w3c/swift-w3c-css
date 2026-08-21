public import W3C_CSS_Shared

public enum FontFamily: Property {

    case families([Family])

    case family(Family)

    case global(Global)
}

extension FontFamily {
    public static let property: String = "font-family"

    public static func specific(_ names: String...) -> FontFamily {
        .families(names.map { Family.specific($0) })
    }

    public static func generic(_ family: GenericFamily) -> FontFamily {
        .family(.generic(family))
    }

    public static func withFallback(
        _ specificNames: [String],
        fallback: GenericFamily
    ) -> FontFamily {
        var families = specificNames.map { Family.specific($0) }
        families.append(.generic(fallback))
        return .families(families)
    }

    public static let serif: FontFamily = .generic(.serif)
    public static let sansSerif: FontFamily = .generic(.sansSerif)
    public static let monospace: FontFamily = .generic(.monospace)
    public static let cursive: FontFamily = .generic(.cursive)
    public static let fantasy: FontFamily = .generic(.fantasy)
    public static let systemUi: FontFamily = .generic(.systemUi)

    public var description: String {
        switch self {
        case .families(let families):
            return families.map { $0.description }.joined(separator: ", ")

        case .family(let family):
            return family.description

        case .global(let value):
            return value.description
        }
    }
}

extension FontFamily {

    public enum Family: Sendable, Hashable, CustomStringConvertible {

        case specific(String)

        case generic(GenericFamily)

        case multiple([Family])
    }
}

extension FontFamily.Family {

    public var description: String {
        switch self {
        case .specific(let name):

            if name.contains(" ") || name.contains("-") || name.contains(".") {
                return "\"\(name)\""
            }
            return name

        case .generic(let family):
            return family.description

        case .multiple(let families):
            return families.map { $0.description }.joined(separator: ", ")
        }
    }
}
