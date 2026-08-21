public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum Rx: Property, LengthPercentageConvertible {

    case lengthPercentage(LengthPercentage)

    case auto

    case global(Global)
}

extension Rx {
    public static let property: String = "rx"

    public var description: String {
        switch self {
        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description

        case .auto:
            return "auto"

        case .global(let global):
            return global.description
        }
    }
}

extension Rx: LengthConvertible {
    public static func length(_ length: Length) -> Rx {
        .lengthPercentage(.length(length))
    }
}
extension Rx: PercentageConvertible {
    public static func percentage(_ percentage: Percentage) -> Rx {
        .lengthPercentage(.percentage(percentage))
    }
}
