public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum Zoom: Property {

    case percentage(Percentage)

    case number(Number)

    case normal

    case reset

    case global(Global)
}

extension Zoom {
    public static let property: String = "zoom"

    public var description: String {
        switch self {
        case .percentage(let percentage):
            return percentage.description

        case .number(let number):
            return number.description

        case .normal:
            return "normal"

        case .reset:
            return "reset"

        case .global(let global):
            return global.description
        }
    }
}
