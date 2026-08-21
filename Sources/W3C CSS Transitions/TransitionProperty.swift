public import W3C_CSS_Shared
import W3C_CSS_Values

public enum TransitionProperty: Property {

    case all

    case none

    case custom(CSSString)

    case list([String])

    case global(Global)

    public init(_ properties: [String]) {
        if properties.isEmpty {
            self = .none
        } else if properties.count == 1 {
            self = .custom(.init(properties[0]))
        } else {
            self = .list(properties)
        }
    }

    public init(_ properties: String...) {
        self.init(properties)
    }
}

extension TransitionProperty {
    public static let property: String = "transition-property"

    public var description: String {
        switch self {
        case .all:
            return "all"

        case .none:
            return "none"

        case .custom(let property):
            return property.description

        case .list(let properties):
            return properties.joined(separator: ", ")

        case .global(let global):
            return global.description
        }
    }
}
