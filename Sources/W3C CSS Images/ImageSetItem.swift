public import W3C_CSS_Shared
public import W3C_CSS_Values

public struct ImageSetItem: Sendable, Hashable {
    public let url: W3C.CSSOM.Url
    public let resolution: String

    public init(url: W3C.CSSOM.Url, resolution: String) {
        self.url = url
        self.resolution = resolution
    }
}
