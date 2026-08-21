public enum DisplayListitem: String, Sendable, Hashable {

    case listItem = "list-item"

    case blockFlowListItem = "block flow list-item"

    case blockFlowRootListItem = "block flow-root list-item"

    case inlineFlowListItem = "inline flow list-item"

    case inlineFlowRootListItem = "inline flow-root list-item"
}

extension DisplayListitem: CustomStringConvertible {

    public var description: String {
        return rawValue
    }
}

public struct DisplayListitemFactory {
}

extension DisplayListitemFactory {

    public static func create(outer: DisplayOutside, inner: DisplayInside) -> DisplayListitem {
        switch (outer, inner) {
        case (.block, .flow):
            return .blockFlowListItem

        case (.block, .flowRoot):
            return .blockFlowRootListItem

        case (.inline, .flow):
            return .inlineFlowListItem

        case (.inline, .flowRoot):
            return .inlineFlowRootListItem

        default:

            return .listItem
        }
    }
}
