import W3C_CSS_Shared
public import W3C_CSS_Syntax

public struct Layer: AtRule {
    public var rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    public init(_ name: String) {
        self.rawValue = "@layer \(name)"
    }

    public init() {
        self.rawValue = "@layer"
    }
}

extension Layer {
    public static let identifier: String = "layer"

    public static func declaring(_ names: String...) -> Layer {
        Layer(rawValue: "@layer \(names.joined(separator: ", "))")
    }

    public static let anonymous = Layer()

    public static let base = Layer("base")
    public static let layout = Layer("layout")
    public static let components = Layer("components")
    public static let utilities = Layer("utilities")
    public static let theme = Layer("theme")
    public static let reset = Layer("reset")

    public static func nested(_ parent: String, _ child: String) -> Layer {
        Layer("\(parent).\(child)")
    }
}

extension Layer {

    @_disfavoredOverload
    public static func / (lhs: Layer, rhs: String) -> Layer {
        return lhs / Layer(rhs)
    }

    @_disfavoredOverload
    public static func / (lhs: Layer, rhs: Layer) -> Layer {

        let parentName = String(lhs.rawValue.dropFirst(7))
        let childName = String(rhs.rawValue.dropFirst(7))
        return Layer("\(parentName).\(childName)")
    }
}
