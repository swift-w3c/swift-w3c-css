public import W3C_CSS_Shared


extension PaintOrder {
    public enum PaintLayer: String, Sendable, Hashable, CaseIterable {

        case fill

        case stroke

        case markers
    }
}
