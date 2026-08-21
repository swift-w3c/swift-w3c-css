public enum NamedColor: String, Sendable, Hashable, CaseIterable {

    case black, silver, gray, white, maroon, red, purple, fuchsia
    case green, lime, olive, yellow, navy, blue, teal, aqua

    case orange

    case rebeccapurple

    case aliceblue, antiquewhite, aquamarine, azure, beige, bisque, blanchedalmond
    case blueviolet, brown, burlywood, cadetblue, chartreuse, chocolate, coral
    case cornflowerblue, cornsilk, crimson, cyan, darkblue, darkcyan, darkgoldenrod
    case darkgray, darkgreen, darkgrey, darkkhaki, darkmagenta, darkolivegreen
    case darkorange, darkorchid, darkred, darksalmon, darkseagreen, darkslateblue
    case darkslategray, darkslategrey, darkturquoise, darkviolet, deeppink, deepskyblue
    case dimgray, dimgrey, dodgerblue, firebrick, floralwhite, forestgreen, gainsboro
    case ghostwhite, gold, goldenrod, greenyellow, grey, honeydew, hotpink, indianred
    case indigo, ivory, khaki, lavender, lavenderblush, lawngreen, lemonchiffon
    case lightblue, lightcoral, lightcyan, lightgoldenrodyellow, lightgray, lightgreen
    case lightgrey, lightpink, lightsalmon, lightseagreen, lightskyblue, lightslategray
    case lightslategrey, lightsteelblue, lightyellow, limegreen, linen, magenta
    case mediumaquamarine, mediumblue, mediumorchid, mediumpurple, mediumseagreen
    case mediumslateblue, mediumspringgreen, mediumturquoise, mediumvioletred
    case midnightblue, mintcream, mistyrose, moccasin, navajowhite, oldlace, olivedrab
    case orangered, orchid, palegoldenrod, palegreen, paleturquoise, palevioletred
    case papayawhip, peachpuff, peru, pink, plum, powderblue, rosybrown, royalblue
    case saddlebrown, salmon, sandybrown, seagreen, seashell, sienna, skyblue
    case slateblue, slategray, slategrey, snow, springgreen, steelblue, tan, thistle
    case tomato, turquoise, violet, wheat, whitesmoke, yellowgreen

    case transparent

    case currentColor = "currentColor"
}

extension NamedColor: CustomStringConvertible {

    public var description: String {
        return rawValue
    }
}

extension NamedColor {

    public static let current = NamedColor.currentColor
}
