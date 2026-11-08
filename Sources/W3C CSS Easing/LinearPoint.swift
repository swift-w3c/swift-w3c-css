import W3C_CSS_Shared
public import W3C_CSS_Values

public struct LinearPoint: Sendable, Hashable {

    public let value: Double

    public let percentage: Percentage?

    public init(value: Double, percentage: Percentage? = nil) {
        self.value = value
        self.percentage = percentage
    }
}
