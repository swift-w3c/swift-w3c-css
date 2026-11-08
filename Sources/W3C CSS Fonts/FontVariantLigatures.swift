public import W3C_CSS_Shared

public enum FontVariantLigatures: Property {

    case normal

    case none

    case options(Set<LigatureOption>)

    case global(Global)

    public init(_ options: Set<LigatureOption>) {
        if options.isEmpty {
            self = .normal
        } else {
            self = .options(options)
        }
    }

    public init(_ options: [LigatureOption]) {
        self.init(Set(options))
    }

    public init(_ options: LigatureOption...) {
        self.init(options)
    }
}

extension FontVariantLigatures {
    public static let property: String = "font-variant-ligatures"
}


extension FontVariantLigatures: CustomStringConvertible {

    public var description: String {
        switch self {
        case .normal:
            return "normal"

        case .none:
            return "none"

        case .options(let options):
            return options.map { $0.rawValue }.joined(separator: " ")

        case .global(let global):
            return global.description
        }
    }
}

extension FontVariantLigatures {

    public static var all: FontVariantLigatures {
        .options([.commonLigatures, .discretionaryLigatures, .historicalLigatures, .contextual])
    }

    public static var disableAll: FontVariantLigatures {
        .options([
            .noCommonLigatures, .noDiscretionaryLigatures, .noHistoricalLigatures, .noContextual,
        ])
    }

    public static var standard: FontVariantLigatures {
        .options([.commonLigatures, .contextual])
    }

    public static var historical: FontVariantLigatures {
        .options([.commonLigatures, .discretionaryLigatures, .historicalLigatures, .contextual])
    }
}
