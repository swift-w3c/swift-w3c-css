import W3C_CSS_Positioning
public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum ObjectPosition: Property, LengthPercentageConvertible {

    case keyword(W3C_CSS_Values.Position.Keyword)

    case oneValue(Value)

    case twoValues(Value, Value)

    case global(Global)
}

extension ObjectPosition {
    public static func lengthPercentage(_ value: LengthPercentage) -> ObjectPosition {
        .oneValue(.lengthPercentage(value))
    }

    public static let property: String = "object-position"

    public enum Value: Sendable, Hashable, LengthPercentageConvertible {

        case keyword(W3C_CSS_Values.Position.Keyword)

        case lengthPercentage(LengthPercentage)
    }

    public static func objectPosition(_ value: Value) -> ObjectPosition {
        .oneValue(value)
    }

    public static func objectPosition(_ horizontal: Value, _ vertical: Value) -> ObjectPosition {
        .twoValues(horizontal, vertical)
    }

    public static func objectPosition(_ position: W3C_CSS_Values.Position.Keyword) -> ObjectPosition
    {
        .keyword(position)
    }

    public static func objectPosition(_ global: Global) -> ObjectPosition {
        .global(global)
    }
}

extension ObjectPosition {

    public static let center: ObjectPosition = .keyword(.center)

    public static let top: ObjectPosition = .keyword(.top)

    public static let right: ObjectPosition = .keyword(.right)

    public static let bottom: ObjectPosition = .keyword(.bottom)

    public static let left: ObjectPosition = .keyword(.left)

    public static let topLeft: ObjectPosition = .twoValues(.keyword(.left), .keyword(.top))

    public static let topCenter: ObjectPosition = .twoValues(.keyword(.center), .keyword(.top))

    public static let topRight: ObjectPosition = .twoValues(.keyword(.right), .keyword(.top))

    public static let centerLeft: ObjectPosition = .twoValues(.keyword(.left), .keyword(.center))

    public static let centerRight: ObjectPosition = .twoValues(.keyword(.right), .keyword(.center))

    public static let bottomLeft: ObjectPosition = .twoValues(.keyword(.left), .keyword(.bottom))

    public static let bottomCenter: ObjectPosition = .twoValues(
        .keyword(.center),
        .keyword(.bottom)
    )

    public static let bottomRight: ObjectPosition = .twoValues(.keyword(.right), .keyword(.bottom))

    public static func x(_ x: Value) -> ObjectPosition {
        .twoValues(x, .keyword(.center))
    }

    public static func y(_ y: Value) -> ObjectPosition {
        .twoValues(.keyword(.center), y)
    }

    public static func px(_ value: Int) -> ObjectPosition {
        .oneValue(.px(Double(value)))
    }

    public static func lengths(_ x: Value, _ y: Value) -> ObjectPosition {
        .twoValues(x, y)
    }

    public static func percents(_ x: Percentage, _ y: Percentage) -> ObjectPosition {
        .twoValues(.percentage(x), .percentage(y))
    }

    public static func symmetric(_ value: Value) -> ObjectPosition {
        .twoValues(value, value)
    }
}

extension ObjectPosition: CustomStringConvertible {

    public var description: String {
        switch self {
        case .keyword(let keyword):
            return keyword.rawValue

        case .oneValue(let value):
            return value.description

        case .twoValues(let horizontal, let vertical):
            return "\(horizontal) \(vertical)"

        case .global(let global):
            return global.description
        }
    }
}

public struct ObjectStyle: Sendable, Hashable {

    public let position: ObjectPosition

    public init(position: ObjectPosition) {
        self.position = position
    }
}

extension ObjectPosition.Value: CustomStringConvertible {

    public var description: String {
        switch self {
        case .keyword(let keyword):
            return keyword.rawValue

        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description
        }
    }
}
