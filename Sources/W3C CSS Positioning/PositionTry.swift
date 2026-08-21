import W3C_CSS_Shared
public import W3C_CSS_Syntax
public import W3C_CSS_Values

public struct PositionTry: AtRule {
    public var rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

extension PositionTry {
    public static let identifier: String = "position-try"

    public static func named(_ name: String) -> PositionTry {
        PositionTry(rawValue: "@position-try \(name) {}")
    }

    public func positionAnchor(_ value: String) -> PositionTry {
        addProperty("position-anchor: \(value);")
    }

    public func positionArea(_ value: PositionArea) -> PositionTry {
        addProperty("position-area: \(value);")
    }

    public func positionArea(_ value: PositionAreaValue) -> PositionTry {
        addProperty("position-area: \(value.rawValue);")
    }

    public func top(_ value: AnchorValue) -> PositionTry {
        addProperty("top: \(value.rawValue);")
    }

    public func right(_ value: AnchorValue) -> PositionTry {
        addProperty("right: \(value.rawValue);")
    }

    public func bottom(_ value: AnchorValue) -> PositionTry {
        addProperty("bottom: \(value.rawValue);")
    }

    public func left(_ value: AnchorValue) -> PositionTry {
        addProperty("left: \(value.rawValue);")
    }

    public func inset(_ value: AnchorValue) -> PositionTry {
        addProperty("inset: \(value.rawValue);")
    }

    public func width(_ value: LengthPercentage) -> PositionTry {
        addProperty("width: \(value);")
    }

    public func height(_ value: LengthPercentage) -> PositionTry {
        addProperty("height: \(value);")
    }

    public func margin(_ value: LengthPercentage) -> PositionTry {
        addProperty("margin: \(value);")
    }

    public func margin(
        _ top: LengthPercentage,
        _ right: LengthPercentage,
        _ bottom: LengthPercentage,
        _ left: LengthPercentage
    ) -> PositionTry {
        addProperty("margin: \(top) \(right) \(bottom) \(left);")
    }

    public func alignSelf(_ value: SelfAlignment) -> PositionTry {
        addProperty("align-self: \(value.rawValue);")
    }

    public func justifySelf(_ value: SelfAlignment) -> PositionTry {
        addProperty("justify-self: \(value.rawValue);")
    }

    private func addProperty(_ property: String) -> PositionTry {
        let currentContent = rawValue

        if currentContent.hasSuffix("{}") {

            let newContent = currentContent.dropLast() + property + "}"
            return PositionTry(rawValue: String(newContent))
        } else {

            let newContent = currentContent.dropLast() + " " + property + "}"
            return PositionTry(rawValue: String(newContent))
        }
    }
}

extension PositionTry {

    public enum PositionAreaValue: String, Hashable, Sendable {

        case none
    }

    public enum AnchorValue: Hashable, Sendable {

        case anchor(String)

        case calc(String)
    }

    public enum SelfAlignment: String, Hashable, Sendable {

        case auto
        case normal
        case start
        case end
        case center
        case selfStart = "self-start"
        case selfEnd = "self-end"
        case flexStart = "flex-start"
        case flexEnd = "flex-end"

        case anchorCenter = "anchor-center"
    }
}

extension PositionTry.AnchorValue {

    public var rawValue: String {
        switch self {
        case .anchor(let edge):
            return "anchor(\(edge))"

        case .calc(let expression):
            return "calc(\(expression))"
        }
    }
}
