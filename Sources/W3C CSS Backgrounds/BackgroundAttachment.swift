public import W3C_CSS_Shared
import W3C_CSS_Values

public enum BackgroundAttachment: Property {

    case scroll

    case fixed

    case local

    case multiple([BackgroundAttachment])

    case global(Global)
}

extension BackgroundAttachment {
    public static let property: String = "background-attachment"
}

extension BackgroundAttachment: CustomStringConvertible {

    public var description: String {
        switch self {
        case .scroll:
            return "scroll"

        case .fixed:
            return "fixed"

        case .local:
            return "local"

        case .multiple(let attachments):
            return attachments.map { $0.description }.joined(separator: ", ")

        case .global(let global):
            return global.description
        }
    }
}

extension BackgroundAttachment {

    public static let `default` = BackgroundAttachment.scroll

    public static func values(_ attachments: [BackgroundAttachment]) -> BackgroundAttachment {
        if attachments.count == 1, case let attachment = attachments[0] {
            return attachment
        }
        return .multiple(attachments)
    }

    public static func values(_ attachments: BackgroundAttachment...) -> BackgroundAttachment {
        values(attachments)
    }
}
