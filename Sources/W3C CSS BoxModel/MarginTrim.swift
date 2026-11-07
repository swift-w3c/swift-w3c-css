public import W3C_CSS_Shared
import W3C_CSS_Values

public enum MarginTrim: Property {

    case none

    case block

    case blockStart

    case blockEnd

    case inline

    case inlineStart

    case inlineEnd

    case edges([Edge])

    case global(Global)
}

extension MarginTrim {
    public static let property: String = "margin-trim"

    public enum Edge: String, Sendable, Hashable, CaseIterable {

        case blockStart = "block-start"

        case blockEnd = "block-end"

        case inlineStart = "inline-start"

        case inlineEnd = "inline-end"
    }

    public var description: String {
        switch self {
        case .none:
            return "none"

        case .block:
            return "block"

        case .blockStart:
            return "block-start"

        case .blockEnd:
            return "block-end"

        case .inline:
            return "inline"

        case .inlineStart:
            return "inline-start"

        case .inlineEnd:
            return "inline-end"

        case .edges(let edges):
            return edges.map { $0.rawValue }.joined(separator: " ")

        case .global(let global):
            return global.description
        }
    }
}

extension MarginTrim {

    public static let all = MarginTrim.edges([.blockStart, .blockEnd, .inlineStart, .inlineEnd])

    public static func trim(_ edges: Edge...) -> MarginTrim {
        .edges(edges)
    }
}
