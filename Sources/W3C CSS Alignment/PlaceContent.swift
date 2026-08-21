public import W3C_CSS_Shared

public enum PlaceContent: Property, BaselinePositionConvertible {

    case combined(AlignContent, JustifyContent)

    case single(AlignContent)

    case global(Global)
}

extension PlaceContent {
    public static let property: String = "place-content"
}

extension PlaceContent: CustomStringConvertible {

    public var description: String {
        switch self {
        case .combined(let alignContent, let justifyContent):
            return "\(alignContent) \(justifyContent)"

        case .single(let alignContent):
            return alignContent.description

        case .global(let global):
            return global.description
        }
    }
}

extension PlaceContent {
    public static func baseline(_ value: BaselinePosition) -> PlaceContent {
        .single(.baseline(value))
    }
}

extension PlaceContent {

    public static var normal: Self {
        return .single(.normal)
    }

    public static var stretch: Self {
        return .single(.stretch)
    }

    public static var spaceBetween: Self {
        return .single(.spaceBetween)
    }

    public static var spaceAround: Self {
        return .single(.spaceAround)
    }

    public static var spaceEvenly: Self {
        return .single(.spaceEvenly)
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

    public static var flexStart: Self {
        return .single(.flexStart)
    }

    public static var flexEnd: Self {
        return .single(.flexEnd)
    }

    public static func safe(_ position: ContentPosition) -> Self {
        return .single(.safe(position))
    }

    public static func unsafe(_ position: ContentPosition) -> Self {
        return .single(.unsafe(position))
    }

}
