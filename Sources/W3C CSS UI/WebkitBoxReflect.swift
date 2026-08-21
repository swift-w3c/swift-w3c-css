public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum WebkitBoxReflect: Property {

    case none

    case above(Length? = nil, mask: ReflectionMask? = nil)

    case below(Length? = nil, mask: ReflectionMask? = nil)

    case left(Length? = nil, mask: ReflectionMask? = nil)

    case right(Length? = nil, mask: ReflectionMask? = nil)

    case global(Global)
}

extension WebkitBoxReflect {
    public static let property: String = "-webkit-box-reflect"

    public enum ReflectionMask: Sendable, Hashable {

        case linearGradient(CSSString)

        case radialGradient(CSSString)

        case url(Url)
    }

    public var description: String {
        switch self {
        case .none:
            return "none"

        case .above(let offset, let mask):
            return buildDirectionString("above", offset, mask)

        case .below(let offset, let mask):
            return buildDirectionString("below", offset, mask)

        case .left(let offset, let mask):
            return buildDirectionString("left", offset, mask)

        case .right(let offset, let mask):
            return buildDirectionString("right", offset, mask)

        case .global(let global):
            return global.description
        }
    }

    private func buildDirectionString(
        _ direction: String,
        _ offset: Length?,
        _ mask: ReflectionMask?
    ) -> String {
        var parts = [direction]

        if let offset {
            parts.append(offset.description)
        }

        if let mask {
            parts.append(maskDescription(mask))
        }

        return parts.joined(separator: " ")
    }

    private func maskDescription(_ mask: ReflectionMask) -> String {
        switch mask {
        case .linearGradient(let value):
            return "linear-gradient(\(value))"

        case .radialGradient(let value):
            return "radial-gradient(\(value))"

        case .url(let url):
            return url.description
        }
    }
}
