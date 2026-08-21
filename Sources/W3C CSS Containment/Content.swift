public import W3C_CSS_Lists
public import W3C_CSS_Shared
import W3C_CSS_Values

public enum Content: Property {

    case normal

    case none

    case text(CSSString)

    case image(Url)

    case counter(name: String, style: ListStyleType? = nil)

    case counters(name: String, separator: String, style: ListStyleType? = nil)

    case attr(name: String)

    case openQuote

    case closeQuote

    case noOpenQuote

    case noCloseQuote

    case list([Content])

    case imageWithAlt(image: Url, alt: CSSString)

    case global(Global)
}

extension Content {
    public static let property: String = "content"

    public var description: String {
        switch self {
        case .normal:
            return "normal"

        case .none:
            return "none"

        case .text(let string):
            return string.description

        case .image(let url):
            return "\(url)"

        case .counter(let name, nil):
            return "counter(\(name))"

        case .counter(let name, let style):
            return "counter(\(name), \(style!.description))"

        case .counters(let name, let separator, nil):
            return "counters(\(name), \"\(separator)\")"

        case .counters(let name, let separator, let style):
            return "counters(\(name), \"\(separator)\", \(style!.description))"

        case .attr(let name):
            return "attr(\(name))"

        case .openQuote:
            return "open-quote"

        case .closeQuote:
            return "close-quote"

        case .noOpenQuote:
            return "no-open-quote"

        case .noCloseQuote:
            return "no-close-quote"

        case .list(let items):
            return items.map { $0.description }.joined(separator: " ")

        case .imageWithAlt(let image, let alt):
            return "\(image) / \"\(alt.description)\""

        case .global(let value):
            return value.description
        }
    }
}
