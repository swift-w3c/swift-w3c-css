public import W3C_CSS_Shared

public enum PaintOrder: Property {

    case normal

    case custom(Set<PaintLayer>)

    case global(Global)
}

extension PaintOrder {
    public static let property: String = "paint-order"

    public enum PaintLayer: String, Sendable, Hashable, CaseIterable {

        case fill

        case stroke

        case markers
    }
}

extension PaintOrder: CustomStringConvertible {

    public var description: String {
        switch self {
        case .normal:
            return "normal"

        case .custom(let layers):
            if layers.isEmpty {
                return "normal"
            }

            return layers.map { $0.rawValue }.sorted().joined(separator: " ")

        case .global(let global):
            return global.description
        }
    }
}

extension PaintOrder {

    public static func first(_ first: PaintLayer) -> PaintOrder {
        .custom([first])
    }

    public static let fill: PaintOrder = .first(.fill)

    public static let stroke: PaintOrder = .first(.stroke)

    public static let markers: PaintOrder = .first(.markers)

    public static func order(_ layers: PaintLayer...) -> PaintOrder {
        .custom(Set(layers))
    }
}
