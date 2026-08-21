public struct AnyPseudoElement: Sendable, Hashable, CustomStringConvertible {
    private let _description: String
    private let _hashValue: Int

    public init<Element: CSSPseudoElement>(_ element: Element) {
        self._description = element.description
        self._hashValue = element.hashValue
    }
}

extension AnyPseudoElement {

    public var description: String {
        _description
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(_description)
    }

    public static func == (lhs: AnyPseudoElement, rhs: AnyPseudoElement) -> Bool {
        lhs._description == rhs._description
    }
}

extension AnyPseudoElement {

    public static var before: AnyPseudoElement {
        AnyPseudoElement(Before())
    }

    public static var after: AnyPseudoElement {
        AnyPseudoElement(After())
    }

    public static var firstLine: AnyPseudoElement {
        AnyPseudoElement(FirstLine())
    }

    public static var firstLetter: AnyPseudoElement {
        AnyPseudoElement(FirstLetter())
    }

    public static var selection: AnyPseudoElement {
        AnyPseudoElement(Selection())
    }

    public static var placeholder: AnyPseudoElement {
        AnyPseudoElement(Placeholder())
    }

    public static var marker: AnyPseudoElement {
        AnyPseudoElement(Marker())
    }

    public static var backdrop: AnyPseudoElement {
        AnyPseudoElement(Backdrop())
    }

    public static var fileSelectorButton: AnyPseudoElement {
        AnyPseudoElement(FileSelectorButton())
    }
}
