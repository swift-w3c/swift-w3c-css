public import W3C_CSS_Shared
import W3C_CSS_Values

public enum ScrollSnapAlign: Property {

    case single(Alignment)

    case blockInline(Alignment, Alignment)

    case global(Global)

}

extension ScrollSnapAlign {
    public static let property: String = "scroll-snap-align"

    public enum Alignment: String, Sendable {

        case none

        case start

        case end

        case center
    }

    public var description: String {
        switch self {
        case .single(let alignment):
            return alignment.rawValue

        case .blockInline(let block, let inline):
            return "\(block.rawValue) \(inline.rawValue)"

        case .global(let global):
            return global.description
        }
    }

    public static let none: Self = .single(.none)

    public static let start: Self = .single(.start)

    public static let end: Self = .single(.end)

    public static let center: Self = .single(.center)

    public static func blockInline(block: Alignment, inline: Alignment) -> Self {
        .blockInline(block, inline)
    }
}
