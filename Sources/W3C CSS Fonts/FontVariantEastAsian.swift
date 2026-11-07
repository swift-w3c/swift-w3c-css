public import W3C_CSS_Shared

public enum FontVariantEastAsian: Property {

    case normal

    case single(EastAsianVariantValue)

    case combined(Set<EastAsianVariantValue>)

    case global(Global)

    public init(_ values: Set<EastAsianVariantValue>) {
        if values.isEmpty {
            self = .normal
        } else if values.count == 1, let value = values.first {
            self = .single(value)
        } else {
            self = .combined(values)
        }
    }

    public init(_ values: [EastAsianVariantValue]) {
        self.init(Set(values))
    }

    public init(_ values: EastAsianVariantValue...) {
        self.init(values)
    }
}

extension FontVariantEastAsian {
    public static let property: String = "font-variant-east-asian"
}

public enum EastAsianVariantValue: String, Sendable, Hashable, CaseIterable {

    case ruby

    case jis78

    case jis83

    case jis90

    case jis04

    case simplified

    case traditional

    case fullWidth = "full-width"

    case proportionalWidth = "proportional-width"
}

extension FontVariantEastAsian: CustomStringConvertible {

    public var description: String {
        switch self {
        case .normal:
            return "normal"

        case .single(let value):
            return value.rawValue

        case .combined(let values):
            return values.map { $0.rawValue }.joined(separator: " ")

        case .global(let global):
            return global.description
        }
    }
}

extension FontVariantEastAsian {

    public static var rubyTraditional: FontVariantEastAsian {
        .combined([.ruby, .traditional])
    }

    public static var rubySimplified: FontVariantEastAsian {
        .combined([.ruby, .simplified])
    }

    public static var fullWidthJis90: FontVariantEastAsian {
        .combined([.fullWidth, .jis90])
    }

    public static var rubyFullWidthJis04: FontVariantEastAsian {
        .combined([.ruby, .fullWidth, .jis04])
    }
}
