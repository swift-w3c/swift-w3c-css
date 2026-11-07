public import W3C_CSS_Shared
public import W3C_CSS_Values

public struct ImageSetItem: Sendable, Hashable {
    public let url: Url
    public let resolution: String

    public init(url: Url, resolution: String) {
        self.url = url
        self.resolution = resolution
    }
}
