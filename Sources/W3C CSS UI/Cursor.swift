public import W3C_CSS_Shared
import W3C_CSS_Values

public indirect enum Cursor: Property {

    case auto

    case `default`

    case none

    case contextMenu

    case help

    case pointer

    case progress

    case wait

    case cell

    case crosshair

    case text

    case verticalText

    case alias

    case copy

    case move

    case noDrop

    case notAllowed

    case grab

    case grabbing

    case allScroll

    case colResize

    case rowResize

    case nResize
    case eResize
    case sResize
    case wResize
    case neResize
    case nwResize
    case seResize
    case swResize

    case ewResize
    case nsResize
    case neswResize
    case nwseResize

    case zoomIn

    case zoomOut

    case url(url: Url, fallback: Cursor = .auto)

    case urlWithCoordinates(url: Url, x: Int, y: Int, fallback: Cursor = .auto)

    case global(Global)
}

extension Cursor {
    public static let property: String = "cursor"

    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .default:
            return "default"

        case .none:
            return "none"

        case .contextMenu:
            return "context-menu"

        case .help:
            return "help"

        case .pointer:
            return "pointer"

        case .progress:
            return "progress"

        case .wait:
            return "wait"

        case .cell:
            return "cell"

        case .crosshair:
            return "crosshair"

        case .text:
            return "text"

        case .verticalText:
            return "vertical-text"

        case .alias:
            return "alias"

        case .copy:
            return "copy"

        case .move:
            return "move"

        case .noDrop:
            return "no-drop"

        case .notAllowed:
            return "not-allowed"

        case .grab:
            return "grab"

        case .grabbing:
            return "grabbing"

        case .allScroll:
            return "all-scroll"

        case .colResize:
            return "col-resize"

        case .rowResize:
            return "row-resize"

        case .nResize:
            return "n-resize"

        case .eResize:
            return "e-resize"

        case .sResize:
            return "s-resize"

        case .wResize:
            return "w-resize"

        case .neResize:
            return "ne-resize"

        case .nwResize:
            return "nw-resize"

        case .seResize:
            return "se-resize"

        case .swResize:
            return "sw-resize"

        case .ewResize:
            return "ew-resize"

        case .nsResize:
            return "ns-resize"

        case .neswResize:
            return "nesw-resize"

        case .nwseResize:
            return "nwse-resize"

        case .zoomIn:
            return "zoom-in"

        case .zoomOut:
            return "zoom-out"

        case .url(let url, let fallback):
            return "\(url), \(fallback)"

        case .urlWithCoordinates(let url, let x, let y, let fallback):
            return "\(url) \(x) \(y), \(fallback)"

        case .global(let value):
            return value.description
        }
    }
}
