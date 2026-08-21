public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum ScrollMarginInline: Property, LengthConvertible, ExpressibleByIntegerLiteral,
    ExpressibleByFloatLiteral, CustomStringConvertible
{

    case all(Length)

    case startEnd(Length, Length)

    case global(Global)

    public init(integerLiteral value: Int) {
        self = .all(.px(Double(value)))
    }

    public init(floatLiteral value: Double) {
        self = .all(.px(value))
    }
}

extension ScrollMarginInline {
    public static let property: String = "scroll-margin-inline"

    public var description: String {
        switch self {
        case .all(let length):
            return length.description

        case .startEnd(let start, let end):
            return "\(start.description) \(end.description)"

        case .global(let global):
            return global.description
        }
    }

    public static func length(_ length: Length) -> Self {
        .all(length)
    }
}
