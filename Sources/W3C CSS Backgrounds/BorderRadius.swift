public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum BorderRadius: Property {

    case values(Values)

    case global(Global)
}

extension BorderRadius {

    public struct Values: Sendable, Hashable, CustomStringConvertible {

        public let horizontal: [LengthPercentage]

        public let vertical: [LengthPercentage]?

        public init(horizontal: [LengthPercentage], vertical: [LengthPercentage]? = nil) {
            self.horizontal = Values.expandRadii(horizontal)
            self.vertical = vertical.map(Values.expandRadii)
        }

        public init(_ radius: LengthPercentage) {
            self.init(horizontal: [radius])
        }

        public init(_ first: LengthPercentage, _ second: LengthPercentage) {
            self.init(horizontal: [first, second])
        }

        public init(
            _ first: LengthPercentage,
            _ second: LengthPercentage,
            _ third: LengthPercentage
        ) {
            self.init(horizontal: [first, second, third])
        }

        public init(
            _ topLeft: LengthPercentage,
            _ topRight: LengthPercentage,
            _ bottomRight: LengthPercentage,
            _ bottomLeft: LengthPercentage
        ) {
            self.init(horizontal: [topLeft, topRight, bottomRight, bottomLeft])
        }

        public init(horizontal: LengthPercentage, vertical: LengthPercentage) {
            self.init(horizontal: [horizontal], vertical: [vertical])
        }
    }
}

extension BorderRadius.Values {

    fileprivate static func expandRadii(_ radii: [LengthPercentage]) -> [LengthPercentage] {
        switch radii.count {
        case 0:
            return [.px(0), .px(0), .px(0), .px(0)]

        case 1:
            return [radii[0], radii[0], radii[0], radii[0]]

        case 2:
            return [radii[0], radii[1], radii[0], radii[1]]

        case 3:
            return [radii[0], radii[1], radii[2], radii[1]]

        case 4:
            return [radii[0], radii[1], radii[2], radii[3]]

        default:

            return Array(radii.prefix(4))
        }
    }

    public var description: String {
        guard let vertical, !vertical.isEmpty else {

            return formatCSSValues(horizontal)
        }

        return "\(formatCSSValues(horizontal)) / \(formatCSSValues(vertical))"
    }

    fileprivate func formatCSSValues(_ values: [LengthPercentage]) -> String {
        guard !values.isEmpty else { return "" }

        if values.count == 4 {
            let topLeft = values[0]
            let topRight = values[1]
            let bottomRight = values[2]
            let bottomLeft = values[3]

            if topLeft == topRight && topRight == bottomRight && bottomRight == bottomLeft {

                return topLeft.description
            } else if topLeft == bottomRight && topRight == bottomLeft {

                return "\(topLeft.description) \(topRight.description)"
            } else if topRight == bottomLeft {

                return
                    "\(topLeft.description) \(topRight.description) \(bottomRight.description)"
            }
        }

        return values.map { $0.description }.joined(separator: " ")
    }
}

extension BorderRadius {
    public static let property: String = "border-radius"

    public init(radius: LengthPercentage) {
        self = .values(Values(radius))
    }

    public init(_ horizontal: [LengthPercentage], _ vertical: [LengthPercentage]? = nil) {
        if let vertical, !vertical.isEmpty {
            self = .values(Values(horizontal: horizontal, vertical: vertical))
        } else {
            switch horizontal.count {
            case 0:
                self = .values(Values(.px(0)))

            case 1:
                self = .values(Values(horizontal[0]))

            case 2:
                self = .values(Values(horizontal[0], horizontal[1]))

            case 3:
                self = .values(Values(horizontal[0], horizontal[1], horizontal[2]))

            case 4:
                self = .values(Values(horizontal[0], horizontal[1], horizontal[2], horizontal[3]))

            default:

                self = .values(Values(horizontal[0], horizontal[1], horizontal[2], horizontal[3]))
            }
        }
    }

}

extension BorderRadius: LengthPercentageConvertible {
    public static func lengthPercentage(_ value: LengthPercentage) -> BorderRadius {
        .values(.init(value))
    }
}

extension BorderRadius: CustomStringConvertible {

    public var description: String {
        switch self {
        case .values(let values):
            return values.description

        case .global(let global):
            return global.description
        }
    }
}

extension BorderRadius {

    public static func elliptical(
        _ horizontal: LengthPercentage,
        _ vertical: LengthPercentage
    ) -> BorderRadius {
        .values(Values(horizontal: horizontal, vertical: vertical))
    }

    public static func uniform(_ radius: LengthPercentage) -> BorderRadius {
        .values(Values(radius))
    }
}
