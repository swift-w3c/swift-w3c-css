public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum MaskBorder: Property {

    case config(Configuration)

    case global(Global)

    public init(
        _ source: Source,
        _ slice: Slice,
        _ width: Width? = nil,
        _ outset: Outset? = nil,
        _ repeat: Repeat? = nil,
        _ mode: Mode? = nil
    ) {
        self = .config(
            Configuration(
                source: source,
                slice: slice,
                width: width,
                outset: outset,
                repeat: `repeat`,
                mode: mode
            )
        )
    }

    public init(
        source: Source,
        slice: Slice,
        width: Width? = nil,
        repeat: Repeat? = nil,
        mode: Mode? = nil
    ) {
        self = .config(
            Configuration(
                source: source,
                slice: slice,
                width: width,
                repeat: `repeat`,
                mode: mode
            )
        )
    }
}

extension MaskBorder {
    public static let property: String = "mask-border"

    public struct Configuration: Sendable, Hashable, CustomStringConvertible {

        public let source: Source

        public let slice: Slice

        public let width: Width?

        public let outset: Outset?

        public let `repeat`: Repeat?

        public let mode: Mode?

        public init(
            source: Source,
            slice: Slice,
            width: Width? = nil,
            outset: Outset? = nil,
            repeat: Repeat? = nil,
            mode: Mode? = nil
        ) {
            self.source = source
            self.slice = slice
            self.width = width
            self.outset = outset
            self.repeat = `repeat`
            self.mode = mode
        }
    }

    public enum Source: Sendable, Hashable {

        case none

        case url(Url)

        case linearGradient(CSSString)

        case radialGradient(CSSString)

        case conicGradient(CSSString)

        case repeatingLinearGradient(CSSString)

        case repeatingRadialGradient(CSSString)

        case repeatingConicGradient(CSSString)
    }

    public struct Slice: Sendable, Hashable {

        public let top: SliceValue

        public let right: SliceValue?

        public let bottom: SliceValue?

        public let left: SliceValue?

        public let fill: Bool

        public init(_ value: SliceValue, fill: Bool = false) {
            self.top = value
            self.right = nil
            self.bottom = nil
            self.left = nil
            self.fill = fill
        }

        public init(
            _ top: SliceValue,
            _ right: SliceValue,
            _ bottom: SliceValue,
            _ left: SliceValue,
            fill: Bool = false
        ) {
            self.top = top
            self.right = right
            self.bottom = bottom
            self.left = left
            self.fill = fill
        }
    }

    public struct Width: Sendable, Hashable, LengthPercentageConvertible {

        public let top: WidthValue

        public let right: WidthValue?

        public let bottom: WidthValue?

        public let left: WidthValue?

        public init(_ value: WidthValue) {
            self.top = value
            self.right = nil
            self.bottom = nil
            self.left = nil
        }

        public init(
            _ top: WidthValue,
            _ right: WidthValue,
            _ bottom: WidthValue,
            _ left: WidthValue
        ) {
            self.top = top
            self.right = right
            self.bottom = bottom
            self.left = left
        }
    }

    public struct Outset: Sendable, Hashable, LengthConvertible {

        public let top: OutsetValue

        public let right: OutsetValue?

        public let bottom: OutsetValue?

        public let left: OutsetValue?

        public init(_ value: OutsetValue) {
            self.top = value
            self.right = nil
            self.bottom = nil
            self.left = nil
        }

        public init(
            _ top: OutsetValue,
            _ right: OutsetValue,
            _ bottom: OutsetValue,
            _ left: OutsetValue
        ) {
            self.top = top
            self.right = right
            self.bottom = bottom
            self.left = left
        }
    }

    public struct Repeat: Sendable, Hashable {

        public let horizontal: RepeatValue

        public let vertical: RepeatValue?

        public init(_ value: RepeatValue) {
            self.horizontal = value
            self.vertical = nil
        }

        public init(_ horizontal: RepeatValue, _ vertical: RepeatValue) {
            self.horizontal = horizontal
            self.vertical = vertical
        }
    }

    public typealias Mode = MaskBorderMode
}

extension MaskBorder.Configuration {

    public var description: String {
        var parts: [String] = []

        parts.append(sourceDescription)

        parts.append(sliceDescription)

        if let width {
            let widthPart = " / \(widthDescription(width))"

            if let outset {
                parts.append(widthPart + " / \(outsetDescription(outset))")
            } else {
                parts.append(widthPart)
            }
        } else if let outset {
            parts.append(" / / \(outsetDescription(outset))")
        }

        if let `repeat` {
            parts.append(repeatDescription(`repeat`))
        }

        if let mode {
            parts.append(modeDescription(mode))
        }

        return parts.joined(separator: " ")
    }

