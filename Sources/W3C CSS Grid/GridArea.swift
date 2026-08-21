public import W3C_CSS_Shared

public enum GridArea: Property {

    case auto

    case name(String)

    case area(GridAreaCoordinates)

    case span(String)

    case global(Global)
}

extension GridArea {
    public static let property: String = "grid-area"

    public static func span(_ value: Int) -> Self {
        .span("\(value)")
    }

    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .name(let name):
            return name

        case .area(let area):
            return area.description

        case .span(let name):
            return "span \(name)"

        case .global(let value):
            return value.description
        }
    }
}

public struct GridAreaCoordinates: Sendable, Hashable, CustomStringConvertible {

    public let rowStart: GridLine

    public let columnStart: GridLine

    public let rowEnd: GridLine?

    public let columnEnd: GridLine?

    public init(_ rowStart: Int, _ columnStart: Int) {
        self.rowStart = GridLine(rowStart)
        self.columnStart = GridLine(columnStart)
        self.rowEnd = nil
        self.columnEnd = nil
    }

    public init(_ rowStart: Int, _ columnStart: Int, _ rowEnd: Int, _ columnEnd: Int) {
        self.rowStart = GridLine(rowStart)
        self.columnStart = GridLine(columnStart)
        self.rowEnd = GridLine(rowEnd)
        self.columnEnd = GridLine(columnEnd)
    }

    public init(
        rowStart: GridLine,
        columnStart: GridLine,
        rowEnd: GridLine? = nil,
        columnEnd: GridLine? = nil
    ) {
        self.rowStart = rowStart
        self.columnStart = columnStart
        self.rowEnd = rowEnd
        self.columnEnd = columnEnd
    }
}

extension GridAreaCoordinates {
    public var description: String {
        if let rowEnd, let columnEnd {
            return "\(rowStart) / \(columnStart) / \(rowEnd) / \(columnEnd)"
        } else {
            return "\(rowStart) / \(columnStart)"
        }
    }
}

public struct GridLine: Sendable, Hashable, CustomStringConvertible {
    private let type: LineType

    public init(_ number: Int) {
        self.type = .number(number)
    }

    public init(_ name: String) {
        self.type = .name(name)
    }

    public init(span: Int) {
        self.type = .span(span)
    }

    public init(span name: String) {
        self.type = .spanName(name)
    }

    private init() {
        self.type = .auto
    }
}

extension GridLine {

    private enum LineType: Sendable, Hashable {
        case number(Int)
        case name(String)
        case span(Int)
        case spanName(String)
        case auto
    }
}

extension GridLine {

    public static func end(_ number: Int) -> GridLine {

        let value = number > 0 ? -number : number
        return GridLine(value)
    }

    public static let auto = GridLine()

    public var description: String {
        switch type {
        case .number(let number):
            return number.description

        case .name(let name):
            return name

        case .span(let span):
            return "span \(span)"

        case .spanName(let name):
            return "span \(name)"

        case .auto:
            return "auto"
        }
    }
}
