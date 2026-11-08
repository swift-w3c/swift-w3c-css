public import W3C_CSS_Shared


extension GridTemplate {
    public struct AreaRow: Sendable, Hashable {

        public let area: String

        public let lineNamesBefore: [String]?

        public let size: GridTrackSize?

        public let lineNamesAfter: [String]?

        public init(_ area: String) {
            self.area = area
            self.lineNamesBefore = nil
            self.size = nil
            self.lineNamesAfter = nil
        }

        public init(_ area: String, size: GridTrackSize) {
            self.area = area
            self.lineNamesBefore = nil
            self.size = size
            self.lineNamesAfter = nil
        }

        public init(
            _ area: String,
            lineNamesBefore: [String]? = nil,
            lineNamesAfter: [String]? = nil,
            size: GridTrackSize? = nil
        ) {
            self.area = area
            self.lineNamesBefore = lineNamesBefore
            self.size = size
            self.lineNamesAfter = lineNamesAfter
        }
    }
}