    private var sourceDescription: String {
        switch source {
        case .none:
            return "none"

        case .url(let url):
            return url.description

        case .linearGradient(let value):
            return "linear-gradient(\(value))"

        case .radialGradient(let value):
            return "radial-gradient(\(value))"

        case .conicGradient(let value):
            return "conic-gradient(\(value))"

        case .repeatingLinearGradient(let value):
            return "repeating-linear-gradient(\(value))"

        case .repeatingRadialGradient(let value):
            return "repeating-radial-gradient(\(value))"

        case .repeatingConicGradient(let value):
            return "repeating-conic-gradient(\(value))"
        }
    }

    private var sliceDescription: String {
        var sliceValues: [String] = [slice.top.description]

        if let right = slice.right {
            sliceValues.append(right.description)

            if let bottom = slice.bottom {
                sliceValues.append(bottom.description)

                if let left = slice.left {
                    sliceValues.append(left.description)
                }
            }
        }

        let sliceStr = sliceValues.joined(separator: " ")
        return slice.fill ? "\(sliceStr) fill" : sliceStr
    }

    private func widthDescription(_ width: MaskBorder.Width) -> String {
        var widthValues: [String] = [width.top.description]

        if let right = width.right {
            widthValues.append(right.description)

            if let bottom = width.bottom {
                widthValues.append(bottom.description)

                if let left = width.left {
                    widthValues.append(left.description)
                }
            }
        }

        return widthValues.joined(separator: " ")
    }

    private func outsetDescription(_ outset: MaskBorder.Outset) -> String {
        var outsetValues: [String] = [outset.top.description]

        if let right = outset.right {
            outsetValues.append(right.description)

            if let bottom = outset.bottom {
                outsetValues.append(bottom.description)

                if let left = outset.left {
                    outsetValues.append(left.description)
                }
            }
        }

        return outsetValues.joined(separator: " ")
    }

    private func repeatDescription(_ repeat: MaskBorder.Repeat) -> String {
        if let vertical = `repeat`.vertical {
            return
                "\(repeatValueDescription(`repeat`.horizontal)) \(repeatValueDescription(vertical))"
        } else {
            return repeatValueDescription(`repeat`.horizontal)
        }
    }

    private func repeatValueDescription(_ value: MaskBorder.Repeat.RepeatValue) -> String {
        switch value {
        case .stretch: return "stretch"
        case .repeat: return "repeat"
        case .round: return "round"
        case .space: return "space"
        }
    }

    private func modeDescription(_ mode: MaskBorder.Mode) -> String {
        switch mode {
        case .alpha: return "alpha"
        case .luminance: return "luminance"

        case .global(let global):
            return global.description
        }
    }
}

extension MaskBorder.Slice {

    public enum SliceValue: Sendable, Hashable, CustomStringConvertible {

        case number(Number)

        case percentage(Percentage)
    }

    public static func slice(_ value: Double) -> MaskBorder.Slice {
        return MaskBorder.Slice(.number(.init(value)))
    }

    public static func percentage(_ value: Percentage) -> MaskBorder.Slice {
        return MaskBorder.Slice(.percentage(value))
    }
}

extension MaskBorder.Slice.SliceValue {

    public var description: String {
        switch self {
        case .number(let number):
            return number.description

        case .percentage(let percentage):
            return percentage.description
        }
    }
}

extension MaskBorder.Width {
    public static func lengthPercentage(
        _ value: LengthPercentage
    ) -> MaskBorder.Width {
        .init(.lengthPercentage(value))
    }

    public enum WidthValue: Sendable, Hashable, CustomStringConvertible,
        LengthPercentageConvertible
    {

        case auto

        case number(Number)

        case lengthPercentage(LengthPercentage)
    }

    public static func number(_ number: Number) -> MaskBorder.Width {
        return MaskBorder.Width(.number(number))
    }

    public static let auto = MaskBorder.Width(.auto)
}

extension MaskBorder.Width.WidthValue {

    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .number(let number):
            return number.description

        case .lengthPercentage(let length):
            return length.description
        }
    }
}

extension MaskBorder.Outset {
    public static func length(_ length: Length) -> MaskBorder.Outset {
        .init(.length(length))
    }

    public enum OutsetValue: Sendable, Hashable, CustomStringConvertible, LengthConvertible {

        case number(Number)

        case length(Length)
    }

    public static func number(_ number: Number) -> MaskBorder.Outset {
        return MaskBorder.Outset(.number(number))
    }
}

extension MaskBorder.Outset.OutsetValue {

    public var description: String {
        switch self {
        case .number(let number):
            return number.description

        case .length(let length):
            return length.description
        }
    }
}

extension MaskBorder.Repeat {

    public enum RepeatValue: Sendable, Hashable {

        case stretch

        case `repeat`

        case round

        case space
    }
}

extension MaskBorder: CustomStringConvertible {

    public var description: String {
        switch self {
        case .config(let config):
            return config.description

        case .global(let global):
            return global.description
        }
    }
}
