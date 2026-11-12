extension Compositing {

    public enum Operator: String, Sendable, Hashable, CaseIterable {

        case clear

        case copy

        case destination

        case sourceOver = "source-over"

        case destinationOver = "destination-over"

        case sourceIn = "source-in"

        case destinationIn = "destination-in"

        case sourceOut = "source-out"

        case destinationOut = "destination-out"

        case sourceAtop = "source-atop"

        case destinationAtop = "destination-atop"

        case xor

        case lighter
    }
}

extension Compositing.Operator: CustomStringConvertible {

    @inlinable
    public var description: String {
        rawValue
    }
}

extension Compositing.Operator {

    @inlinable
    public func coefficients<Scalar: BinaryFloatingPoint>(
        source: Scalar,
        backdrop: Scalar
    ) -> Coefficients<Scalar> {
        switch self {
        case .clear: .init(source: 0, backdrop: 0)
        case .copy: .init(source: 1, backdrop: 0)
        case .destination: .init(source: 0, backdrop: 1)
        case .sourceOver: .init(source: 1, backdrop: 1 - source)
        case .destinationOver: .init(source: 1 - backdrop, backdrop: 1)
        case .sourceIn: .init(source: backdrop, backdrop: 0)
        case .destinationIn: .init(source: 0, backdrop: source)
        case .sourceOut: .init(source: 1 - backdrop, backdrop: 0)
        case .destinationOut: .init(source: 0, backdrop: 1 - source)
        case .sourceAtop: .init(source: backdrop, backdrop: 1 - source)
        case .destinationAtop: .init(source: 1 - backdrop, backdrop: source)
        case .xor: .init(source: 1 - backdrop, backdrop: 1 - source)
        case .lighter: .init(source: 1, backdrop: 1)
        }
    }

    @inlinable
    public func alpha<Scalar: BinaryFloatingPoint>(source: Scalar, backdrop: Scalar) -> Scalar {
        let factor = coefficients(source: source, backdrop: backdrop)
        return source * factor.source + backdrop * factor.backdrop
    }
}
