import W3C_CSS_Color
public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum ScrollbarColor: Property {

    case auto

    case colors(thumb: W3C_CSS_Values.Color, track: W3C_CSS_Values.Color)

    case global(Global)

}

extension ScrollbarColor {
    public static let property: String = "scrollbar-color"

    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .colors(let thumb, let track):
            return "\(thumb.description) \(track.description)"

        case .global(let global):
            return global.description
        }
    }

    public static func named(thumb: NamedColor, track: NamedColor) -> Self {
        .colors(thumb: .named(thumb), track: .named(track))
    }

    public static func hex(thumb: String, track: String) -> Self {
        .colors(thumb: .hex(thumb), track: .hex(track))
    }

    public static func rgb(
        thumbR: Int,
        thumbG: Int,
        thumbB: Int,
        trackR: Int,
        trackG: Int,
        trackB: Int
    ) -> Self {
        .colors(
            thumb: .rgb(thumbR, thumbG, thumbB),
            track: .rgb(trackR, trackG, trackB)
        )
    }
}
