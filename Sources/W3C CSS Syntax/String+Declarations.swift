internal import W3C_CSS_Shared

extension String {
    /// The contents of a declaration block: declarations joined by semicolons, in order.
    init(block declarations: [Declaration]) {
        self = declarations.map(\.description).joined(separator: ";")
    }
}
