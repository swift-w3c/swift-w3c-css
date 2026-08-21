public struct SystemColor: RawRepresentable, Sendable, Hashable {
    public var rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

extension SystemColor {

    public static let accentColor = SystemColor(rawValue: "AccentColor")

    public static let accentColorText = SystemColor(rawValue: "AccentColorText")

    public static let activeText = SystemColor(rawValue: "ActiveText")

    public static let buttonBorder = SystemColor(rawValue: "ButtonBorder")

    public static let buttonFace = SystemColor(rawValue: "ButtonFace")

    public static let buttonText = SystemColor(rawValue: "ButtonText")

    public static let canvas = SystemColor(rawValue: "Canvas")

    public static let canvasText = SystemColor(rawValue: "CanvasText")

    public static let field = SystemColor(rawValue: "Field")

    public static let fieldText = SystemColor(rawValue: "FieldText")

    public static let grayText = SystemColor(rawValue: "GrayText")

    public static let highlight = SystemColor(rawValue: "Highlight")

    public static let highlightText = SystemColor(rawValue: "HighlightText")

    public static let linkText = SystemColor(rawValue: "LinkText")

    public static let mark = SystemColor(rawValue: "Mark")

    public static let markText = SystemColor(rawValue: "MarkText")

    public static let selectedItem = SystemColor(rawValue: "SelectedItem")

    public static let selectedItemText = SystemColor(rawValue: "SelectedItemText")

    public static let visitedText = SystemColor(rawValue: "VisitedText")

    @available(*, deprecated, message: "Use buttonBorder instead")
    public static let activeBorder = SystemColor(rawValue: "ActiveBorder")

    @available(*, deprecated, message: "Use canvas instead")
    public static let activeCaption = SystemColor(rawValue: "ActiveCaption")

    @available(*, deprecated, message: "Use canvas instead")
    public static let appWorkspace = SystemColor(rawValue: "AppWorkspace")

    @available(*, deprecated, message: "Use canvas instead")
    public static let background = SystemColor(rawValue: "Background")

    @available(*, deprecated, message: "Use buttonFace instead")
    public static let buttonHighlight = SystemColor(rawValue: "ButtonHighlight")

    @available(*, deprecated, message: "Use buttonFace instead")
    public static let buttonShadow = SystemColor(rawValue: "ButtonShadow")

    @available(*, deprecated, message: "Use canvasText instead")
    public static let captionText = SystemColor(rawValue: "CaptionText")
}

extension SystemColor: CustomStringConvertible {

    public var description: String {
        return rawValue
    }
}
