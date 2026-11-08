public import W3C_CSS_Shared

public enum GridColumnValue: Sendable, Hashable, CustomStringConvertible {

    case auto

    case line(Int)

    case lineEnd(Int)

    case name(String)

    case span(Int)

    case spanTo(String)
}
