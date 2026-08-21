public import W3C_CSS_Values

public enum Gradient: Sendable, Hashable {

    case linear(
        direction: Direction?,
        colorStops: [ColorStop],
        interpolation: ColorInterpolationMethod? = nil
    )

    case repeatingLinear(
        direction: Direction?,
        colorStops: [ColorStop],
        interpolation: ColorInterpolationMethod? = nil
    )

    case radial(
        options: RadialOptions?,
        colorStops: [ColorStop],
        interpolation: ColorInterpolationMethod? = nil
    )

    case repeatingRadial(
        options: RadialOptions?,
        colorStops: [ColorStop],
        interpolation: ColorInterpolationMethod? = nil
    )

    case conic(
        angle: Angle?,
        at: Position?,
        colorStops: [ColorStop],
        interpolation: ColorInterpolationMethod? = nil
    )

    case repeatingConic(
        angle: Angle?,
        at: Position?,
        colorStops: [ColorStop],
        interpolation: ColorInterpolationMethod? = nil
    )
}

extension Gradient {

    public enum Direction: Sendable, Hashable, AngleConvertible {

        case angle(Angle)

        case to(Side)
    }
}

extension Gradient.Direction {

    public enum Side: String, Sendable, Hashable, CaseIterable {

        case top

        case right

        case bottom

        case left

        case topRight = "top right"

        case bottomRight = "bottom right"

        case bottomLeft = "bottom left"

        case topLeft = "top left"
    }
}

extension Gradient {

    public struct ColorStop: Sendable, Hashable {

        public let color: Color

        public let position: LengthPercentage?

        public init(_ color: W3C_CSS_Values.Color, at position: LengthPercentage? = nil) {
            self.color = color
            self.position = position
        }
    }
}

extension Gradient {

    public struct RadialOptions: Sendable, Hashable {

        public let shape: Shape?

        public let size: Size?

        public let position: Position?

        public init(shape: Shape? = nil, size: Size? = nil, at position: Position? = nil) {
            self.shape = shape
            self.size = size
            self.position = position
        }
    }
}

extension Gradient.RadialOptions {

    public enum Shape: String, Sendable, Hashable {

        case circle

        case ellipse
    }
}

extension Gradient.RadialOptions {

    public enum Size: Sendable, Hashable {

        case keyword(Keyword)

        case explicit(radius: LengthPercentage)

        case elliptical(radiusX: LengthPercentage, radiusY: LengthPercentage)
    }
}

extension Gradient.RadialOptions.Size {

    public enum Keyword: String, Sendable, Hashable {

        case closestSide = "closest-side"

        case closestCorner = "closest-corner"

        case farthestSide = "farthest-side"

        case farthestCorner = "farthest-corner"
    }
}

extension Gradient: CustomStringConvertible {

