import Format_Primitives
public import W3C_CSS_Values

public enum FilterFunction: Sendable, Hashable {

    case blur(Length)

    case brightness(Double)

    case contrast(Double)

    case dropShadow(offsetX: Length, offsetY: Length, blurRadius: Length?, color: Color?)

    case grayscale(Double)

    case hueRotate(Angle)

    case invert(Double)

    case opacity(Double)

    case saturate(Double)

    case sepia(Double)
}

extension FilterFunction: CustomStringConvertible {

    public var description: String {
        switch self {
        case .blur(let radius):
            return "blur(\(radius))"

        case .brightness(let amount):
            let value = formatNumberOrPercentage(amount)
            return "brightness(\(value))"

        case .contrast(let amount):
            let value = formatNumberOrPercentage(amount)
            return "contrast(\(value))"

        case .dropShadow(let offsetX, let offsetY, let blurRadius, let color):
            var shadow = "\(offsetX) \(offsetY)"

            if let blurRadius {
                shadow += " \(blurRadius)"
            }

            if let color {
                shadow += " \(color)"
            }

            return "drop-shadow(\(shadow))"

        case .grayscale(let amount):
            let value = formatNumberOrPercentage(amount)
            return "grayscale(\(value))"

        case .hueRotate(let angle):
            return "hue-rotate(\(angle))"

        case .invert(let amount):
            let value = formatNumberOrPercentage(amount)
            return "invert(\(value))"

        case .opacity(let amount):
            let value = formatNumberOrPercentage(amount)
            return "opacity(\(value))"

        case .saturate(let amount):
            let value = formatNumberOrPercentage(amount)
            return "saturate(\(value))"

        case .sepia(let amount):
            let value = formatNumberOrPercentage(amount)
            return "sepia(\(value))"
        }
    }

    private func formatNumberOrPercentage(_ value: Double) -> String {
        if value >= 0 && value <= 1 {

            let percentage = Percentage(value * 100)
            return percentage.description
        } else {

            return value.formatted(.number)
        }
    }
}
