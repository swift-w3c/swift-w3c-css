public import W3C_CSS_Shared
import W3C_CSS_Values

public enum Appearance: Property {

    case none

    case auto

    case menulistButton

    case textfield

    case compat(CompatAuto)

    case global(Global)
}

public enum CompatAuto: String, Sendable, Hashable, CaseIterable {

    case button

    case checkbox

    case listbox

    case menulist

    case meter

    case progressBar = "progress-bar"

    case pushButton = "push-button"

    case radio

    case searchfield

    case sliderHorizontal = "slider-horizontal"

    case squareButton = "square-button"

    case textarea
}

extension Appearance {
    public static let property: String = "appearance"
}

extension Appearance: CustomStringConvertible {

    public var description: String {
        switch self {
        case .none:
            return "none"

        case .auto:
            return "auto"

        case .menulistButton:
            return "menulist-button"

        case .textfield:
            return "textfield"

        case .compat(let compat):
            return compat.rawValue

        case .global(let global):
            return global.description
        }
    }
}
