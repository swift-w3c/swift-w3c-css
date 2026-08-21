import W3C_CSS_Shared
public import W3C_CSS_Syntax
import W3C_CSS_Values

public struct ViewTransition: AtRule {

    public var rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    public init() {
        self.rawValue = "@view-transition {}"
    }
}

extension ViewTransition {
    public static let identifier: String = "view-transition"

    public func navigation(_ value: NavigationType) -> ViewTransition {
        let currentContent = rawValue

        if let navStartRange = currentContent.ranges(of: "navigation:").first {

            let afterNav = currentContent[navStartRange.lowerBound...]
            if let semiIndex = afterNav.firstIndex(of: ";") {

                var newContent = String(currentContent[..<navStartRange.lowerBound])
                newContent += "navigation: \(value.rawValue);"
                newContent += String(currentContent[currentContent.index(after: semiIndex)...])
                return ViewTransition(rawValue: newContent)
            }
        }

        if currentContent.hasSuffix("{}") {

            let newContent = currentContent.dropLast() + "navigation: \(value.rawValue);}"
            return ViewTransition(rawValue: String(newContent))
        } else {

            let newContent = currentContent.dropLast() + " navigation: \(value.rawValue);}"
            return ViewTransition(rawValue: String(newContent))
        }
    }
}

extension ViewTransition {

    public enum NavigationType: String, Hashable, Sendable {

        case auto

        case none
    }

    public static let auto = ViewTransition().navigation(.auto)

    public static let none = ViewTransition().navigation(.none)
}
