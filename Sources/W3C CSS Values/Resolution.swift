import Formatter

public struct Resolution: Sendable, Hashable {

    public let value: Double

    public let unit: Unit

    public init(_ value: Double, unit: Unit) throws(ResolutionError) {
        guard value >= 0 else {
            throw ResolutionError.invalidValue(
                "Resolution value must be non-negative, got \(value)"
            )
        }
        self.value = value
        self.unit = unit
    }

    private init(unchecked value: Double, unit: Unit) {
        self.value = value
        self.unit = unit
    }
}

extension Resolution {

    public enum ResolutionError: Swift::Error, Sendable {
        case invalidValue(String)
    }

    public enum Unit: String, Sendable, Hashable {

        case dpi

        case dpcm

        case dppx

        case x
    }
}

extension Resolution {

    public static func dpi(_ value: Double) throws(ResolutionError) -> Resolution {
        return try Resolution(value, unit: .dpi)
    }

    public static func dpcm(_ value: Double) throws(ResolutionError) -> Resolution {
        return try Resolution(value, unit: .dpcm)
    }

    public static func dppx(_ value: Double) throws(ResolutionError) -> Resolution {
        return try Resolution(value, unit: .dppx)
    }

    public static func x(_ value: Double) throws(ResolutionError) -> Resolution {
        return try Resolution(value, unit: .x)
    }

    public func converted(to targetUnit: Unit) -> Resolution {
        if unit == targetUnit {
            return self
        }

        let dpiValue: Double
        switch unit {
        case .dpi:
            dpiValue = value

        case .dpcm:
            dpiValue = value * 2.54

        case .dppx, .x:
            dpiValue = value * 96
        }

        switch targetUnit {
        case .dpi:
            return Resolution(unchecked: dpiValue, unit: .dpi)

        case .dpcm:
            return Resolution(unchecked: dpiValue / 2.54, unit: .dpcm)

        case .dppx:
            return Resolution(unchecked: dpiValue / 96, unit: .dppx)

        case .x:
            return Resolution(unchecked: dpiValue / 96, unit: .x)
        }

    }

    public static let standard = Resolution(unchecked: 96, unit: .dpi)

    public static let retina = Resolution(unchecked: 192, unit: .dpi)

    public static let print = Resolution(unchecked: 300, unit: .dpi)

}

extension Resolution: CustomStringConvertible {

    public var description: String {
        return "\(value.formatted(Formatter.Number()))\(unit.rawValue)"
    }
}
