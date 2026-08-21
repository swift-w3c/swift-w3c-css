public protocol AtRule: RawRepresentable & Hashable & Sendable {
    static var identifier: String { get }
}
