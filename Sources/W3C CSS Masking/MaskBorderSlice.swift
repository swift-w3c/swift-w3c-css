public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum MaskBorderSlice: Property {

    case all(SliceValue, fill: Bool)

    case verticalHorizontal(SliceValue, SliceValue, fill: Bool)

    case topHorizontalBottom(SliceValue, SliceValue, SliceValue, fill: Bool)

    case topRightBottomLeft(SliceValue, SliceValue, SliceValue, SliceValue, fill: Bool)

    case global(Global)

    public init(_ value: SliceValue, fill: Bool = false) {
        self = .all(value, fill: fill)
    }

    public init(_ vertical: SliceValue, _ horizontal: SliceValue, fill: Bool = false) {
        self = .verticalHorizontal(vertical, horizontal, fill: fill)
    }

    public init(
        _ top: SliceValue,
        _ horizontal: SliceValue,
        _ bottom: SliceValue,
        fill: Bool = false
    ) {
        self = .topHorizontalBottom(top, horizontal, bottom, fill: fill)
    }

    public init(
        _ top: SliceValue,
        _ right: SliceValue,
        _ bottom: SliceValue,
        _ left: SliceValue,
        fill: Bool = false
    ) {
        self = .topRightBottomLeft(top, right, bottom, left, fill: fill)
    }
}

extension MaskBorderSlice {
    public static let property: String = "mask-border-slice"

    public enum SliceValue: Sendable, Hashable, CustomStringConvertible {

        case number(Number)

        case percentage(Percentage)
    }

    public static func number(_ number: Number, fill: Bool = false) -> MaskBorderSlice {
        return MaskBorderSlice(.number(number), fill: fill)
    }

    public static func percentage(_ value: Percentage, fill: Bool = false) -> MaskBorderSlice {
        return MaskBorderSlice(.percentage(value), fill: fill)
    }

    public static let `default` = MaskBorderSlice(.number(0))
}

extension MaskBorderSlice.SliceValue {

    public var description: String {
        switch self {
        case .number(let number):
            return number.description

        case .percentage(let percentage):
            return percentage.description
        }
    }
}

extension MaskBorderSlice: CustomStringConvertible {

    public var description: String {
        switch self {
        case .all(let value, let fill):
            return combineWithFill(value.description, fill)

        case .verticalHorizontal(let vertical, let horizontal, let fill):
            let values = "\(vertical.description) \(horizontal.description)"
            return combineWithFill(values, fill)

        case .topHorizontalBottom(let top, let horizontal, let bottom, let fill):
            let values = "\(top.description) \(horizontal.description) \(bottom.description)"
            return combineWithFill(values, fill)

        case .topRightBottomLeft(let top, let right, let bottom, let left, let fill):
            let values =
                "\(top.description) \(right.description) \(bottom.description) \(left.description)"
            return combineWithFill(values, fill)

        case .global(let global):
            return global.description
        }
    }

    private func combineWithFill(_ values: String, _ fill: Bool) -> String {
        return fill ? "\(values) fill" : values
    }
}
