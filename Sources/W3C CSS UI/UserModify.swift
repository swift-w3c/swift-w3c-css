public import W3C_CSS_Shared
import W3C_CSS_Values

public enum UserModify: Property {

    case readOnly

    case readWrite

    case readWritePlaintextOnly

    case writeOnly

    case global(Global)
}

extension UserModify {
    public static let property: String = "user-modify"

    public var description: String {
        switch self {
        case .readOnly: return "read-only"
        case .readWrite: return "read-write"
        case .readWritePlaintextOnly: return "read-write-plaintext-only"
        case .writeOnly: return "write-only"
        case .global(let global): return global.description
        }
    }
}
