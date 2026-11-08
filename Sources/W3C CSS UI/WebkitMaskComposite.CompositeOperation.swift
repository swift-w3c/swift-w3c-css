public import W3C_CSS_Shared
import W3C_CSS_Values

extension WebkitMaskComposite {
    public enum CompositeOperation: String, Sendable, Hashable, CaseIterable {

        case clear

        case copy

        case sourceOver = "source-over"

        case sourceIn = "source-in"

        case sourceOut = "source-out"

        case sourceAtop = "source-atop"

        case destinationOver = "destination-over"

        case destinationIn = "destination-in"

        case destinationOut = "destination-out"

        case destinationAtop = "destination-atop"

        case xor
    }
}
