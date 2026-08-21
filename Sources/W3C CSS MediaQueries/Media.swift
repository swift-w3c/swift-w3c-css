import W3C_CSS_Shared
public import W3C_CSS_Syntax
public import W3C_CSS_Values

public struct Media: AtRule {
    public var rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    public init(_ type: MediaType) {
        self.rawValue = "@media \(type.rawValue)"
    }
}

extension Media {
    public static let identifier: String = "media"

    private static func feature(_ name: String, _ value: any CustomStringConvertible) -> Media {
        Media(rawValue: "@media (\(name): \(value))")
    }

    private var isFeatureQuery: Bool {
        rawValue.starts(with: "@media (") && rawValue.hasSuffix(")")
    }

    private var featureString: String? {
        guard isFeatureQuery else { return nil }
        return String(rawValue.dropFirst(8).dropLast(1))
    }

    public func and(_ other: Media?) -> Media {
        guard let other else { return self }

        let selfContent = String(rawValue.dropFirst(7))
        let otherContent = String(other.rawValue.dropFirst(7))

        return Media(rawValue: "@media \(selfContent) and \(otherContent)")
    }

    public func not() -> Media {
        Media(rawValue: "@media not \(rawValue.dropFirst(7))")
    }

    public func only() -> Media {
        if rawValue.starts(with: "@media ") {
            return Media(rawValue: "@media only \(rawValue.dropFirst(7))")
        }
        return self
    }

    public func or(_ other: Media?) -> Media {
        guard let other else { return self }
        return Media(rawValue: "\(rawValue), \(other.rawValue.dropFirst(7))")
    }

    public static let all = Media(.all)
    public static let print = Media(.print)
    public static let screen = Media(.screen)

    public static let dark = Media(rawValue: "@media (prefers-color-scheme: dark)")

    public static let desktop = Media(rawValue: "@media only screen and (min-width: 832px)")

    public static let mobile = Media(rawValue: "@media only screen and (max-width: 831px)")

    public static let tablet = Media(
        rawValue: "@media only screen and (min-width: 768px) and (max-width: 1024px)"
    )

    public static let landscape = Media(rawValue: "@media (orientation: landscape)")

    public static let portrait = Media(rawValue: "@media (orientation: portrait)")

    public static let retina = Media(
        rawValue: "@media (-webkit-min-device-pixel-ratio: 2), (min-resolution: 192dpi)"
    )

    public static let smallMobile = Media(rawValue: "@media only screen and (max-width: 320px)")

    public static let largeMobile = Media(
        rawValue: "@media only screen and (min-width: 321px) and (max-width: 767px)"
    )

    public static let largeDesktop = Media(rawValue: "@media only screen and (min-width: 1200px)")

    public static let hover = Media(rawValue: "@media (hover: hover)")

    public static let reducedMotion = Media(rawValue: "@media (prefers-reduced-motion: reduce)")
}

extension Media {

    public enum MediaType: String, Hashable, Sendable {

        case all

        case print

        case screen
    }
}

extension Media {

    public static func width(_ value: LengthPercentage) -> Media {
        feature("width", value)
    }

    public static func minWidth(_ value: LengthPercentage) -> Media {
        feature("min-width", value)
    }

    public static func maxWidth(_ value: LengthPercentage) -> Media {
        feature("max-width", value)
    }

    public static func height(_ value: LengthPercentage) -> Media {
        feature("height", value)
    }

    public static func minHeight(_ value: LengthPercentage) -> Media {
        feature("min-height", value)
    }

    public static func maxHeight(_ value: LengthPercentage) -> Media {
        feature("max-height", value)
    }

    public static func aspectRatio(_ width: Int, _ height: Int) -> Media {
        feature("aspect-ratio", "\(width)/\(height)")
    }

    public static func minAspectRatio(_ width: Int, _ height: Int) -> Media {
        feature("min-aspect-ratio", "\(width)/\(height)")
    }

    public static func maxAspectRatio(_ width: Int, _ height: Int) -> Media {
        feature("max-aspect-ratio", "\(width)/\(height)")
    }

    public static func orientation(_ value: Orientation) -> Media {
        feature("orientation", value.rawValue)
    }

    public static func prefersColorScheme(_ value: ColorScheme) -> Media {
        feature("prefers-color-scheme", value.rawValue)
    }

    public static func prefersReducedMotion(_ value: ReducedMotion = .reduce) -> Media {
        feature("prefers-reduced-motion", value.rawValue)
    }

    public static func prefersContrast(_ value: Contrast) -> Media {
        feature("prefers-contrast", value.rawValue)
    }

    public static func prefersReducedData(_ value: ReducedData = .reduce) -> Media {
        feature("prefers-reduced-data", value.rawValue)
    }

    public static func hover(_ value: HoverCapability) -> Media {
        feature("hover", value.rawValue)
    }

    public static func anyHover(_ value: HoverCapability) -> Media {
        feature("any-hover", value.rawValue)
    }

    public static func pointer(_ value: PointerCapability) -> Media {
        feature("pointer", value.rawValue)
    }

    public static func anyPointer(_ value: PointerCapability) -> Media {
        feature("any-pointer", value.rawValue)
    }

    public static func displayMode(_ value: DisplayMode) -> Media {
        feature("display-mode", value.rawValue)
    }

    public static func resolution(_ value: Resolution) -> Media {
        feature("resolution", value)
    }

    public static func minResolution(_ value: Resolution) -> Media {
        feature("min-resolution", value)
    }

    public static func maxResolution(_ value: Resolution) -> Media {
        feature("max-resolution", value)
    }

    public static func scripting(_ value: ScriptingState) -> Media {
        feature("scripting", value.rawValue)
    }

    public static func update(_ value: UpdateFrequency) -> Media {
        feature("update", value.rawValue)
    }
}

extension Media {

    public enum Orientation: String, Hashable, Sendable {
        case portrait
        case landscape
    }

    public enum ColorScheme: String, Hashable, Sendable {
        case light
        case dark
    }

    public enum ReducedMotion: String, Hashable, Sendable {
        case reduce
        case noPreference = "no-preference"
    }

    public enum Contrast: String, Hashable, Sendable {
        case more
        case less
        case custom
        case noPreference = "no-preference"
    }

    public enum ReducedData: String, Hashable, Sendable {
        case reduce
        case noPreference = "no-preference"
    }

    public enum HoverCapability: String, Hashable, Sendable {
        case hover
        case none
    }

    public enum PointerCapability: String, Hashable, Sendable {
        case none
        case coarse
        case fine
    }

    public enum DisplayMode: String, Hashable, Sendable {
        case fullscreen
        case standalone
        case minimalUi = "minimal-ui"
        case browser
        case pictureInPicture = "picture-in-picture"
    }

    public enum ScriptingState: String, Hashable, Sendable {
        case enabled
        case initialOnly = "initial-only"
        case none
    }

    public enum UpdateFrequency: String, Hashable, Sendable {
        case none
        case slow
        case fast
    }
}

extension Media {

    public static func && (lhs: Media, rhs: Media?) -> Media {
        lhs.and(rhs)
    }

    public static func || (lhs: Media, rhs: Media?) -> Media {
        lhs.or(rhs)
    }

    public static prefix func ! (query: Media) -> Media {
        query.not()
    }
}
