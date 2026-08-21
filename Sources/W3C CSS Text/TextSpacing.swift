public import W3C_CSS_Shared
import W3C_CSS_Values

public enum TextSpacing: Property {

    case normal

    case auto

    case custom(Set<TextSpacingOption>)

    case global(Global)

    public init(_ options: [TextSpacingOption]) {
        self.init(Set(options))
    }

    public init(_ options: Set<TextSpacingOption>) {
        if options.isEmpty {
            self = .normal
        } else {
            self = .custom(options)
        }
    }

    public init(_ options: TextSpacingOption...) {
        self.init(options)
    }
}

extension TextSpacing {
    public static let property: String = "text-spacing"
}

public enum TextSpacingOption: String, Sendable, Hashable, CaseIterable {

    case trimStart = "trim-start"

    case trimEnd = "trim-end"

    case trimAll = "trim-all"

    case spaceFirst = "space-first"

    case spaceAll = "space-all"
}

extension TextSpacing: CustomStringConvertible {

    public var description: String {
        switch self {
        case .normal:
            return "normal"

        case .auto:
            return "auto"

        case .custom(let options):
            return options.map { $0.rawValue }.joined(separator: " ")

        case .global(let global):
            return global.description
        }
    }
}

extension TextSpacing {

    public static var japanese: TextSpacing {
        .custom([.spaceAll])
    }

    public static var chinese: TextSpacing {
        .custom([.trimStart, .spaceAll])
    }

    public static var modernJapanese: TextSpacing {
        .custom([.trimStart, .spaceFirst])
    }
}
