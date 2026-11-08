public import W3C_CSS_Shared
public import W3C_CSS_Values


extension TransformOrigin {
    public enum Value: Sendable, Hashable, LengthPercentageConvertible {

        case horizontalKeyword(HorizontalKeyword)

        case verticalKeyword(VerticalKeyword)

        case lengthPercentage(LengthPercentage)
    }
}
