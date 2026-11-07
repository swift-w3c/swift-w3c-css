public import W3C_CSS_Shared
public import W3C_CSS_Values

public struct TextDecorationValue: Sendable, Hashable, CustomStringConvertible {

    public let lines: [TextDecorationLine]

    public let style: TextDecorationStyle?

    public let color: Color?

    public let thickness: LengthPercentage?

    public init(
        _ line: TextDecorationLine,
        style: TextDecorationStyle? = nil,
        color: Color? = nil,
        thickness: LengthPercentage? = nil
    ) {
        self.lines = [line]
        self.style = style
        self.color = color
        self.thickness = thickness
    }

    public init(
        _ lines: [TextDecorationLine],
        style: TextDecorationStyle? = nil,
        color: Color? = nil,
        thickness: LengthPercentage? = nil
    ) {
        self.lines = lines
        self.style = style
        self.color = color
        self.thickness = thickness
    }
}
