public import W3C_CSS_Shared
import W3C_CSS_Values

public enum ContainerName: Property {

    case none

    case name(Ident)

    case names([Ident])

    case global(Global)
}

extension ContainerName {
    public static let property: String = "container-name"

    public var description: String {
        switch self {
        case .none:
            return "none"

        case .name(let name):
            return name.description

        case .names(let names):
            return names.map { $0.description }.joined(separator: " ")

        case .global(let value):
            return value.description
        }
    }
}
