public import W3C_CSS_Shared
public import W3C_CSS_Values

public struct AutoFlow: Sendable, Hashable, CustomStringConvertible {

    let direction: AutoFlowDirection

    let density: AutoFlowDensity

    let trackSize: GridTrackSize?
}
