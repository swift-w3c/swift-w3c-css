public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum StrokeDasharray: Property {

    case none

    case numbers([Double])

    case lengths([Length])

    case percentages([Percentage])

    case lengthPercentages([LengthPercentage])

    case global(Global)

    public init(_ values: [Double]) {
        self = .numbers(values)
    }

    public init(_ values: [Length]) {
        self = .lengths(values)
    }

    public init(_ values: [Percentage]) {
        self = .percentages(values)
    }

    public init(_ values: [LengthPercentage]) {
        self = .lengthPercentages(values)
    }
}

extension StrokeDasharray {
    public static let property: String = "stroke-dasharray"

    public var description: String {
        switch self {
        case .none:
            return "none"

        case .numbers(let values):
            return values.map { String($0) }.joined(separator: ", ")

        case .lengths(let values):
            return values.map { $0.description }.joined(separator: ", ")

        case .percentages(let values):
            return values.map { $0.description }.joined(separator: ", ")

        case .lengthPercentages(let values):
            return values.map { $0.description }.joined(separator: ", ")

        case .global(let global):
            return global.description
        }
    }
}
