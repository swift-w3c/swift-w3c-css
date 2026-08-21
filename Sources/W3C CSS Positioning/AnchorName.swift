public import W3C_CSS_Shared
import W3C_CSS_Values

public enum AnchorName: Property {

    case none

    case single(DashedIdent)

    case multiple([DashedIdent])

    case global(Global)
}

extension AnchorName {
    public static let property: String = "anchor-name"
}

extension AnchorName: CustomStringConvertible {

    public var description: String {
        switch self {
        case .none:
            return "none"

        case .single(let ident):
            return ident.description

        case .multiple(let idents):
            return idents.map { $0.description }.joined(separator: ", ")

        case .global(let global):
            return global.description
        }
    }
}

extension AnchorName {

    public static func custom(_ name: String) -> Self {
        return .single(DashedIdent(name))
    }

    public static func customs(_ names: [String]) -> Self {
        return .multiple(names.map { DashedIdent($0) })
    }
}

extension AnchorName: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self = .single(.init(value))
    }
}
