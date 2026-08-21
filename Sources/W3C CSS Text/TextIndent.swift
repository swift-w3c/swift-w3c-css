public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum TextIndent: Property {

    case indent(value: LengthPercentage, eachLine: Bool, hanging: Bool)

    case global(Global)

    public init(value: LengthPercentage, eachLine: Bool = false, hanging: Bool = false) {
        self = .indent(value: value, eachLine: eachLine, hanging: hanging)
    }
}

extension TextIndent {
    public static let property: String = "text-indent"
    public var description: String {
        switch self {
        case .indent(let value, let eachLine, let hanging):
            var result = value.description

            if hanging {
                result += " hanging"
            }

            if eachLine {
                result += " each-line"
            }

            return result

        case .global(let global):
            return global.description
        }
    }
}

extension TextIndent {

    public static var zero: TextIndent {
        TextIndent(value: .px(0))
    }

    public static func em(
        _ value: Double,
        eachLine: Bool = false,
        hanging: Bool = false
    ) -> TextIndent {
        TextIndent(value: .em(value), eachLine: eachLine, hanging: hanging)
    }

    public static func px(
        _ value: Double,
        eachLine: Bool = false,
        hanging: Bool = false
    ) -> TextIndent {
        TextIndent(value: .px(value), eachLine: eachLine, hanging: hanging)
    }

    public static func percentage(
        _ value: Percentage,
        eachLine: Bool = false,
        hanging: Bool = false
    ) -> TextIndent {
        TextIndent(value: .percentage(value), eachLine: eachLine, hanging: hanging)
    }

    public static func hanging(_ value: LengthPercentage) -> TextIndent {
        TextIndent(value: value, hanging: true)
    }

    public static func eachLine(_ value: LengthPercentage) -> TextIndent {
        TextIndent(value: value, eachLine: true)
    }
}
