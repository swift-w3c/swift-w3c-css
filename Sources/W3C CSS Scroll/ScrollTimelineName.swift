public import W3C_CSS_Shared
public import W3C_CSS_Values

//
// ScrollTimelineName.swift

/// The `scroll-timeline-name` CSS property defines the name of a named scroll progress timeline, which is
/// progressed through by scrolling a scrollable element (scroller) between top and bottom (or left and right).
///
/// The name is then referenced in an `animation-timeline` declaration to indicate the container's element that
/// is used to drive the progress of the animation through the scrolling action.
///
/// Note: If the element does not overflow its container in the axis dimension or if the overflow
/// is hidden or clipped, no timeline will be created.
///
/// ```css
/// scroll-timeline-name: none;
/// scroll-timeline-name: --custom_name_for_timeline;
/// ```
public enum ScrollTimelineName: Property {
    public static let property: String = "scroll-timeline-name"

    /// No named timeline
    case none

    /// A named timeline with a custom identifier (must start with --)
    case name(ScrollTimeline.CustomIdent)

    /// Global CSS value
    case global(Global)

    public var description: String {
        switch self {
        case .none:
            return "none"
        case .name(let name):
            return name.description
        case .global(let global):
            return global.description
        }
    }

    /// Creates a ScrollTimelineName with a specific name
    /// - Parameter name: The name for the timeline (will be prefixed with -- if not already)
    /// - Returns: A ScrollTimelineName with the specified name
    public static func named(_ name: String) -> Self {
        .name(ScrollTimeline.CustomIdent(rawValue: name))
    }
}