    public var description: String {
        switch self {
        case .linear(let direction, let colorStops, let interpolation):
            var result = "linear-gradient("

            if let interpolation {
                result += "\(interpolation), "
            }

            if let direction {
                switch direction {
                case .angle(let angle):
                    result += "\(angle), "

                case .to(let side):
                    result += "to \(side.rawValue), "
                }
            }

            result += formatColorStops(colorStops)
            result += ")"
            return result

        case .repeatingLinear(let direction, let colorStops, let interpolation):
            var result = "repeating-linear-gradient("

            if let interpolation {
                result += "\(interpolation), "
            }

            if let direction {
                switch direction {
                case .angle(let angle):
                    result += "\(angle), "

                case .to(let side):
                    result += "to \(side.rawValue), "
                }
            }

            result += formatColorStops(colorStops)
            result += ")"
            return result

        case .radial(let options, let colorStops, let interpolation):
            var result = "radial-gradient("

            if let interpolation {
                result += "\(interpolation), "
            }

            if let options {
                var optionsString = ""

                if let shape = options.shape {
                    optionsString += shape.rawValue
                    if options.size != nil {
                        optionsString += " "
                    }
                }

                if let size = options.size {
                    switch size {
                    case .keyword(let keyword):
                        optionsString += keyword.rawValue

                    case .explicit(let radius):
                        optionsString += "\(radius)"

                    case .elliptical(let radiusX, let radiusY):
                        optionsString += "\(radiusX) \(radiusY)"
                    }
                }

                if let position = options.position {
                    if !optionsString.isEmpty {
                        optionsString += " "
                    }
                    optionsString += "at \(position)"
                }

                if !optionsString.isEmpty {
                    result += optionsString + ", "
                }
            }

            result += formatColorStops(colorStops)
            result += ")"
            return result

        case .repeatingRadial(let options, let colorStops, let interpolation):
            var result = "repeating-radial-gradient("

            if let interpolation {
                result += "\(interpolation), "
            }

            if let options {
                var optionsString = ""

                if let shape = options.shape {
                    optionsString += shape.rawValue
                    if options.size != nil {
                        optionsString += " "
                    }
                }

                if let size = options.size {
                    switch size {
                    case .keyword(let keyword):
                        optionsString += keyword.rawValue

                    case .explicit(let radius):
                        optionsString += "\(radius)"

                    case .elliptical(let radiusX, let radiusY):
                        optionsString += "\(radiusX) \(radiusY)"
                    }
                }

                if let position = options.position {
                    if !optionsString.isEmpty {
                        optionsString += " "
                    }
                    optionsString += "at \(position)"
                }

                if !optionsString.isEmpty {
                    result += optionsString + ", "
                }
            }

            result += formatColorStops(colorStops)
            result += ")"
            return result

        case .conic(let angle, let position, let colorStops, let interpolation):
            var result = "conic-gradient("

            if let interpolation {
                result += "\(interpolation), "
            }

            if let angle {
                result += "from \(angle), "
            }

            if let position {
                result += "at \(position), "
            }

            result += formatColorStops(colorStops)
            result += ")"
            return result

        case .repeatingConic(let angle, let position, let colorStops, let interpolation):
            var result = "repeating-conic-gradient("

            if let interpolation {
                result += "\(interpolation), "
            }

            if let angle {
                result += "from \(angle), "
            }

            if let position {
                result += "at \(position), "
            }

            result += formatColorStops(colorStops)
            result += ")"
            return result
        }
    }

    private func formatColorStops(_ stops: [ColorStop]) -> String {
        return stops.map { stop in
            if let position = stop.position {
                return "\(stop.color) \(position)"
            } else {
                return stop.color.description
            }
        }.joined(separator: ", ")
    }
}

extension Gradient {

    public static func linearGradient(to side: Direction.Side, colors: [Color]) -> Gradient {
        return .linear(
            direction: .to(side),
            colorStops: colors.map { ColorStop($0) }
        )
    }

    public static func linearGradient(angle: Angle, colors: [Color]) -> Gradient {
        return .linear(
            direction: .angle(angle),
            colorStops: colors.map { ColorStop($0) }
        )
    }

    public static func radialGradient(colors: [Color]) -> Gradient {
        return .radial(
            options: nil,
            colorStops: colors.map { ColorStop($0) }
        )
    }

    public static func radialGradient(
        shape: RadialOptions.Shape,
        size: RadialOptions.Size? = nil,
        at position: Position? = nil,
        colors: [Color]
    ) -> Gradient {
        return .radial(
            options: RadialOptions(shape: shape, size: size, at: position),
            colorStops: colors.map { ColorStop($0) }
        )
    }

    public static func conicGradient(colors: [Color]) -> Gradient {
        return .conic(
            angle: nil,
            at: nil,
            colorStops: colors.map { ColorStop($0) }
        )
    }

    public static func conicGradient(
        from angle: Angle? = nil,
        at position: Position? = nil,
        colors: [Color]
    ) -> Gradient {
        return .conic(
            angle: angle,
            at: position,
            colorStops: colors.map { ColorStop($0) }
        )
    }
}
