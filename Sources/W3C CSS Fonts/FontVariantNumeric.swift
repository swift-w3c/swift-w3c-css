public import W3C_CSS_Shared

public enum FontVariantNumeric: Property {

    case normal

    case options(Set<NumericOption>)

    case global(Global)

    public init(_ options: Set<NumericOption>) {
        if options.isEmpty {
            self = .normal
        } else {
            self = .options(options)
        }
    }

    public init(_ options: [NumericOption]) {
        self.init(Set(options))
    }

    public init(_ options: NumericOption...) {
        self.init(options)
    }
}

extension FontVariantNumeric {
    public static let property: String = "font-variant-numeric"
}

public enum NumericOption: String, Sendable, Hashable, CaseIterable {

    case ordinal

    case slashedZero = "slashed-zero"

    case liningNums = "lining-nums"

    case oldstyleNums = "oldstyle-nums"

    case proportionalNums = "proportional-nums"

    case tabularNums = "tabular-nums"

    case diagonalFractions = "diagonal-fractions"

    case stackedFractions = "stacked-fractions"
}

extension FontVariantNumeric: CustomStringConvertible {

    public var description: String {
        switch self {
        case .normal:
            return "normal"

        case .options(let options):
            return options.map { $0.rawValue }.joined(separator: " ")

        case .global(let global):
            return global.description
        }
    }
}

extension FontVariantNumeric {

    public static var financial: FontVariantNumeric {
        .options([.liningNums, .tabularNums, .slashedZero])
    }

    public static var traditional: FontVariantNumeric {
        .options([.oldstyleNums, .proportionalNums])
    }

    public static var modern: FontVariantNumeric {
        .options([.liningNums, .proportionalNums])
    }

    public static var fractions: FontVariantNumeric {
        .options([.liningNums, .diagonalFractions])
    }

    public static var tabular: FontVariantNumeric {
        .options([.tabularNums, .liningNums])
    }
}
