extension BlendMode {

    @inlinable
    public var isSeparable: Bool {
        switch self {
        case .hue, .saturation, .color, .luminosity: false
        default: true
        }
    }

    @inlinable
    public func blend<Scalar: BinaryFloatingPoint>(backdrop: Scalar, source: Scalar) -> Scalar? {
        let result: Scalar
        switch self {
        case .normal:
            result = source

        case .multiply:
            result = backdrop * source

        case .screen:
            result = backdrop + source - backdrop * source

        case .overlay:
            result = Self.hardLight(backdrop: source, source: backdrop)

        case .darken:
            result = min(backdrop, source)

        case .lighten:
            result = max(backdrop, source)

        case .colorDodge:
            result =
                if backdrop == 0 {
                    0
                } else if source == 1 {
                    1
                } else {
                    min(1, backdrop / (1 - source))
                }

        case .colorBurn:
            result =
                if backdrop == 1 {
                    1
                } else if source == 0 {
                    0
                } else {
                    1 - min(1, (1 - backdrop) / source)
                }

        case .hardLight:
            result = Self.hardLight(backdrop: backdrop, source: source)

        case .softLight:
            if source <= 0.5 {
                result = backdrop - (1 - 2 * source) * backdrop * (1 - backdrop)
            } else {
                let lightened =
                    if backdrop <= 0.25 {
                        ((16 * backdrop - 12) * backdrop + 4) * backdrop
                    } else {
                        backdrop.squareRoot()
                    }
                result = backdrop + (2 * source - 1) * (lightened - backdrop)
            }

        case .difference:
            result = abs(backdrop - source)

        case .exclusion:
            result = backdrop + source - 2 * backdrop * source

        case .hue, .saturation, .color, .luminosity:
            return nil
        }
        return Self.clamped(result)
    }

    @inlinable
    public func blend<Scalar>(
        backdrop: Compositing.Color<Scalar>,
        source: Compositing.Color<Scalar>
    ) -> Compositing.Color<Scalar> {
        let result: Compositing.Color<Scalar>
        switch self {
        case .hue:
            result = source.saturation(backdrop.saturation).luminosity(backdrop.luminosity)

        case .saturation:
            result = backdrop.saturation(source.saturation).luminosity(backdrop.luminosity)

        case .color:
            result = source.luminosity(backdrop.luminosity)

        case .luminosity:
            result = backdrop.luminosity(source.luminosity)

        default:
            return backdrop.combined(with: source) { blend(backdrop: $0, source: $1) ?? $1 }
        }
        return result.map(Self.clamped)
    }
}

extension BlendMode {

    @inlinable
    func mixed<Scalar>(
        backdrop: Compositing.Straight<Scalar>,
        source: Compositing.Color<Scalar>
    ) -> Compositing.Color<Scalar> {
        guard self != .normal else { return source }
        let blended = blend(backdrop: backdrop.color, source: source)
        return source.combined(with: blended) { (1 - backdrop.alpha) * $0 + backdrop.alpha * $1 }
    }

    @inlinable
    static func hardLight<Scalar: BinaryFloatingPoint>(backdrop: Scalar, source: Scalar) -> Scalar {
        if source <= 0.5 {
            backdrop * (2 * source)
        } else {
            backdrop + (2 * source - 1) - backdrop * (2 * source - 1)
        }
    }

    @inlinable
    static func clamped<Scalar: BinaryFloatingPoint>(_ value: Scalar) -> Scalar {
        min(1, max(0, value))
    }
}
