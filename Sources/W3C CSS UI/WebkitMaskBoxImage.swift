public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum WebkitMaskBoxImage: Property {

    case none

    case config(Source, EdgeOffset? = nil, RepeatStyle? = nil)

    case global(Global)
}

extension WebkitMaskBoxImage {
    public static let property: String = "-webkit-mask-box-image"

    public enum Source: Sendable, Hashable {

        case url(Url)

        case linearGradient(CSSString)

        case radialGradient(CSSString)
    }

    public struct EdgeOffset: Sendable, Hashable {

        public let top: OffsetValue

        public let right: OffsetValue?

        public let bottom: OffsetValue?

        public let left: OffsetValue?

        public init(_ value: OffsetValue) {
            self.top = value
            self.right = nil
            self.bottom = nil
            self.left = nil
        }

        public init(
            _ top: OffsetValue,
            _ right: OffsetValue,
            _ bottom: OffsetValue,
            _ left: OffsetValue
        ) {
            self.top = top
            self.right = right
            self.bottom = bottom
            self.left = left
        }
    }

    public struct RepeatStyle: Sendable, Hashable {

        public let horizontal: Style

        public let vertical: Style?

        public init(_ style: Style) {
            self.horizontal = style
            self.vertical = nil
        }

        public init(_ horizontal: Style, _ vertical: Style) {
            self.horizontal = horizontal
            self.vertical = vertical
        }
    }

    public var description: String {
        switch self {
        case .none:
            return "none"

        case .config(let source, let offset, let repeatStyle):
            var parts: [String] = [sourceDescription(source)]

            if let offset {
                parts.append(offsetDescription(offset))
            }

            if let repeatStyle {
                parts.append(repeatStyleDescription(repeatStyle))
            }

            return parts.joined(separator: " ")

        case .global(let global):
            return global.description
        }
    }

    private func sourceDescription(_ source: Source) -> String {
        switch source {
        case .url(let url):
            return url.description

        case .linearGradient(let value):
            return "linear-gradient(\(value))"

        case .radialGradient(let value):
            return "radial-gradient(\(value))"
        }
    }

    private func offsetDescription(_ offset: EdgeOffset) -> String {
        var offsetValues: [String] = [offset.top.description]

        if let right = offset.right {
            offsetValues.append(right.description)

            if let bottom = offset.bottom {
                offsetValues.append(bottom.description)

                if let left = offset.left {
                    offsetValues.append(left.description)
                }
            }
        }

        return offsetValues.joined(separator: " ")
    }

    private func repeatStyleDescription(_ repeatStyle: RepeatStyle) -> String {
        if let vertical = repeatStyle.vertical {
            return "\(repeatStyle.horizontal.rawValue) \(vertical.rawValue)"
        } else {
            return repeatStyle.horizontal.rawValue
        }
    }
}

extension WebkitMaskBoxImage.EdgeOffset {

    public enum OffsetValue: Sendable, Hashable, CustomStringConvertible {

        case number(Int)

        case length(Length)

        case percentage(Percentage)
    }
}

extension WebkitMaskBoxImage.EdgeOffset.OffsetValue {
    public var description: String {
        switch self {
        case .number(let number):
            return number.description

        case .length(let length):
            return length.description

        case .percentage(let percentage):
            return percentage.description
        }
    }
}

extension WebkitMaskBoxImage.RepeatStyle {

    public enum Style: String, Sendable, Hashable {

        case stretch

        case `repeat`

        case round

        case space
    }
}
