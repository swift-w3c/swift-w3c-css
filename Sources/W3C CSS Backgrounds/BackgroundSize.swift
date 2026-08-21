public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum BackgroundSize: Property {

    case contain

    case cover

    case auto

    case width(LengthPercentage)

    case size(LengthPercentage, LengthPercentage)

    case multiple([BackgroundSize])

    case global(Global)
}

extension BackgroundSize {
    public static let property: String = "background-size"
}

extension BackgroundSize: CustomStringConvertible {

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
extension BackgroundSize: LengthPercentageConvertible {
    public static func lengthPercentage(_ value: LengthPercentage) -> BackgroundSize {
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

extension BackgroundSize {

    public static let `default` = BackgroundSize.auto

    public static let autoSize = BackgroundSize.size(.auto, .auto)

    public static func values(_ sizes: [BackgroundSize]) -> BackgroundSize {
        if sizes.count == 1, case let size = sizes[0] {
            return size
        }
        return .multiple(sizes)
    }

    public static func values(_ sizes: BackgroundSize...) -> BackgroundSize {
        values(sizes)
    }
}
