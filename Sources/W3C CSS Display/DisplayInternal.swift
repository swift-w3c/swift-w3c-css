public enum DisplayInternal: String, Sendable, Hashable {

    case tableRowGroup = "table-row-group"

    case tableHeaderGroup = "table-header-group"

    case tableFooterGroup = "table-footer-group"

    case tableRow = "table-row"

    case tableCell = "table-cell"

    case tableColumnGroup = "table-column-group"

    case tableColumn = "table-column"

    case tableCaption = "table-caption"

    case rubyBase = "ruby-base"

    case rubyText = "ruby-text"

    case rubyBaseContainer = "ruby-base-container"

    case rubyTextContainer = "ruby-text-container"
}

extension DisplayInternal: CustomStringConvertible {

    public var description: String {
        return rawValue
    }
}
