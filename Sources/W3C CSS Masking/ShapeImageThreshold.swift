public import W3C_CSS_Shared
import W3C_CSS_Values

public enum ShapeImageThreshold: Property {

    case value(Double)

    case global(Global)
}

extension ShapeImageThreshold {
    public static let property: String = "shape-image-threshold"

    public var description: String {
        switch self {
        case .value(let threshold):

            let clampedValue = min(1.0, max(0.0, threshold))
            return String(clampedValue)

        case .global(let global):
            return global.description
        }
    }

    public static func alpha(_ threshold: Double) -> Self {
        .value(threshold)
    }
}
