public import W3C_CSS_Selectors
public import W3C_CSS_Shared

extension W3C.CSS.Selector.Pseudo.Class {
    /// Defined by HTML: an element whose popover is showing.
    public static let popoverOpen = Self("popover-open")

    /// Defined by HTML: a dialog or details element that is open.
    public static let open = Self("open")
}

extension W3C.CSS.Selector {
    public var hover: Self { pseudo(.hover) }

    public var active: Self { pseudo(.active) }

    public var focus: Self { pseudo(.focus) }

    public var focusVisible: Self { pseudo(.focusVisible) }

    public var focusWithin: Self { pseudo(.focusWithin) }

    public var firstChild: Self { pseudo(.firstChild) }

    public var lastChild: Self { pseudo(.lastChild) }

    public var checked: Self { pseudo(.checked) }

    public var disabled: Self { pseudo(.disabled) }

    public var popoverOpen: Self { pseudo(.popoverOpen) }
}
