public import W3C_CSS_Shared

public enum Length: Sendable, ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral,
    GlobalConvertible
{

    case length(Double, Unit)

    case keyword(Keyword)

    case calc(String)

    case global(Global)

    public init(integerLiteral value: Int) {
        self = .length(Double(value), .px)
    }

    public init(floatLiteral value: Double) {
        self = .length(value, .px)
    }
}

extension Length {

    public enum Unit: String, Sendable {

        case px

        case em

        case rem

        case vw

        case vh

        case vmin

        case vmax

        case cm

        case mm

        case `in`

        case pt

        case pc

        case ex

        case ch

        case lh

        case fr

        case q

        case cap

        case ic

        case rlh
    }

    public enum Keyword: String, Sendable {

        case auto

        case maxContent = "max-content"

        case minContent = "min-content"

        case fitContent = "fit-content"
    }
}

extension Length: Hashable {

    public static func == (lhs: Length, rhs: Length) -> Bool {
        switch (lhs, rhs) {
        case (.length(let value1, let unit1), .length(let value2, let unit2)):
            return value1 == value2 && unit1 == unit2

        case (.keyword(let keyword1), .keyword(let keyword2)):
            return keyword1 == keyword2

        case (.calc(let calc1), .calc(let calc2)):
            return calc1 == calc2

        case (.global(let global1), .global(let global2)):
            return global1 == global2

        default:
            return false
        }
    }
}

extension Length: Numeric {

    public typealias Magnitude = Double

    public var magnitude: Double {
        switch self {
        case .length(let value, _):
            return abs(value)

        case .calc, .keyword, .global:
            return 0
        }
    }

    public init?<T>(exactly source: T) where T: BinaryInteger {
        self = .length(Double(source), .px)
    }

    @_disfavoredOverload
    public static func * (lhs: Length, rhs: Length) -> Length {
        switch (lhs, rhs) {
        case (.length(let v1, let u1), .length(let v2, let u2)) where u1 == u2:
            return .length(v1 * v2, u1)

        default:
            return .calc("\(lhs) * \(rhs)")
        }
    }

    @_disfavoredOverload
    public static func *= (lhs: inout Length, rhs: Length) {
        lhs = lhs * rhs
    }

    @_disfavoredOverload
    public static func + (lhs: Length, rhs: Length) -> Length {
        switch (lhs, rhs) {
        case (.length(let v1, let u1), .length(let v2, let u2)) where u1 == u2:
            return .length(v1 + v2, u1)

        default:
            return .calc("\(lhs) + \(rhs)")
        }
    }

    @_disfavoredOverload
    public static func += (lhs: inout Length, rhs: Length) {
        lhs = lhs + rhs
    }

    @_disfavoredOverload
    public static func - (lhs: Length, rhs: Length) -> Length {
        switch (lhs, rhs) {
        case (.length(let v1, let u1), .length(let v2, let u2)) where u1 == u2:
            return .length(v1 - v2, u1)

        default:
            return .calc("\(lhs) - \(rhs)")
        }
    }

    @_disfavoredOverload
    public static func -= (lhs: inout Length, rhs: Length) {
        lhs = lhs - rhs
    }

    @_disfavoredOverload
    public static func / (lhs: Length, rhs: Double) -> Length {

        switch lhs {
        case .length(let value, let unit):
            return .length(value / rhs, unit)

        case .calc(let expression):
            return .calc("(\(expression)) / \(rhs)")

        case .keyword, .global:
            return lhs
        }
    }
}

extension Length {

    @_disfavoredOverload
    public static func / (lhs: Length, rhs: Int) -> Length {
        return lhs / Double(rhs)
    }
}

extension Length {

    public static func px(_ value: Double) -> Self { .length(value, .px) }

    public static func em(_ value: Double) -> Self { .length(value, .em) }

    public static func rem(_ value: Double) -> Self { .length(value, .rem) }

    public static func vw(_ value: Double) -> Self { .length(value, .vw) }

    public static func vh(_ value: Double) -> Self { .length(value, .vh) }

    public static func fr(_ value: Double) -> Self { .length(value, .fr) }

    public static let auto: Self = .keyword(.auto)

    public static let maxContent: Self = .keyword(.maxContent)

    public static let minContent: Self = .keyword(.minContent)

    public static let fitContent: Self = .keyword(.fitContent)
}

extension Length: CustomStringConvertible {

    public var description: String {
        switch self {
        case .length(let value, let unit):
            return "\(value.formatted(.number))\(unit.rawValue)"

        case .keyword(let keyword):
            return keyword.rawValue

        case .calc(let expression):
            return "calc(\(expression))"

        case .global(let global):
            return global.rawValue
        }
    }
}

extension Length: LengthConvertible {
    public static func length(_ length: Length) -> Length {
        length
    }
}

extension Int {

    public var px: Length { .px(Double(self)) }

    public var em: Length { .em(Double(self)) }

    public var rem: Length { .rem(Double(self)) }

    public var vw: Length { .vw(Double(self)) }

    public var vh: Length { .vh(Double(self)) }

    public var fr: Length { .fr(Double(self)) }

    public var cm: Length { .length(Double(self), .cm) }

    public var mm: Length { .length(Double(self), .mm) }

    public var `in`: Length { .length(Double(self), .in) }

    public var pt: Length { .length(Double(self), .pt) }

    public var pc: Length { .length(Double(self), .pc) }

    public var ex: Length { .length(Double(self), .ex) }

    public var ch: Length { .length(Double(self), .ch) }

    public var lh: Length { .length(Double(self), .lh) }

    public var vmin: Length { .length(Double(self), .vmin) }

    public var vmax: Length { .length(Double(self), .vmax) }
}

extension Double {

    public var px: Length { .px(self) }

    public var em: Length { .em(self) }

    public var rem: Length { .rem(self) }

    public var vw: Length { .vw(self) }

    public var vh: Length { .vh(self) }

    public var fr: Length { .fr(self) }

    public var cm: Length { .length(self, .cm) }

    public var mm: Length { .length(self, .mm) }

    public var `in`: Length { .length(self, .in) }

    public var pt: Length { .length(self, .pt) }

    public var pc: Length { .length(self, .pc) }

    public var ex: Length { .length(self, .ex) }

    public var ch: Length { .length(self, .ch) }

    public var lh: Length { .length(self, .lh) }

    public var vmin: Length { .length(self, .vmin) }

    public var vmax: Length { .length(self, .vmax) }
}

extension Int {

    public var q: Length { .length(Double(self), .q) }

    public var cap: Length { .length(Double(self), .cap) }

    public var ic: Length { .length(Double(self), .ic) }

    public var rlh: Length { .length(Double(self), .rlh) }
}

extension Double {

    public var q: Length { .length(self, .q) }

    public var cap: Length { .length(self, .cap) }

    public var ic: Length { .length(self, .ic) }

    public var rlh: Length { .length(self, .rlh) }
}
