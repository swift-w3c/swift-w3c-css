import W3C_CSS_Shared
public import W3C_CSS_Values

public enum EasingFunction: Sendable, Hashable {

    case linear

    case linearPoints([LinearPoint])

    case ease

    case easeIn

    case easeOut

    case easeInOut

    case cubicBezier(Double, Double, Double, Double)

    case stepStart

    case stepEnd

    case steps(Int, StepPosition?)
}

public struct LinearPoint: Sendable, Hashable {

    public let value: Double

    public let percentage: Percentage?

    public init(value: Double, percentage: Percentage? = nil) {
        self.value = value
        self.percentage = percentage
    }
}

public enum StepPosition: String, Sendable, Hashable, CustomStringConvertible {

    case start

    case end

    case jumpStart = "jump-start"

    case jumpEnd = "jump-end"

    case jumpNone = "jump-none"

    case jumpBoth = "jump-both"
}

extension StepPosition {
    public var description: String {
        rawValue
    }
}

extension EasingFunction: CustomStringConvertible {

    public var description: String {
        switch self {
        case .linear:
            return "linear"

        case .linearPoints(let points):
            let pointsString = points.map { point in
                if let percentage = point.percentage {
                    return "\(point.value.formatted(.number)) \(percentage.description)"
                } else {
                    return point.value.formatted(.number)
                }
            }.joined(separator: ", ")
            return "linear(\(pointsString))"

        case .ease:
            return "ease"

        case .easeIn:
            return "ease-in"

        case .easeOut:
            return "ease-out"

        case .easeInOut:
            return "ease-in-out"

        case .cubicBezier(let x1, let y1, let x2, let y2):
            return
                "cubic-bezier(\(x1.formatted(.number)), \(y1.formatted(.number)), \(x2.formatted(.number)), \(y2.formatted(.number)))"

        case .stepStart:
            return "step-start"

        case .stepEnd:
            return "step-end"

        case .steps(let steps, let position):
            if let position {
                return "steps(\(steps), \(position))"
            } else {
                return "steps(\(steps))"
            }
        }
    }
}
