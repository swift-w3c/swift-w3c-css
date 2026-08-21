public import W3C_CSS_Shared

public enum Display: Property {

    case block

    case inline

    case inlineBlock

    case flex

    case inlineFlex

    case grid

    case inlineGrid

    case flowRoot

    case none

    case contents

    case multiKeyword(outer: DisplayOutside, inner: DisplayInside)

    case listItem(outer: DisplayOutside? = nil, inner: DisplayInside? = nil)

    case table

    case inlineTable

    case tableRowGroup

    case tableHeaderGroup

    case tableFooterGroup

    case tableRow

    case tableCell

    case tableColumnGroup

    case tableColumn

    case tableCaption

    case ruby

    case rubyBase

    case rubyText

    case rubyBaseContainer

    case rubyTextContainer

    case global(Global)
}

extension Display {
    public static let property: String = "display"

    public var description: String {
        switch self {
        case .block:
            return "block"

        case .inline:
            return "inline"

        case .inlineBlock:
            return "inline-block"

        case .flex:
            return "flex"

        case .inlineFlex:
            return "inline-flex"

        case .grid:
            return "grid"

        case .inlineGrid:
            return "inline-grid"

        case .flowRoot:
            return "flow-root"

        case .none:
            return "none"

        case .contents:
            return "contents"

        case .multiKeyword(let outer, let inner):
            return "\(outer) \(inner)"

        case .listItem(let outer, let inner):
            var result = ""
            if let outer {
                result += "\(outer) "
            }
            if let inner {
                result += "\(inner) "
            }
            result += "list-item"
            return result

        case .table:
            return "table"

        case .inlineTable:
            return "inline-table"

        case .tableRowGroup:
            return "table-row-group"

        case .tableHeaderGroup:
            return "table-header-group"

        case .tableFooterGroup:
            return "table-footer-group"

        case .tableRow:
            return "table-row"

        case .tableCell:
            return "table-cell"

        case .tableColumnGroup:
            return "table-column-group"

        case .tableColumn:
            return "table-column"

        case .tableCaption:
            return "table-caption"

        case .ruby:
            return "ruby"

        case .rubyBase:
            return "ruby-base"

        case .rubyText:
            return "ruby-text"

        case .rubyBaseContainer:
            return "ruby-base-container"

        case .rubyTextContainer:
            return "ruby-text-container"

        case .global(let value):
            return value.description
        }
    }
}
