public import W3C_CSS_Shared
import W3C_CSS_Values

public enum AnimationName: Property {

    case none

    case keyframes(KeyFramesName)

    case global(Global)
}

extension AnimationName {
    public static let property: String = "animation-name"
}

extension AnimationName {
    public enum KeyFramesName: Sendable, Hashable, CustomStringConvertible {
        case customIdent(Ident)
        case string(CSSString)

        public init(_ string: String) {
            self = .customIdent(.init(string))
        }
    }
}

extension AnimationName.KeyFramesName {
    public var description: String {
        switch self {
        case .customIdent(let ident):
            ident.description

        case .string(let cSSString):
            cSSString.description
        }
    }
}

extension AnimationName: CustomStringConvertible {

    public var description: String {
        switch self {
        case .none:
            return "none"

        case .keyframes(let name):
            return name.description

        case .global(let global):
            return global.description
        }
    }
}

extension AnimationName: ExpressibleByStringLiteral {

    public init(stringLiteral value: String) {
        if value.lowercased() == "none" {
            self = .none
        } else if value.starts(with: "\"") && value.hasSuffix("\"") {

            let trimmed = String(value.dropFirst().dropLast())
            self = .keyframes(.string(.init(trimmed)))
        } else if value.starts(with: "'") && value.hasSuffix("'") {

            let trimmed = String(value.dropFirst().dropLast())
            self = .keyframes(.string(.init(trimmed)))
        } else {

            self = .keyframes(.customIdent(.init(value)))
        }
    }
}
