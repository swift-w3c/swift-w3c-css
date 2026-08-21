import W3C_CSS_Color
import W3C_CSS_Shared
public import W3C_CSS_Syntax
public import W3C_CSS_Values

public struct StartingStyle: AtRule {
    public var rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

extension StartingStyle {
    public static let identifier: String = "starting-style"
}

extension StartingStyle {

    public static func standalone() -> StartingStyle {
        StartingStyle(rawValue: "@starting-style {}")
    }

    public static func nested() -> StartingStyle {
        StartingStyle(rawValue: "@starting-style {}")
    }

    public func rule(_ selector: String, _ declarations: String) -> StartingStyle {
        let currentContent = rawValue

        if currentContent.hasSuffix("{}") {

            let newContent = currentContent.dropLast() + selector + " { " + declarations + " }}"
            return StartingStyle(rawValue: String(newContent))
        } else {

            let newContent =
                currentContent.dropLast() + " " + selector + " { " + declarations + " }}"
            return StartingStyle(rawValue: String(newContent))
        }
    }

    public func declaration(_ property: String, _ value: String) -> StartingStyle {
        let currentContent = rawValue

        if currentContent.hasSuffix("{}") {

            let newContent = currentContent.dropLast() + property + ": " + value + ";}"
            return StartingStyle(rawValue: String(newContent))
        } else {

            let newContent = currentContent.dropLast() + " " + property + ": " + value + ";}"
            return StartingStyle(rawValue: String(newContent))
        }
    }

    public func declarations(_ declarations: String) -> StartingStyle {
        let currentContent = rawValue

        if currentContent.hasSuffix("{}") {

            let newContent = currentContent.dropLast() + declarations + "}"
            return StartingStyle(rawValue: String(newContent))
        } else {

            let newContent = currentContent.dropLast() + " " + declarations + "}"
            return StartingStyle(rawValue: String(newContent))
        }
    }

    public func opacity(_ value: Double) -> StartingStyle {
        declaration("opacity", String(value))
    }

    public func transform(_ value: String) -> StartingStyle {
        declaration("transform", value)
    }

    public func scale(_ x: Double, _ y: Double) -> StartingStyle {
        transform("scale(\(x), \(y))")
    }

    public func scaleX(_ value: Double) -> StartingStyle {
        transform("scaleX(\(value))")
    }

    public func scaleY(_ value: Double) -> StartingStyle {
        transform("scaleY(\(value))")
    }

    public func backgroundColor(_ value: W3C_CSS_Values.Color) -> StartingStyle {
        declaration("background-color", value.description)
    }
}
