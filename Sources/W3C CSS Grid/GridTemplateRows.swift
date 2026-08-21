public import W3C_CSS_Shared

public enum GridTemplateRows: Property {

    case none

    case tracks([GridTrackSize])

    case named([NamedTrack])

    case `repeat`(Int, [GridTrackSize])

    case autoFill([GridTrackSize])

    case autoFit([GridTrackSize])

    case subgrid

    case global(Global)
}

extension GridTemplateRows {
    public static let property: String = "grid-template-rows"

    public struct NamedTrack: Sendable, Hashable {

        public let before: String?

        public let size: GridTrackSize

        public let after: String?

        public init(before: String? = nil, size: GridTrackSize, after: String? = nil) {
            self.before = before
            self.size = size
            self.after = after
        }
    }
}

extension GridTemplateRows.NamedTrack {

    public var description: String {
        var result = ""

        if let before {
            result += "[\(before)] "
        }

        result += size.description

        if let after {
            result += " [\(after)]"
        }

        return result
    }
}

extension GridTemplateRows {
    public var description: String {
        switch self {
        case .none:
            return "none"

        case .tracks(let sizes):
            return sizes.map { $0.description }.joined(separator: " ")

        case .named(let namedTracks):
            return namedTracks.map { $0.description }.joined(separator: " ")

        case .repeat(let count, let sizes):
            let sizeStr = sizes.map { $0.description }.joined(separator: " ")
            return "repeat(\(count), \(sizeStr))"

        case .autoFill(let sizes):
            let sizeStr = sizes.map { $0.description }.joined(separator: " ")
            return "repeat(auto-fill, \(sizeStr))"

        case .autoFit(let sizes):
            let sizeStr = sizes.map { $0.description }.joined(separator: " ")
            return "repeat(auto-fit, \(sizeStr))"

        case .subgrid:
            return "subgrid"

        case .global(let value):
            return value.description
        }
    }
}
