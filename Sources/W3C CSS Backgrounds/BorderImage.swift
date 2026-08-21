public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum BorderImage: Property {

    case config(Configuration)

    case global(Global)

    public init(
        _ source: Source,
        _ slice: Slice,
        _ width: Width? = nil,
        _ outset: Outset? = nil,
        _ repeat: Repeat? = nil
    ) {
        self = .config(
            Configuration(
                source: source,
                slice: slice,
                width: width,
                outset: outset,
                repeat: `repeat`
            )
        )
    }

    public init(
        source: Source,
        slice: Slice,
        width: Width? = nil,
        repeat: Repeat? = nil
    ) {
        self = .config(
            Configuration(
                source: source,
                slice: slice,
                width: width,
                repeat: `repeat`
            )
        )
    }
}

extension BorderImage {
    public static let property: String = "border-image"
}

extension BorderImage {

    public struct Configuration: Sendable, Hashable, CustomStringConvertible {

        public let source: Source

        public let slice: Slice

        public let width: Width?

        public let outset: Outset?

        public let `repeat`: Repeat?

        public init(
            source: Source,
            slice: Slice,
            width: Width? = nil,
            outset: Outset? = nil,
            repeat: Repeat? = nil
        ) {
            self.source = source
            self.slice = slice
            self.width = width
            self.outset = outset
            self.repeat = `repeat`
        }
    }
}

extension BorderImage.Configuration {

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

        return parts.joined(separator: " ")
    }

    private var sourceDescription: String {
        switch source {
        case .none:
            return "none"

        case .url(let url):
            return url.description

        case .linearGradient(let colors, let angle):
            let angleStr = angle.map { "\($0), " } ?? ""
            let colorsStr = colors.joined(separator: ", ")
            return "linear-gradient(\(angleStr)\(colorsStr))"

        case .radialGradient(let colors, let position):
            let positionStr = position.map { "\($0), " } ?? ""
            let colorsStr = colors.joined(separator: ", ")
            return "radial-gradient(\(positionStr)\(colorsStr))"

        case .repeatingLinearGradient(let colors, let angle):
            let angleStr = angle.map { "\($0), " } ?? ""
            let colorsStr = colors.joined(separator: ", ")
            return "repeating-linear-gradient(\(angleStr)\(colorsStr))"

        case .repeatingRadialGradient(let colors, let position):
            let positionStr = position.map { "\($0), " } ?? ""
            let colorsStr = colors.joined(separator: ", ")
            return "repeating-radial-gradient(\(positionStr)\(colorsStr))"
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

    private func widthDescription(_ width: BorderImage.Width) -> String {
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

    private func outsetDescription(_ outset: BorderImage.Outset) -> String {
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

    private func repeatDescription(_ repeat: BorderImage.Repeat) -> String {
        if let vertical = `repeat`.vertical {
            return
                "\(repeatValueDescription(`repeat`.horizontal)) \(repeatValueDescription(vertical))"
        } else {
            return repeatValueDescription(`repeat`.horizontal)
        }
    }

    private func repeatValueDescription(_ value: BorderImage.Repeat.RepeatValue) -> String {
        switch value {
        case .stretch: return "stretch"
        case .repeat: return "repeat"
        case .round: return "round"
        case .space: return "space"
        }
    }
}

extension BorderImage {

    public enum Source: Sendable, Hashable {

        case none

        case url(Url)

        case linearGradient([String], String?)

        case radialGradient([String], String?)

        case repeatingLinearGradient([String], String?)

        case repeatingRadialGradient([String], String?)
    }
}

extension BorderImage {

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
}

extension BorderImage.Slice {

    public enum SliceValue: Sendable, Hashable, CustomStringConvertible {

        case number(Number)

        case percentage(Percentage)
    }
}

extension BorderImage.Slice.SliceValue {

    public var description: String {
        switch self {
        case .number(let number):
            return number.description

        case .percentage(let percentage):
            return percentage.description
        }
    }
}

extension BorderImage.Slice {

    public static func slice(_ value: Number) -> BorderImage.Slice {
        return BorderImage.Slice(.number(value))
    }

    public static func percentage(_ value: Percentage) -> BorderImage.Slice {
        return BorderImage.Slice(.percentage(value))
    }
}

extension BorderImage {

    public struct Width: Sendable, Hashable {

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
}

extension BorderImage.Width {

    public enum WidthValue: Sendable, Hashable, CustomStringConvertible,
        LengthPercentageConvertible
    {

        case auto

        case number(Number)

        case lengthPercentage(LengthPercentage)
    }
}

extension BorderImage.Width.WidthValue {

    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .number(let number):
            return number.description

        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description
        }
    }
}

extension BorderImage.Width {

    public static func number(_ number: Number) -> BorderImage.Width {
        return BorderImage.Width(.number(number))
    }

    public static let auto = BorderImage.Width(.auto)
}

extension BorderImage {

    public struct Outset: Sendable, Hashable {

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
}

extension BorderImage.Outset {

    public enum OutsetValue: Sendable, Hashable, CustomStringConvertible, LengthConvertible {

        case number(Number)

        case length(Length)
    }
}

extension BorderImage.Outset.OutsetValue {

    public var description: String {
        switch self {
        case .number(let number):
            return number.description

        case .length(let length):
            return length.description
        }
    }
}

extension BorderImage.Outset {

    public static func number(_ number: Number) -> BorderImage.Outset {
        return BorderImage.Outset(.number(number))
    }
}

extension BorderImage {

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
}

extension BorderImage.Repeat {

    public enum RepeatValue: Sendable, Hashable {

        case stretch

        case `repeat`

        case round

        case space
    }
}

extension BorderImage.Outset: LengthConvertible {
    public static func length(_ length: Length) -> BorderImage.Outset {
        BorderImage.Outset(.length(length))
    }
}

extension BorderImage.Width: LengthConvertible {
    public static func length(_ length: Length) -> BorderImage.Width {
        BorderImage.Width(.length(length))
    }
}

extension BorderImage: CustomStringConvertible {

    public var description: String {
        switch self {
        case .config(let config):
            return config.description

        case .global(let global):
            return global.description
        }
    }
}
