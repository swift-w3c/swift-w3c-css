public import W3C_CSS_Shared

public enum Overflow: Property {

    case single(Value)

    case horizontalVertical(Value, Value)

    case global(Global)

    public init(_ value: Value) {
        self = .single(value)
    }

    public init(_ x: Value, _ y: Value) {
        self = .horizontalVertical(x, y)
    }
}

extension Overflow {
    public static let property: String = "overflow"

    public enum Value: String, Sendable, Hashable {

        case visible

        case hidden

        case clip

        case scroll

        case auto
    }

    public static let visible = Overflow(.visible)

    public static let hidden = Overflow(.hidden)

    public static let scroll = Overflow(.scroll)

    public static let auto = Overflow(.auto)

    public static let clip = Overflow(.clip)

    public var description: String {
        switch self {
        case .single(let value):
            return value.rawValue

        case .horizontalVertical(let x, let y):
            return "\(x.rawValue) \(y.rawValue)"

        case .global(let global):
            return global.description
        }
    }
}
