public import W3C_CSS_Shared

public enum PlaceSelf: Property, SelfPositionConvertible {

    case combined(AlignSelf, JustifySelf)

    case single(AlignSelf)

    case global(Global)
}

extension PlaceSelf {
    public static let property: String = "place-self"
}

extension PlaceSelf {
    public static func position(
        _ value: OverflowPosition?,
        _ value1: SelfPosition
    ) -> PlaceSelf {
        .single(.position(value, value1))
    }
}

extension PlaceSelf: CustomStringConvertible {

    public var description: String {
        switch self {
        case .combined(let alignSelf, let justifySelf):
            return "\(alignSelf) \(justifySelf)"

        case .single(let alignSelf):
            return alignSelf.description

        case .global(let global):
            return global.description
        }
    }
}

extension PlaceSelf {

    public static func auto() -> Self {
        return .single(.auto)
    }

    public static func normal() -> Self {
        return .single(.normal)
    }

    public static func stretch() -> Self {
        return .single(.stretch)
    }

    public static func baseline() -> Self {
        return .single(.baseline)
    }

    public static func firstBaseline() -> Self {
        return .single(.firstBaseline)
    }

    public static func lastBaseline() -> Self {
        return .single(.lastBaseline)
    }

    public static func anchorCenter() -> Self {
        return .single(.anchorCenter)
    }
}
