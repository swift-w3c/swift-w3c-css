public enum UnicodeBidi: Property {

    case normal

    case embed

    case bidiOverride

    case isolate

    case isolateOverride

    case plaintext

    case global(Global)

}

extension UnicodeBidi {
    public static let property: String = "unicode-bidi"

    public var description: String {
        switch self {
        case .normal: return "normal"
        case .embed: return "embed"
        case .bidiOverride: return "bidi-override"
        case .isolate: return "isolate"
        case .isolateOverride: return "isolate-override"
        case .plaintext: return "plaintext"
        case .global(let global): return global.description
        }
    }
}
