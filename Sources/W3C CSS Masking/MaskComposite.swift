public import W3C_CSS_Shared
import W3C_CSS_Values

public enum MaskComposite: Property {

    case add

    case subtract

    case intersect

    case exclude

    case multiple([CompositeOperation])

    case global(Global)
}

extension MaskComposite {
    public static let property: String = "mask-composite"

    public enum CompositeOperation: String, Sendable, Hashable {

        case add

        case subtract

        case intersect

        case exclude
    }
}

extension MaskComposite: CustomStringConvertible {

    public var description: String {
        switch self {
        case .add:
            return "add"

        case .subtract:
            return "subtract"

        case .intersect:
            return "intersect"

        case .exclude:
            return "exclude"

        case .multiple(let operations):
            return operations.map { $0.rawValue }.joined(separator: ", ")

        case .global(let global):
            return global.description
        }
    }
}

extension MaskComposite {

    public static let `default` = MaskComposite.add

    public static func values(_ operations: [CompositeOperation]) -> MaskComposite {
        if operations.count == 1 {
            switch operations[0] {
            case .add: return .add
            case .subtract: return .subtract
            case .intersect: return .intersect
            case .exclude: return .exclude
            }
        }
        return .multiple(operations)
    }

    public static func values(_ operations: CompositeOperation...) -> MaskComposite {
        values(operations)
    }
}
