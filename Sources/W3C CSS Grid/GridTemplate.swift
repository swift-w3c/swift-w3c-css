public import W3C_CSS_Shared

public enum GridTemplate: Property {

    case none

    case rowsColumns([GridTrackSize], [GridTrackSize])

    case namedAreas([AreaRow], columns: [GridTrackSize]? = nil)

    case global(Global)
}

extension GridTemplate {
    public static let property: String = "grid-template"

}

extension GridTemplate.AreaRow {

    public var description: String {
        var result = ""

        if let lineNamesBefore, !lineNamesBefore.isEmpty {
            result += "[\(lineNamesBefore.joined(separator: " "))] "
        }

        result += "\"\(area)\""

        if let size {
            result += " \(size)"
        }

        if let lineNamesAfter, !lineNamesAfter.isEmpty {
            result += " [\(lineNamesAfter.joined(separator: " "))]"
        }

        return result
    }
}

extension GridTemplate {
    public var description: String {
        switch self {
        case .none:
            return "none"

        case .rowsColumns(let rows, let columns):
            let rowsStr = rows.map { $0.description }.joined(separator: " ")
            let columnsStr = columns.map { $0.description }.joined(separator: " ")
            return "\(rowsStr) / \(columnsStr)"

        case .namedAreas(let rows, let columns):
            let rowsStr = rows.map { $0.description }.joined(separator: " ")

            if let columns, !columns.isEmpty {
                let columnsStr = columns.map { $0.description }.joined(separator: " ")
                return "\(rowsStr) / \(columnsStr)"
            }

            return rowsStr

        case .global(let value):
            return value.description
        }
    }
}
