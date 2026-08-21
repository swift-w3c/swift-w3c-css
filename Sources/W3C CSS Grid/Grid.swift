public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum Grid: Property {

    case none

    case template([GridTrackSize], [GridTrackSize])

    case autoFlow(AutoFlowDirection, AutoFlowDensity? = nil, GridTrackSize? = nil)

    case explicit([GridTrackSize], AutoFlow)

    case global(Global)
}

extension Grid {
    public static let property: String = "grid"

    public var description: String {
        switch self {
        case .none:
            return "none"

        case .template(let rows, let columns):
            let rowsStr = rows.map { $0.description }.joined(separator: " ")
            let columnsStr = columns.map { $0.description }.joined(separator: " ")
            return "\(rowsStr) / \(columnsStr)"

        case .autoFlow(_, let density, let trackSize):
            var result = "auto-flow"
            if let density, density == .dense {
                result += " dense"
            }
            if let trackSize {
                return "\(result) / \(trackSize)"
            } else {
                return "\(result) / auto"
            }

        case .explicit(let tracks, let autoFlow):
            let tracksStr = tracks.map { $0.description }.joined(separator: " ")
            return "\(tracksStr) / \(autoFlow)"

        case .global(let value):
            return value.description
        }
    }
}

public enum AutoFlowDirection: Sendable, Hashable {

    case row

    case column
}

public enum AutoFlowDensity: Sendable, Hashable {

    case normal

    case dense
}

public struct AutoFlow: Sendable, Hashable, CustomStringConvertible {

    let direction: AutoFlowDirection

    let density: AutoFlowDensity

    let trackSize: GridTrackSize?
}

extension AutoFlow {

    public static func autoFlow(
        _ direction: AutoFlowDirection,
        _ density: AutoFlowDensity = .normal,
        _ trackSize: GridTrackSize? = nil
    ) -> AutoFlow {
        return AutoFlow(direction: direction, density: density, trackSize: trackSize)
    }

    public var description: String {
        var result = "auto-flow"
        if density == .dense {
            result += " dense"
        }
        if let size = trackSize {
            result += " \(size)"
        }
        return result
    }
}

public enum GridTrackSize: Sendable, Hashable, CustomStringConvertible {

    case auto

    case px(Double)

    case percentage(Percentage)

    case fr(Double)

    case minContent

    case maxContent

    case minMax(MinMaxValue, MinMaxValue)

    case fitContent(LengthPercentage)
}

extension GridTrackSize {
    public var description: String {
        return switch self {
        case .auto:
            "auto"

        case .px(let value):
            value.formatted(.number) + "px"

        case .percentage(let percentage):
            percentage.description

        case .fr(let value):
            value.formatted(.number) + "fr"

        case .minContent:
            "min-content"

        case .maxContent:
            "max-content"

        case .minMax(let min, let max):
            "minmax(\(min), \(max))"

        case .fitContent(let value):
            "fit-content(\(value))"
        }
    }
}
