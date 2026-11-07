public import W3C_CSS_Shared

public enum LigatureOption: String, Sendable, Hashable, CaseIterable {

    case commonLigatures = "common-ligatures"

    case noCommonLigatures = "no-common-ligatures"

    case discretionaryLigatures = "discretionary-ligatures"

    case noDiscretionaryLigatures = "no-discretionary-ligatures"

    case historicalLigatures = "historical-ligatures"

    case noHistoricalLigatures = "no-historical-ligatures"

    case contextual = "contextual"

    case noContextual = "no-contextual"
}
