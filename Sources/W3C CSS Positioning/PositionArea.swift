public import W3C_CSS_Shared
import W3C_CSS_Values

public enum PositionArea: Property {

    case none

    case physical(Physical, Physical)

    case logical(Logical, Logical)

    case selfLogical(SelfLogical, SelfLogical)

    case startEnd(StartEnd, StartEnd)

    case selfStartEnd(SelfStartEnd, SelfStartEnd)

    case single(AreaKeyword)

    case global(Global)
}

extension PositionArea {
    public static let property: String = "position-area"

    public enum Physical: String, Sendable, Hashable {

        case top
        case center
        case bottom
        case spanTop = "span-top"
        case spanBottom = "span-bottom"
        case yStart = "y-start"
        case yEnd = "y-end"
        case spanYStart = "span-y-start"
        case spanYEnd = "span-y-end"
        case ySelfStart = "y-self-start"
        case ySelfEnd = "y-self-end"
        case spanYSelfStart = "span-y-self-start"
        case spanYSelfEnd = "span-y-self-end"

        case left
        case right
        case spanLeft = "span-left"
        case spanRight = "span-right"
        case xStart = "x-start"
        case xEnd = "x-end"
        case spanXStart = "span-x-start"
        case spanXEnd = "span-x-end"
        case xSelfStart = "x-self-start"
        case xSelfEnd = "x-self-end"
        case spanXSelfStart = "span-x-self-start"
        case spanXSelfEnd = "span-x-self-end"

        case spanAll = "span-all"
    }

    public enum Logical: String, Sendable, Hashable {

        case blockStart = "block-start"
        case center
        case blockEnd = "block-end"
        case spanBlockStart = "span-block-start"
        case spanBlockEnd = "span-block-end"

        case inlineStart = "inline-start"
        case inlineEnd = "inline-end"
        case spanInlineStart = "span-inline-start"
        case spanInlineEnd = "span-inline-end"

        case spanAll = "span-all"
    }

    public enum SelfLogical: String, Sendable, Hashable {

        case selfBlockStart = "self-block-start"
        case center
        case selfBlockEnd = "self-block-end"
        case spanSelfBlockStart = "span-self-block-start"
        case spanSelfBlockEnd = "span-self-block-end"

        case selfInlineStart = "self-inline-start"
        case selfInlineEnd = "self-inline-end"
        case spanSelfInlineStart = "span-self-inline-start"
        case spanSelfInlineEnd = "span-self-inline-end"

        case spanAll = "span-all"
    }

    public enum StartEnd: String, Sendable, Hashable {
        case start
        case center
        case end
        case spanStart = "span-start"
        case spanEnd = "span-end"
        case spanAll = "span-all"
    }

    public enum SelfStartEnd: String, Sendable, Hashable {
        case selfStart = "self-start"
        case center
        case selfEnd = "self-end"
        case spanSelfStart = "span-self-start"
        case spanSelfEnd = "span-self-end"
        case spanAll = "span-all"
    }

    public enum AreaKeyword: String, Sendable, Hashable {

        case top
        case bottom
        case left
        case right

        case blockStart = "block-start"
        case blockEnd = "block-end"
        case inlineStart = "inline-start"
        case inlineEnd = "inline-end"

        case selfBlockStart = "self-block-start"
        case selfBlockEnd = "self-block-end"
        case selfInlineStart = "self-inline-start"
        case selfInlineEnd = "self-inline-end"

        case start
        case end
        case selfStart = "self-start"
        case selfEnd = "self-end"

        case center

        case spanAll = "span-all"
    }

    public enum Vertical {

        case top

        case bottom

        case center

        case spanTop

        case spanBottom

        case yStart

        case yEnd

        case spanAll
    }

    public enum Horizontal {

        case left

        case right

        case center

        case spanLeft

        case spanRight

        case xStart

        case xEnd

        case spanAll
    }

    public var description: String {
        switch self {
        case .none:
            return "none"

        case .physical(let v, let h):
            return "\(v.rawValue) \(h.rawValue)"

        case .logical(let v, let h):
            return "\(v.rawValue) \(h.rawValue)"

        case .selfLogical(let v, let h):
            return "\(v.rawValue) \(h.rawValue)"

        case .startEnd(let v, let h):
            return "\(v.rawValue) \(h.rawValue)"

        case .selfStartEnd(let v, let h):
            return "\(v.rawValue) \(h.rawValue)"

        case .single(let keyword):
            return keyword.rawValue

        case .global(let global):
            return global.description
        }
    }

    public static func vertical(_ vertical: Vertical, _ horizontal: Horizontal) -> PositionArea {
        .physical(vertical.physical, horizontal.physical)
    }

}

extension PositionArea.Vertical {

    fileprivate var physical: PositionArea.Physical {
        switch self {
        case .top: return .top
        case .bottom: return .bottom
        case .center: return .center
        case .spanTop: return .spanTop
        case .spanBottom: return .spanBottom
        case .yStart: return .yStart
        case .yEnd: return .yEnd
        case .spanAll: return .spanAll
        }
    }
}

extension PositionArea.Horizontal {

    fileprivate var physical: PositionArea.Physical {
        switch self {
        case .left: return .left
        case .right: return .right
        case .center: return .center
        case .spanLeft: return .spanLeft
        case .spanRight: return .spanRight
        case .xStart: return .xStart
        case .xEnd: return .xEnd
        case .spanAll: return .spanAll
        }
    }
}
