public import W3C_CSS_Shared

public enum WillChange: Property {

    case auto

    case scrollPosition

    case contents

    case properties([String])

    case global(Global)
}

extension WillChange {
    public static let property: String = "will-change"

    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .scrollPosition:
            return "scroll-position"

        case .contents:
            return "contents"

        case .properties(let props):
            return props.joined(separator: ", ")

        case .global(let global):
            return global.description
        }
    }
}
