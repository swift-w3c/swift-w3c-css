public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum TabSize: Property, LengthConvertible {

    case number(Int)

    case length(Length)

    case global(Global)
}

extension TabSize {
    public static let property: String = "tab-size"
}

extension TabSize: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self = .number(value)
    }
}

extension TabSize: CustomStringConvertible {
    public var description: String {
        switch self {
        case .number(let number):
            return number.description

        case .length(let length):
            return length.description

        case .global(let global):
            return global.description
        }
    }
}
