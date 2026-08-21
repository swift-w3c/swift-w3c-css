public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum Columns: Property {

    case both(ColumnWidth, ColumnCount)

    case width(ColumnWidth)

    case count(ColumnCount)

    case global(Global)
}

extension Columns {
    public static let property: String = "columns"
}

extension Columns: LengthConvertible {
    public static func length(_ length: Length) -> Columns {
        .width(.init(length))
    }
}

extension Columns: CustomStringConvertible {
    public var description: String {
        switch self {
        case .both(let width, let count):
            return "\(width) \(count)"

        case .width(let width):
            return width.description

        case .count(let count):
            return count.description

        case .global(let global):
            return global.description
        }
    }
}

extension Columns {

    public static let auto: Columns = .count(.auto)

}
