public import W3C_CSS_Shared

public enum PlaceItems: Property {

    case combined(AlignItems, JustifyItems)

    case single(AlignItems)

    case global(Global)
}

extension PlaceItems {
    public static let property: String = "place-items"
}

extension PlaceItems: CustomStringConvertible {

    public var description: String {
        switch self {
        case .combined(let alignItems, let justifyItems):
            return "\(alignItems) \(justifyItems)"

        case .single(let alignItems):
            return alignItems.description

        case .global(let global):
            return global.description
        }
    }
}

extension PlaceItems {

    public static var normal: Self {
        return .single(.normal)
    }

    public static var stretch: Self {
        return .single(.stretch)
    }

    public static var baseline: Self {
        return .single(.baseline)
    }

    public static var firstBaseline: Self {
        return .single(.firstBaseline)
    }

    public static var lastBaseline: Self {
        return .single(.lastBaseline)
    }

    public static var center: Self {
        return .single(.center)
    }

    public static var start: Self {
        return .single(.start)
    }

    public static var end: Self {
        return .single(.end)
    }

    public static var selfStart: Self {
        return .single(.selfStart)
    }

    public static var selfEnd: Self {
        return .single(.selfEnd)
    }

    public static var flexStart: Self {
        return .single(.flexStart)
    }

    public static var flexEnd: Self {
        return .single(.flexEnd)
    }

    public static var anchorCenter: Self {
        return .single(.anchorCenter)
    }

    public static func safe(_ position: SelfPosition) -> Self {
        return .single(.safe(position))
    }

    public static func unsafe(_ position: SelfPosition) -> Self {
        return .single(.unsafe(position))
    }
}
