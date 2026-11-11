extension Compositing {

    public struct Premultiplied<Scalar: BinaryFloatingPoint> {

        public var color: Compositing.Color<Scalar>

        public var alpha: Scalar

        public init(color: Compositing.Color<Scalar>, alpha: Scalar) {
            self.color = color
            self.alpha = alpha
        }
    }
}

extension Compositing.Premultiplied: Sendable where Scalar: Sendable {}
extension Compositing.Premultiplied: Equatable {}
extension Compositing.Premultiplied: Hashable {}

extension Compositing.Premultiplied {

    public static var transparent: Self {
        .init(color: .black, alpha: 0)
    }

    public init(_ straight: Compositing.Straight<Scalar>) {
        let alpha = straight.alpha
        self.init(color: straight.color.map { $0 * alpha }, alpha: alpha)
    }

    public func composited(
        over backdrop: Self,
        operator: Compositing.Operator = .sourceOver,
        blend: BlendMode = .normal,
        coverage: Scalar = 1
    ) -> Self {
        let sourceAlpha = alpha * coverage
        let factor = `operator`.coefficients(source: sourceAlpha, backdrop: backdrop.alpha)
        let source: Compositing.Color<Scalar>
        if blend == .normal {
            source = color.map { $0 * coverage * factor.source }
        } else {
            let mixed = blend.mixed(backdrop: .init(backdrop), source: Compositing.Straight(self).color)
            source = mixed.map { $0 * sourceAlpha * factor.source }
        }
        return .init(
            color: source.combined(with: backdrop.color) { $0 + factor.backdrop * $1 },
            alpha: sourceAlpha * factor.source + backdrop.alpha * factor.backdrop
        )
    }
}
