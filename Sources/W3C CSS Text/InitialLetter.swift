public import W3C_CSS_Shared
import W3C_CSS_Values

public enum InitialLetter: Property {

    case normal

    case sized(size: Double, sink: Int?)

    case global(Global)
}

extension InitialLetter {
    public static let property: String = "initial-letter"
    public var description: String {
        switch self {
        case .normal:
            return "normal"

        case .sized(let size, let sink):
            if let sink {
                return "\(size) \(sink)"
            }
            return "\(size)"

        case .global(let global):
            return global.description
        }
    }
}

extension InitialLetter {

    public static func drop(size: Double) -> InitialLetter {
        .sized(size: size, sink: nil)
    }

    public static func raised(size: Double, sink: Int) -> InitialLetter {
        .sized(size: size, sink: sink)
    }
}
