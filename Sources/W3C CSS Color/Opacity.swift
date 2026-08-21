public import W3C_CSS_Shared
import W3C_CSS_Values

public enum Opacity: Property {

    case value(Double)

    case global(Global)

    public init(_ value: Double) {
        self = .value(max(0, min(1, value)))
    }
}

extension Opacity {
    public static let property: String = "opacity"

    public static let transparent: Opacity = .value(0)

    public static let opaque: Opacity = .value(1)
}

extension Opacity: CustomStringConvertible {

    public var description: String {
        switch self {
        case .value(let value):

            let rounded = (value * 100).rounded() / 100
            if rounded.truncatingRemainder(dividingBy: 1) == 0 {
                return String(Int(rounded))
            } else {
                return String(rounded)
            }

        case .global(let global):
            return global.description
        }
    }
}

extension Opacity: ExpressibleByFloatLiteral {

    public init(floatLiteral value: Double) {
        self.init(value)
    }
}

extension Opacity: ExpressibleByIntegerLiteral {

    public init(integerLiteral value: Int) {
        self.init(Double(value))
    }
}
