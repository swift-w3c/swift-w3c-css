public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum MaskSize: Property {

    case contain

    case cover

    case auto

    case width(LengthPercentage)

    case size(LengthPercentage, LengthPercentage)

    case multiple([MaskSize])

    case global(Global)
}

extension MaskSize {
    public static let property: String = "mask-size"
}

extension MaskSize: CustomStringConvertible {

    public var description: String {
        switch self {
        case .contain:
            return "contain"

        case .cover:
            return "cover"

        case .auto:
            return "auto"

        case .width(let width):
            return width.description

        case .size(let width, let height):
            return "\(width) \(height)"

        case .multiple(let sizes):
            return sizes.map { $0.description }.joined(separator: ", ")

        case .global(let global):
            return global.description
        }
    }
}

extension MaskSize: LengthPercentageConvertible {
    public static func lengthPercentage(_ value: LengthPercentage) -> MaskSize {
        switch value {
        case .length(let length):
            return .width(.length(length))

        case .percentage(let percentage):
            return .width(.percentage(percentage))

        case .calc(let expression):

            return .width(.calc(expression))
        }
    }
}

extension MaskSize {

    public static let `default` = MaskSize.auto

    public static let autoSize = MaskSize.size(.auto, .auto)

    public static func values(_ sizes: [MaskSize]) -> MaskSize {
        if sizes.count == 1, case let size = sizes[0] {
            return size
        }
        return .multiple(sizes)
    }

    public static func values(_ sizes: MaskSize...) -> MaskSize {
        values(sizes)
    }
}
