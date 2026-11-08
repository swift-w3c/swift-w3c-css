public import W3C_CSS_Shared

extension GridTemplateRows {
    public struct NamedTrack: Sendable, Hashable {

        public let before: String?

        public let size: GridTrackSize

        public let after: String?

        public init(before: String? = nil, size: GridTrackSize, after: String? = nil) {
            self.before = before
            self.size = size
            self.after = after
        }
    }
}
