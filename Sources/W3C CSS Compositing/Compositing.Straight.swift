extension Compositing {

    public struct Straight<Scalar: BinaryFloatingPoint> {

        public var color: Compositing.Color<Scalar>

        public var alpha: Scalar

        @inlinable
        public init(color: Compositing.Color<Scalar>, alpha: Scalar) {
            self.color = color
            self.alpha = alpha
        }
    }
}

extension Compositing.Straight: Sendable where Scalar: Sendable {}
extension Compositing.Straight: Equatable {}
extension Compositing.Straight: Hashable {}

extension Compositing.Straight {

    @inlinable
    public static var transparent: Self {
        .init(color: .black, alpha: 0)
    }

    @inlinable
    public init(_ premultiplied: Compositing.Premultiplied<Scalar>) {
        let alpha = premultiplied.alpha
        self.init(
            color: alpha == 0 ? .black : premultiplied.color.map { $0 / alpha },
            alpha: alpha
        )
    }

    @inlinable
    public func composited(
        over backdrop: Self,
        operator: Compositing.Operator = .sourceOver,
        blend: BlendMode = .normal,
        coverage: Scalar = 1
    ) -> Self {
        let sourceAlpha = alpha * coverage
        let factor = `operator`.coefficients(source: sourceAlpha, backdrop: backdrop.alpha)
        let mixed = blend.mixed(backdrop: backdrop, source: color)
        let source = sourceAlpha * factor.source
        let destination = backdrop.alpha * factor.backdrop
        return .init(
            .init(
                color: mixed.combined(with: backdrop.color) { source * $0 + destination * $1 },
                alpha: source + destination
            )
        )
    }
}
