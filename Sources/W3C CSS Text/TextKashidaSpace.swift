public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum TextKashidaSpace: Property {

    case none

    case percentage(Percentage)

    case global(Global)
}

extension TextKashidaSpace {
    public static let property: String = "text-kashida-space"
}

extension TextKashidaSpace: CustomStringConvertible {

    public var description: String {
        switch self {
        case .none:
            return 0.percent.description

        case .percentage(let percentage):
            return percentage.description

        case .global(let global):
            return global.description
        }
    }
}

extension TextKashidaSpace {

    public static let off = TextKashidaSpace.none

    public static let normal = TextKashidaSpace.percentage(50)

    public static let full = TextKashidaSpace.percentage(100)
}
