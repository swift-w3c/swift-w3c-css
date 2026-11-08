public import W3C_CSS_Shared
import W3C_CSS_Values

public enum WebkitMaskComposite: Property {

    case operation(CompositeOperation)

    case multiple([CompositeOperation])

    case global(Global)

    public init(_ operation: CompositeOperation) {
        self = .operation(operation)
    }

    public init(_ operations: [CompositeOperation]) {
        self = if operations.count == 1 {
            .operation(operations[0])
        } else {
            .multiple(operations)
        }
    }
}

extension WebkitMaskComposite {
    public static let property: String = "-webkit-mask-composite"


    public var description: String {
        switch self {
        case .operation(let operation):
            return operation.rawValue

        case .multiple(let operations):
            return operations.map { $0.rawValue }.joined(separator: ", ")

        case .global(let global):
            return global.description
        }
    }
}

extension WebkitMaskComposite {

    public static let clear = WebkitMaskComposite(.clear)

    public static let copy = WebkitMaskComposite(.copy)

    public static let sourceOver = WebkitMaskComposite(.sourceOver)

    public static let sourceIn = WebkitMaskComposite(.sourceIn)

    public static let sourceOut = WebkitMaskComposite(.sourceOut)

    public static let sourceAtop = WebkitMaskComposite(.sourceAtop)

    public static let destinationOver = WebkitMaskComposite(.destinationOver)

    public static let destinationIn = WebkitMaskComposite(.destinationIn)

    public static let destinationOut = WebkitMaskComposite(.destinationOut)

    public static let destinationAtop = WebkitMaskComposite(.destinationAtop)

    public static let xor = WebkitMaskComposite(.xor)
}
