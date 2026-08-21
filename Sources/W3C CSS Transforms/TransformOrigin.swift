public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum TransformOrigin: Property {

    case singleValue(Value)

    case twoValues(Value, Value)

    case threeValues(Value, Value, Length)

    case global(Global)
}

extension TransformOrigin {
    public static let property: String = "transform-origin"
}

extension TransformOrigin {

    public enum HorizontalKeyword: Sendable, Hashable, CustomStringConvertible {

        case left

        case center

        case right
    }

    public enum VerticalKeyword: Sendable, Hashable, CustomStringConvertible {

        case top

        case center

        case bottom
    }

    public enum Value: Sendable, Hashable, LengthPercentageConvertible {

        case horizontalKeyword(HorizontalKeyword)

        case verticalKeyword(VerticalKeyword)

        case lengthPercentage(LengthPercentage)
    }
}

extension TransformOrigin.HorizontalKeyword {
    public var description: String {
        switch self {
        case .left: return "left"
        case .center: return "center"
        case .right: return "right"
        }
    }
}

extension TransformOrigin.VerticalKeyword {
    public var description: String {
        switch self {
        case .top: return "top"
        case .center: return "center"
        case .bottom: return "bottom"
        }
    }
}

extension TransformOrigin: LengthPercentageConvertible {
    public static func lengthPercentage(_ value: LengthPercentage) -> TransformOrigin {
        .singleValue(.init(value))
    }
}

extension TransformOrigin {

    public static func value(_ value: Value) -> TransformOrigin {
        .singleValue(value)
    }

    public static func values(_ x: Value, _ y: Value) -> TransformOrigin {
        .twoValues(x, y)
    }

    public static func values3D(_ x: Value, _ y: Value, _ z: Length) -> TransformOrigin {
        .threeValues(x, y, z)
    }

    public static func horizontal(_ keyword: HorizontalKeyword) -> Value {
        .horizontalKeyword(keyword)
    }

    public static func vertical(_ keyword: VerticalKeyword) -> Value {
        .verticalKeyword(keyword)
    }
}

extension TransformOrigin {

    public static let center: TransformOrigin = .singleValue(.horizontalKeyword(.center))

    public static let topLeft: TransformOrigin = .twoValues(
        .horizontalKeyword(.left),
        .verticalKeyword(.top)
    )

    public static let topCenter: TransformOrigin = .twoValues(
        .horizontalKeyword(.center),
        .verticalKeyword(.top)
    )

    public static let topRight: TransformOrigin = .twoValues(
        .horizontalKeyword(.right),
        .verticalKeyword(.top)
    )

    public static let middleLeft: TransformOrigin = .twoValues(
        .horizontalKeyword(.left),
        .verticalKeyword(.center)
    )

    public static let middleRight: TransformOrigin = .twoValues(
        .horizontalKeyword(.right),
        .verticalKeyword(.center)
    )

    public static let bottomLeft: TransformOrigin = .twoValues(
        .horizontalKeyword(.left),
        .verticalKeyword(.bottom)
    )

    public static let bottomCenter: TransformOrigin = .twoValues(
        .horizontalKeyword(.center),
        .verticalKeyword(.bottom)
    )

    public static let bottomRight: TransformOrigin = .twoValues(
        .horizontalKeyword(.right),
        .verticalKeyword(.bottom)
    )
}

extension TransformOrigin.Value: CustomStringConvertible {

    public var description: String {
        switch self {
        case .horizontalKeyword(let keyword):
            return keyword.description

        case .verticalKeyword(let keyword):
            return keyword.description

        case .lengthPercentage(let value):
            return value.description
        }
    }
}

extension TransformOrigin: CustomStringConvertible {

    public var description: String {
        switch self {
        case .singleValue(let value):
            return value.description

        case .twoValues(let x, let y):
            return "\(x) \(y)"

        case .threeValues(let x, let y, let z):
            return "\(x) \(y) \(z)"

        case .global(let global):
            return global.description
        }
    }
}
