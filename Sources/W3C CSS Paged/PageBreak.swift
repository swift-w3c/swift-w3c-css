public import W3C_CSS_Shared

public enum PageBreak: Sendable, Hashable, Property {

    case after(After)

    case before(Before)

    case inside(Inside)

    case global(Global)
}

extension PageBreak {
    public static let property: String = "page-break"

    public enum After: String, Sendable {

        case auto

        case always

        case avoid

        case left

        case right

        case initial

        case inherit
    }

    public enum Before: String, Sendable {

        case auto

        case always

        case avoid

        case left

        case right

        case initial

        case inherit
    }

    public enum Inside: String, Sendable {

        case auto

        case avoid

        case initial

        case inherit
    }

    public var description: String {
        switch self {
        case .after(let after):
            after.rawValue

        case .before(let before):
            before.rawValue

        case .inside(let inside):
            inside.rawValue

        case .global(let global):
            global.description
        }
    }

    public static let after: Self = .after(.auto)

    public static let before: Self = .before(.auto)

    public static let inside: Self = .inside(.auto)
}
