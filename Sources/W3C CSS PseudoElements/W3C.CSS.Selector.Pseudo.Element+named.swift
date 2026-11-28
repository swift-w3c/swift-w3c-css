public import W3C_CSS_Selectors
public import W3C_CSS_Shared

extension W3C.CSS.Selector.Pseudo.Element {
    public static let before = Self("before")
    public static let after = Self("after")
    public static let firstLine = Self("first-line")
    public static let firstLetter = Self("first-letter")
    public static let marker = Self("marker")
    public static let placeholder = Self("placeholder")
    public static let selection = Self("selection")
    public static let backdrop = Self("backdrop")
    public static let fileSelectorButton = Self("file-selector-button")
    public static let detailsContent = Self("details-content")

    public static func viewTransitionGroup(_ name: String) -> Self { Self("view-transition-group", name) }

    public static func viewTransitionOld(_ name: String) -> Self { Self("view-transition-old", name) }

    public static func viewTransitionNew(_ name: String) -> Self { Self("view-transition-new", name) }
}

extension W3C.CSS.Selector {
    public static func pseudo(_ pseudo: Pseudo.Element) -> Self { Self(.init([.pseudoElement(pseudo)])) }

    public var before: Self { pseudo(.before) }

    public var after: Self { pseudo(.after) }
}
