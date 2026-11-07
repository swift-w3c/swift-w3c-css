import W3C_CSS_Shared
public import W3C_CSS_Values

public enum StepPosition: String, Sendable, Hashable, CustomStringConvertible {

    case start

    case end

    case jumpStart = "jump-start"

    case jumpEnd = "jump-end"

    case jumpNone = "jump-none"

    case jumpBoth = "jump-both"
}
