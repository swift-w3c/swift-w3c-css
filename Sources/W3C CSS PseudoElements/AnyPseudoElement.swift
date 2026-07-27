/// A type-erased wrapper for any CSSPseudoElement.
///
/// `AnyPseudoElement` allows different concrete pseudo-element types to be used
/// interchangeably, stored in collections, and compared with each other.
///
/// Example:
/// ```swift
/// let elements: [AnyPseudoElement] = [
///     AnyPseudoElement(Before()),
///     AnyPseudoElement(After()),
///     AnyPseudoElement(Selection())
/// ]
/// ```
///
/// This type is particularly useful when you need to:
/// - Store different pseudo-element types in the same collection
/// - Compare pseudo-elements of different concrete types
/// - Pass pseudo-elements without knowing their specific type
public struct AnyPseudoElement: Sendable, Hashable, CustomStringConvertible {
    private let _description: String
    private let _hashValue: Int

    /// Creates a type-erased pseudo-element from any concrete pseudo-element type.
    public init<Element: CSSPseudoElement>(_ element: Element) {
        self._description = element.description
        self._hashValue = element.hashValue
    }
}

extension AnyPseudoElement {
    /// The CSS string representation of the pseudo-element.
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

// MARK: - Convenience Initializers

extension AnyPseudoElement {
    /// Creates a type-erased ::before pseudo-element.
    public static var before: AnyPseudoElement {
        AnyPseudoElement(Before())
    }

    /// Creates a type-erased ::after pseudo-element.
    public static var after: AnyPseudoElement {
        AnyPseudoElement(After())
    }

    /// Creates a type-erased ::first-line pseudo-element.
    public static var firstLine: AnyPseudoElement {
        AnyPseudoElement(FirstLine())
    }

    /// Creates a type-erased ::first-letter pseudo-element.
    public static var firstLetter: AnyPseudoElement {
        AnyPseudoElement(FirstLetter())
    }

    /// Creates a type-erased ::selection pseudo-element.
    public static var selection: AnyPseudoElement {
        AnyPseudoElement(Selection())
    }

    /// Creates a type-erased ::placeholder pseudo-element.
    public static var placeholder: AnyPseudoElement {
        AnyPseudoElement(Placeholder())
    }

    /// Creates a type-erased ::marker pseudo-element.
    public static var marker: AnyPseudoElement {
        AnyPseudoElement(Marker())
    }

    /// Creates a type-erased ::backdrop pseudo-element.
    public static var backdrop: AnyPseudoElement {
        AnyPseudoElement(Backdrop())
    }

    /// Creates a type-erased ::file-selector-button pseudo-element.
    public static var fileSelectorButton: AnyPseudoElement {
        AnyPseudoElement(FileSelectorButton())
    }
}
