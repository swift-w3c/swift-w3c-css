public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum BlockSize: Property {

    case auto

    case lengthPercentage(LengthPercentage)

    case minContent

    case maxContent

    case fitContent

    case fitContentLength(LengthPercentage)

    case global(Global)
}

extension BlockSize {
    public static let property: String = "block-size"
}

extension BlockSize: CustomStringConvertible {

    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description

        case .minContent:
            return "min-content"

        case .maxContent:
            return "max-content"

        case .fitContent:
            return "fit-content"

        case .fitContentLength(let length):
            return "fit-content(\(length))"

        case .global(let global):
            return global.description
        }
    }
}

extension BlockSize {

    public static func fitContentPx(_ px: Double) -> BlockSize {
        .fitContentLength(.px(px))
    }

    public static func fitContentPercent(_ percentage: Percentage) -> BlockSize {
        .fitContentLength(.percentage(percentage))
    }
}
