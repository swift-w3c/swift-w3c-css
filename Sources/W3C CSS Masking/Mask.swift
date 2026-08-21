import W3C_CSS_Positioning
public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum Mask: Property {

    case none

    case configuration(Configuration)

    case layers([Configuration])

    case global(Global)
}

extension Mask {
    public static let property: String = "mask"

    public struct Configuration: Sendable, Hashable, CustomStringConvertible {

        public let reference: MaskReference

        public let position: Position?

        public let size: Size?

        public let `repeat`: RepeatStyle?

        public let clip: GeometryBox?

        public let origin: GeometryBox?

        public let composite: Composite?

        public let mode: MaskingMode?

        public init(
            _ reference: MaskReference,
            position: Position? = nil,
            size: Size? = nil,
            repeat: RepeatStyle? = nil,
            clip: GeometryBox? = nil,
            origin: GeometryBox? = nil,
            composite: Composite? = nil,
            mode: MaskingMode? = nil
        ) {
            self.reference = reference
            self.position = position
            self.size = size
            self.repeat = `repeat`
            self.clip = clip
            self.origin = origin
            self.composite = composite
            self.mode = mode
        }
    }

    public enum MaskReference: Sendable, Hashable, CustomStringConvertible {

        case none

        case url(Url)

        case linearGradient(CSSString)

        case radialGradient(CSSString)

        case conicGradient(CSSString)

        case repeatingLinearGradient(CSSString)

        case repeatingRadialGradient(CSSString)

        case repeatingConicGradient(CSSString)
    }

    public enum Position: Sendable, Hashable {

        case keywords(Horizontal, Vertical)

        case custom(LengthPercentage, LengthPercentage)

        case center

        case top

        case bottom

        case left

        case right
    }

    public enum Size: Sendable, Hashable {

        case dimensions(LengthPercentage, LengthPercentage)

        case cover

        case contain

        case auto
    }

    public enum RepeatStyle: Sendable, Hashable {

        case repeatX

        case repeatY

        case `repeat`

        case space

        case round

        case noRepeat

        case horizontalVertical(Value, Value)
    }

    public enum GeometryBox: Sendable, Hashable {

        case contentBox

        case paddingBox

        case borderBox

        case marginBox

        case fillBox

        case strokeBox

        case viewBox

        case noClip
    }

    public enum Composite: String, Sendable, Hashable {

        case add

        case subtract

        case intersect

        case exclude
    }

    public enum MaskingMode: Sendable, Hashable {

        case alpha

        case luminance

        case matchSource
    }

    public static func url(_ url: Url) -> Mask {
        return .configuration(Configuration(.url(url)))
    }

    public static func linearGradient(_ gradient: CSSString) -> Mask {
        return .configuration(Configuration(.linearGradient(gradient)))
    }

    public static func radialGradient(_ gradient: CSSString) -> Mask {
        return .configuration(Configuration(.radialGradient(gradient)))
    }
}

extension Mask.Configuration {

    public var description: String {
        var parts: [String] = []

        parts.append(reference.description)

        if let mode {
            parts.append(modeDescription(mode))
        }

        if let position {
            let positionPart = positionDescription(position)

            if let size {
                parts.append("\(positionPart) / \(sizeDescription(size))")
            } else {
                parts.append(positionPart)
            }
        } else if let size {
            parts.append("0% 0% / \(sizeDescription(size))")
        }

        if let `repeat` {
            parts.append(repeatDescription(`repeat`))
        }

        if let origin {
            if let clip {

                if clip != origin {
                    parts.append(geometryBoxDescription(origin))
                    parts.append(clipDescription(clip))
                } else {

                    parts.append(geometryBoxDescription(origin))
                }
            } else {
                parts.append(geometryBoxDescription(origin))
            }
        } else if let clip {
            parts.append(clipDescription(clip))
        }

        if let composite {
            parts.append(compositeDescription(composite))
        }

        return parts.joined(separator: " ")
    }

    private func positionDescription(_ position: Mask.Position) -> String {
        switch position {
        case .keywords(let horizontal, let vertical):
            return "\(horizontal.rawValue) \(vertical.rawValue)"

        case .custom(let x, let y):
            return "\(x) \(y)"

        case .center:
            return "center"

        case .top:
            return "top"

        case .bottom:
            return "bottom"

        case .left:
            return "left"

        case .right:
            return "right"
        }
    }

    private func sizeDescription(_ size: Mask.Size) -> String {
        switch size {
        case .dimensions(let width, let height):
            return "\(width) \(height)"

        case .cover:
            return "cover"

        case .contain:
            return "contain"

        case .auto:
            return "auto"
        }
    }

    private func repeatDescription(_ repeat: Mask.RepeatStyle) -> String {
        switch `repeat` {
        case .repeatX:
            return "repeat-x"

        case .repeatY:
            return "repeat-y"

        case .repeat:
            return "repeat"

        case .space:
            return "space"

        case .round:
            return "round"

        case .noRepeat:
            return "no-repeat"

        case .horizontalVertical(let horizontal, let vertical):
            return "\(horizontal.rawValue) \(vertical.rawValue)"
        }
    }

    private func geometryBoxDescription(_ box: Mask.GeometryBox) -> String {
        switch box {
        case .contentBox:
            return "content-box"

        case .paddingBox:
            return "padding-box"

        case .borderBox:
            return "border-box"

        case .marginBox:
            return "margin-box"

        case .fillBox:
            return "fill-box"

        case .strokeBox:
            return "stroke-box"

        case .viewBox:
            return "view-box"

        case .noClip:
            return "no-clip"
        }
    }

    private func clipDescription(_ clip: Mask.GeometryBox) -> String {
        if clip == .noClip {
            return "no-clip"
        } else {
            return geometryBoxDescription(clip)
        }
    }

    private func compositeDescription(_ composite: Mask.Composite) -> String {
        switch composite {
        case .add:
            return "add"

        case .subtract:
            return "subtract"

        case .intersect:
            return "intersect"

        case .exclude:
            return "exclude"
        }
    }

    private func modeDescription(_ mode: Mask.MaskingMode) -> String {
        switch mode {
        case .alpha:
            return "alpha"

        case .luminance:
            return "luminance"

        case .matchSource:
            return "match-source"
        }
    }
}

extension Mask.MaskReference {

    public var description: String {
        switch self {
        case .none:
            return "none"

        case .url(let url):

            if url.value.hasPrefix("url(") {
                return url.description
            }

            if url.value.contains("\"") || url.value.contains("'") {
                return "url(\(url))"
            }

            return "url(\"\(url)\")"

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
}

extension Mask.Position {

    public enum Horizontal: String, Sendable {
        case left
        case center
        case right
    }

    public enum Vertical: String, Sendable {
        case top
        case center
        case bottom
    }
}

extension Mask.RepeatStyle {

    public enum Value: String, Sendable {
        case `repeat`
        case space
        case round
        case noRepeat = "no-repeat"
    }
}

extension Mask: CustomStringConvertible {

    public var description: String {
        switch self {
        case .none:
            return "none"

        case .configuration(let config):
            return config.description

        case .layers(let configs):
            return configs.map { $0.description }.joined(separator: ", ")

        case .global(let global):
            return global.description
        }
    }
}
