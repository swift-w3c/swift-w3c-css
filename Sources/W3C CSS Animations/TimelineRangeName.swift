public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum TimelineRangeName: String, Sendable, Hashable, CaseIterable {

    case cover

    case contain

    case entry

    case exit

    case entryCrossing = "entry-crossing"

    case exitCrossing = "exit-crossing"
}
