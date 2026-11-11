extension Compositing {

    public struct Color<Scalar: BinaryFloatingPoint> {

        public var red: Scalar

        public var green: Scalar

        public var blue: Scalar

        public init(red: Scalar, green: Scalar, blue: Scalar) {
            self.red = red
            self.green = green
            self.blue = blue
        }
    }
}

extension Compositing.Color: Sendable where Scalar: Sendable {}
extension Compositing.Color: Equatable {}
extension Compositing.Color: Hashable {}

extension Compositing.Color {

    public static var black: Self {
        .init(red: 0, green: 0, blue: 0)
    }

    public static var white: Self {
        .init(red: 1, green: 1, blue: 1)
    }

    public init(gray: Scalar) {
        self.init(red: gray, green: gray, blue: gray)
    }

    public func map<E: Swift.Error>(_ transform: (Scalar) throws(E) -> Scalar) throws(E) -> Self {
        .init(red: try transform(red), green: try transform(green), blue: try transform(blue))
    }

    public func combined<E: Swift.Error>(
        with other: Self,
        _ combine: (Scalar, Scalar) throws(E) -> Scalar
    ) throws(E) -> Self {
        .init(
            red: try combine(red, other.red),
            green: try combine(green, other.green),
            blue: try combine(blue, other.blue)
        )
    }
}

extension Compositing.Color {

    public var luminosity: Scalar {
        0.3 * red + 0.59 * green + 0.11 * blue
    }

    public var saturation: Scalar {
        max(red, green, blue) - min(red, green, blue)
    }

    public func clipped() -> Self {
        let luminosity = luminosity
        let lowest = min(red, green, blue)
        let highest = max(red, green, blue)
        var color = self
        if lowest < 0 {
            color = color.map { luminosity + (($0 - luminosity) * luminosity) / (luminosity - lowest) }
        }
        if highest > 1 {
            color = color.map { luminosity + (($0 - luminosity) * (1 - luminosity)) / (highest - luminosity) }
        }
        return color
    }

    public func luminosity(_ luminosity: Scalar) -> Self {
        let difference = luminosity - self.luminosity
        return map { $0 + difference }.clipped()
    }

    public func saturation(_ saturation: Scalar) -> Self {
        let lowest = min(red, green, blue)
        let highest = max(red, green, blue)
        guard highest > lowest else { return .black }
        return map { component in
            if component == highest {
                saturation
            } else if component == lowest {
                0
            } else {
                ((component - lowest) * saturation) / (highest - lowest)
            }
        }
    }
}
