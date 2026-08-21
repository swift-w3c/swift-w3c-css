import W3C_CSS_Shared
public import W3C_CSS_Syntax
public import W3C_CSS_Values

public struct Page: AtRule {
    public var rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

extension Page {
    public static let identifier: String = "page"

    public static let all = Page(rawValue: "@page {}")

    public static let first = Page(rawValue: "@page :first {}")

    public static let left = Page(rawValue: "@page :left {}")

    public static let right = Page(rawValue: "@page :right {}")

    public static let blank = Page(rawValue: "@page :blank {}")

    public static func named(_ name: String) -> Page {
        Page(rawValue: "@page \(name) {}")
    }

    public func size(_ value: PageSize) -> Page {
        let property = "size: \(value.rawValue);"
        return addProperty(property)
    }

    public func size(_ value: PageSize, _ orientation: PageOrientation) -> Page {
        let property = "size: \(value.rawValue) \(orientation.rawValue);"
        return addProperty(property)
    }

    public func margin(_ value: LengthPercentage) -> Page {
        let property = "margin: \(value);"
        return addProperty(property)
    }

    public func margin(
        top: LengthPercentage,
        right: LengthPercentage,
        bottom: LengthPercentage,
        left: LengthPercentage
    ) -> Page {
        let property = "margin: \(top) \(right) \(bottom) \(left);"
        return addProperty(property)
    }

    public func marginTop(_ value: LengthPercentage) -> Page {
        let property = "margin-top: \(value);"
        return addProperty(property)
    }

    public func marginRight(_ value: LengthPercentage) -> Page {
        let property = "margin-right: \(value);"
        return addProperty(property)
    }

    public func marginBottom(_ value: LengthPercentage) -> Page {
        let property = "margin-bottom: \(value);"
        return addProperty(property)
    }

    public func marginLeft(_ value: LengthPercentage) -> Page {
        let property = "margin-left: \(value);"
        return addProperty(property)
    }

    public func pageOrientation(_ value: PageOrientation) -> Page {
        let property = "page-orientation: \(value.rawValue);"
        return addProperty(property)
    }

    private func addProperty(_ property: String) -> Page {
        let currentContent = rawValue

        if currentContent.hasSuffix("{}") {

            let newContent = currentContent.dropLast() + property + "}"
            return Page(rawValue: String(newContent))
        } else {

            let newContent = currentContent.dropLast() + " " + property + "}"
            return Page(rawValue: String(newContent))
        }
    }
}

extension Page {

    public enum PageSize: Hashable, Sendable {

        case a3
        case a4
        case a5
        case b4
        case b5

        case letter
        case legal
        case ledger

        case auto

        case custom(width: LengthPercentage, height: LengthPercentage)
    }

    public enum PageOrientation: String, Hashable, Sendable {
        case portrait
        case landscape
    }

    public enum MarginBox: String, Hashable, Sendable {

        case topLeftCorner = "top-left-corner"
        case topLeft = "top-left"
        case topCenter = "top-center"
        case topRight = "top-right"
        case topRightCorner = "top-right-corner"

        case bottomLeftCorner = "bottom-left-corner"
        case bottomLeft = "bottom-left"
        case bottomCenter = "bottom-center"
        case bottomRight = "bottom-right"
        case bottomRightCorner = "bottom-right-corner"

        case leftTop = "left-top"
        case leftMiddle = "left-middle"
        case leftBottom = "left-bottom"

        case rightTop = "right-top"
        case rightMiddle = "right-middle"
        case rightBottom = "right-bottom"
    }
}

extension Page.PageSize {
    public var rawValue: String {
        switch self {
        case .a3, .a4, .a5, .b4, .b5, .letter, .legal, .ledger, .auto:
            return rawValueEnum

        case .custom(let width, let height):
            return "\(width) \(height)"
        }
    }

    private var rawValueEnum: String {
        switch self {
        case .a3: return "A3"
        case .a4: return "A4"
        case .a5: return "A5"
        case .b4: return "B4"
        case .b5: return "B5"
        case .letter: return "letter"
        case .legal: return "legal"
        case .ledger: return "ledger"
        case .auto: return "auto"
        case .custom: return ""
        }
    }
}
