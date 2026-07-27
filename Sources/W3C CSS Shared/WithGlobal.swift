//
//  WithGlobal.swift
//  swift-w3c-css
//
//  Created by Coen ten Thije Boonkkamp on 27/11/2025.
//

/// Generic sum type: `WithGlobal<T> = T + Global`
///
/// A reusable functor that adds CSS global values to any type.
/// In category theory terms, this is the coproduct of `T` with `Global`.
///
/// The type satisfies functor laws:
/// - Identity: `map(id) == id`
/// - Composition: `map(f).map(g) == map(f . g)`
///
/// Example:
/// ```swift
/// let color: WithGlobal<DarkModeColor> = .value(DarkModeColor(.red))
/// let global: WithGlobal<DarkModeColor> = .global(.inherit)
/// ```
public enum WithGlobal<T: Sendable & Hashable>: Sendable, Hashable {
    /// A concrete value of type `T`
    case value(T)
    /// A CSS global value (inherit, initial, unset, revert, revert-layer)
    case global(Global)

    /// Injection morphism: `T -> WithGlobal<T>`
    @inlinable
    public init(_ value: T) {
        self = .value(value)
    }

    /// Injection morphism: `Global -> WithGlobal<T>`
    @inlinable
    public init(_ global: Global) {
        self = .global(global)
    }

    /// Functor map: `(T -> U) -> (WithGlobal<T> -> WithGlobal<U>)`
    ///
    /// Applies the transformation function to the value case,
    /// while preserving global values unchanged.
    @inlinable
    public func map<U: Sendable & Hashable>(_ transform: (T) -> U) -> WithGlobal<U> {
        switch self {
        case .value(let t):
            return .value(transform(t))
        case .global(let g):
            return .global(g)
        }
    }

    /// Monad flatMap: `(T -> WithGlobal<U>) -> WithGlobal<U>`
    ///
    /// Allows chaining operations that themselves produce `WithGlobal` values.
    @inlinable
    public func flatMap<U: Sendable & Hashable>(_ transform: (T) -> WithGlobal<U>) -> WithGlobal<U>
    {
        switch self {
        case .value(let t):
            return transform(t)
        case .global(let g):
            return .global(g)
        }
    }
}

// MARK: - GlobalConvertible Conformance
//
// The enum case `global(Global)` satisfies the `GlobalConvertible` protocol
// requirement `static func global(_ global: Global) -> Self` via Swift 5.3's
// enum case protocol witness feature (SE-0280).

extension WithGlobal: GlobalConvertible {}

// MARK: - CustomStringConvertible

extension WithGlobal: CustomStringConvertible where T: CustomStringConvertible {
    public var description: String {
        switch self {
        case .value(let t):
            return t.description
        case .global(let g):
            return g.description
        }
    }
}
