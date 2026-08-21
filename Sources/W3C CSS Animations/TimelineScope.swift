public import W3C_CSS_Shared
import W3C_CSS_Values

public enum TimelineScope: Property {

    case none

    case all

    case custom(DashedIdent)

    case multiple([DashedIdent])

    case global(Global)
}

extension TimelineScope {
    public static let property: String = "timeline-scope"
}

extension TimelineScope: CustomStringConvertible {

    public var description: String {
        switch self {
        case .none:
            return "none"

        case .all:
            return "all"

        case .custom(let ident):
            return ident.description

        case .multiple(let idents):
            return idents.map { $0.description }.joined(separator: " ")

        case .global(let global):
            return global.description
        }
    }
}

extension TimelineScope {

    public static func custom(_ name: String) -> Self {
        return .custom(DashedIdent(name))
    }

    public static func multiple(_ names: [String]) -> Self {
        return .multiple(names.map { DashedIdent($0) })
    }
}
