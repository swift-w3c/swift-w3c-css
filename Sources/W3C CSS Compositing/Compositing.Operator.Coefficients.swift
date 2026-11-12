extension Compositing.Operator {

    public struct Coefficients<Scalar: BinaryFloatingPoint> {

        public var source: Scalar

        public var backdrop: Scalar

        @inlinable
        public init(source: Scalar, backdrop: Scalar) {
            self.source = source
            self.backdrop = backdrop
        }
    }
}

extension Compositing.Operator.Coefficients: Sendable where Scalar: Sendable {}
extension Compositing.Operator.Coefficients: Equatable {}
extension Compositing.Operator.Coefficients: Hashable {}
