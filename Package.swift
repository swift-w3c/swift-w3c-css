// swift-tools-version:6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// MARK: - String Extensions for Module Names



extension String {
    // Core Modules
    static let w3cCSSShared: Self = "W3C CSS Shared"
    static let w3cCSSValues: Self = "W3C CSS Values"
    static let w3cCSSColor: Self = "W3C CSS Color"
    static let w3cCSSSyntax: Self = "W3C CSS Syntax"
    static let w3cCSSCascade: Self = "W3C CSS Cascade"
    static let w3cCSSSelectors: Self = "W3C CSS Selectors"
    static let w3cCSSVariables: Self = "W3C CSS Variables"

    // Layout Modules
    static let w3cCSSDisplay: Self = "W3C CSS Display"
    static let w3cCSSFlexbox: Self = "W3C CSS Flexbox"
    static let w3cCSSGrid: Self = "W3C CSS Grid"
    static let w3cCSSPositioning: Self = "W3C CSS Positioning"
    static let w3cCSSMulticolumn: Self = "W3C CSS Multicolumn"
    static let w3cCSSBoxModel: Self = "W3C CSS BoxModel"

    // Typography Modules
    static let w3cCSSText: Self = "W3C CSS Text"
    static let w3cCSSFonts: Self = "W3C CSS Fonts"
    static let w3cCSSTextDecoration: Self = "W3C CSS TextDecoration"
    static let w3cCSSWritingModes: Self = "W3C CSS WritingModes"

    // Visual Effects Modules
    static let w3cCSSBackgrounds: Self = "W3C CSS Backgrounds"
    static let w3cCSSImages: Self = "W3C CSS Images"
    static let w3cCSSTransforms: Self = "W3C CSS Transforms"
    static let w3cCSSFilters: Self = "W3C CSS Filters"
    static let w3cCSSMasking: Self = "W3C CSS Masking"
    static let w3cCSSCompositing: Self = "W3C CSS Compositing"

    // Animation Modules
    static let w3cCSSAnimations: Self = "W3C CSS Animations"
    static let w3cCSSTransitions: Self = "W3C CSS Transitions"
    static let w3cCSSEasing: Self = "W3C CSS Easing"

    // Conditional & Media Modules
    static let w3cCSSConditional: Self = "W3C CSS Conditional"
    static let w3cCSSMediaQueries: Self = "W3C CSS MediaQueries"

    // User Interface Modules
    static let w3cCSSUI: Self = "W3C CSS UI"
    static let w3cCSSPseudoElements: Self = "W3C CSS PseudoElements"
    static let w3cCSSPseudoClasses: Self = "W3C CSS PseudoClasses"

    // Advanced Feature Modules
    static let w3cCSSContainment: Self = "W3C CSS Containment"
    static let w3cCSSScroll: Self = "W3C CSS Scroll"
    static let w3cCSSLogical: Self = "W3C CSS Logical"
    static let w3cCSSAlignment: Self = "W3C CSS Alignment"

    // Specialized Modules
    static let w3cCSSLists: Self = "W3C CSS Lists"
    static let w3cCSSCounterStyles: Self = "W3C CSS CounterStyles"
    static let w3cCSSPaged: Self = "W3C CSS Paged"

    // Umbrella Modules
    static let w3cCSSLayout: Self = "W3C CSS Layout"
    static let w3cCSSTypography: Self = "W3C CSS Typography"
    static let w3cCSSVisual: Self = "W3C CSS Visual"
    static let w3cCSSAnimation: Self = "W3C CSS Animation"
    static let w3cCSS: Self = "W3C CSS"

    var tests: Self { "\(self) Tests" }
}

// MARK: - Target Dependency Extensions

extension Target.Dependency {
    // Core Modules
    static var w3cCSSShared: Self { .target(name: .w3cCSSShared) }
    static var w3cCSSValues: Self { .target(name: .w3cCSSValues) }
    static var w3cCSSColor: Self { .target(name: .w3cCSSColor) }
    static var w3cCSSSyntax: Self { .target(name: .w3cCSSSyntax) }
    static var w3cCSSCascade: Self { .target(name: .w3cCSSCascade) }
    static var w3cCSSSelectors: Self { .target(name: .w3cCSSSelectors) }
    static var w3cCSSVariables: Self { .target(name: .w3cCSSVariables) }

    // Layout Modules
    static var w3cCSSDisplay: Self { .target(name: .w3cCSSDisplay) }
    static var w3cCSSFlexbox: Self { .target(name: .w3cCSSFlexbox) }
    static var w3cCSSGrid: Self { .target(name: .w3cCSSGrid) }
    static var w3cCSSPositioning: Self { .target(name: .w3cCSSPositioning) }
    static var w3cCSSMulticolumn: Self { .target(name: .w3cCSSMulticolumn) }
    static var w3cCSSBoxModel: Self { .target(name: .w3cCSSBoxModel) }

    // Typography Modules
    static var w3cCSSText: Self { .target(name: .w3cCSSText) }
    static var w3cCSSFonts: Self { .target(name: .w3cCSSFonts) }
    static var w3cCSSTextDecoration: Self { .target(name: .w3cCSSTextDecoration) }
    static var w3cCSSWritingModes: Self { .target(name: .w3cCSSWritingModes) }

    // Visual Effects Modules
    static var w3cCSSBackgrounds: Self { .target(name: .w3cCSSBackgrounds) }
    static var w3cCSSImages: Self { .target(name: .w3cCSSImages) }
    static var w3cCSSTransforms: Self { .target(name: .w3cCSSTransforms) }
    static var w3cCSSFilters: Self { .target(name: .w3cCSSFilters) }
    static var w3cCSSMasking: Self { .target(name: .w3cCSSMasking) }
    static var w3cCSSCompositing: Self { .target(name: .w3cCSSCompositing) }

    // Animation Modules
    static var w3cCSSAnimations: Self { .target(name: .w3cCSSAnimations) }
    static var w3cCSSTransitions: Self { .target(name: .w3cCSSTransitions) }
    static var w3cCSSEasing: Self { .target(name: .w3cCSSEasing) }

    // Conditional & Media Modules
    static var w3cCSSConditional: Self { .target(name: .w3cCSSConditional) }
    static var w3cCSSMediaQueries: Self { .target(name: .w3cCSSMediaQueries) }

    // User Interface Modules
    static var w3cCSSUI: Self { .target(name: .w3cCSSUI) }
    static var w3cCSSPseudoElements: Self { .target(name: .w3cCSSPseudoElements) }
    static var w3cCSSPseudoClasses: Self { .target(name: .w3cCSSPseudoClasses) }

    // Advanced Feature Modules
    static var w3cCSSContainment: Self { .target(name: .w3cCSSContainment) }
    static var w3cCSSScroll: Self { .target(name: .w3cCSSScroll) }
    static var w3cCSSLogical: Self { .target(name: .w3cCSSLogical) }
    static var w3cCSSAlignment: Self { .target(name: .w3cCSSAlignment) }

    // Specialized Modules
    static var w3cCSSLists: Self { .target(name: .w3cCSSLists) }
    static var w3cCSSCounterStyles: Self { .target(name: .w3cCSSCounterStyles) }
    static var w3cCSSPaged: Self { .target(name: .w3cCSSPaged) }

    // Umbrella Modules
    static var w3cCSSLayout: Self { .target(name: .w3cCSSLayout) }
    static var w3cCSSTypography: Self { .target(name: .w3cCSSTypography) }
    static var w3cCSSVisual: Self { .target(name: .w3cCSSVisual) }
    static var w3cCSSAnimation: Self { .target(name: .w3cCSSAnimation) }
    static var w3cCSS: Self { .target(name: .w3cCSS) }
}

// MARK: - Package Definition

let package = Package(
    name: "swift-w3c-css",
    platforms: [
        .macOS(.v26),
        .iOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26),
        .macCatalyst(.v26)
    ],
    products: [
        // Core Modules
        .library(name: "W3C CSS Shared", targets: ["W3C CSS Shared"]),
        .library(name: "W3C CSS Values", targets: ["W3C CSS Values"]),
        .library(name: "W3C CSS Color", targets: ["W3C CSS Color"]),
        .library(name: "W3C CSS Syntax", targets: ["W3C CSS Syntax"]),
        .library(name: "W3C CSS Cascade", targets: ["W3C CSS Cascade"]),
        .library(name: "W3C CSS Selectors", targets: ["W3C CSS Selectors"]),
        .library(name: "W3C CSS Variables", targets: ["W3C CSS Variables"]),

        // Layout Modules
        .library(name: "W3C CSS Display", targets: ["W3C CSS Display"]),
        .library(name: "W3C CSS Flexbox", targets: ["W3C CSS Flexbox"]),
        .library(name: "W3C CSS Grid", targets: ["W3C CSS Grid"]),
        .library(name: "W3C CSS Positioning", targets: ["W3C CSS Positioning"]),
        .library(name: "W3C CSS Multicolumn", targets: ["W3C CSS Multicolumn"]),
        .library(name: "W3C CSS BoxModel", targets: ["W3C CSS BoxModel"]),

        // Typography Modules
        .library(name: "W3C CSS Text", targets: ["W3C CSS Text"]),
        .library(name: "W3C CSS Fonts", targets: ["W3C CSS Fonts"]),
        .library(name: "W3C CSS TextDecoration", targets: ["W3C CSS TextDecoration"]),
        .library(name: "W3C CSS WritingModes", targets: ["W3C CSS WritingModes"]),

        // Visual Effects Modules
        .library(name: "W3C CSS Backgrounds", targets: ["W3C CSS Backgrounds"]),
        .library(name: "W3C CSS Images", targets: ["W3C CSS Images"]),
        .library(name: "W3C CSS Transforms", targets: ["W3C CSS Transforms"]),
        .library(name: "W3C CSS Filters", targets: ["W3C CSS Filters"]),
        .library(name: "W3C CSS Masking", targets: ["W3C CSS Masking"]),
        .library(name: "W3C CSS Compositing", targets: ["W3C CSS Compositing"]),

        // Animation Modules
        .library(name: "W3C CSS Animations", targets: ["W3C CSS Animations"]),
        .library(name: "W3C CSS Transitions", targets: ["W3C CSS Transitions"]),
        .library(name: "W3C CSS Easing", targets: ["W3C CSS Easing"]),

        // Conditional & Media Modules
        .library(name: "W3C CSS Conditional", targets: ["W3C CSS Conditional"]),
        .library(name: "W3C CSS MediaQueries", targets: ["W3C CSS MediaQueries"]),

        // User Interface Modules
        .library(name: "W3C CSS UI", targets: ["W3C CSS UI"]),
        .library(name: "W3C CSS PseudoElements", targets: ["W3C CSS PseudoElements"]),
        .library(name: "W3C CSS PseudoClasses", targets: ["W3C CSS PseudoClasses"]),

        // Advanced Feature Modules
        .library(name: "W3C CSS Containment", targets: ["W3C CSS Containment"]),
        .library(name: "W3C CSS Scroll", targets: ["W3C CSS Scroll"]),
        .library(name: "W3C CSS Logical", targets: ["W3C CSS Logical"]),
        .library(name: "W3C CSS Alignment", targets: ["W3C CSS Alignment"]),

        // Specialized Modules
        .library(name: "W3C CSS Lists", targets: ["W3C CSS Lists"]),
        .library(name: "W3C CSS CounterStyles", targets: ["W3C CSS CounterStyles"]),
        .library(name: "W3C CSS Paged", targets: ["W3C CSS Paged"]),

        // Umbrella Modules
        .library(name: "W3C CSS Layout", targets: ["W3C CSS Layout"]),
        .library(name: "W3C CSS Typography", targets: ["W3C CSS Typography"]),
        .library(name: "W3C CSS Visual", targets: ["W3C CSS Visual"]),
        .library(name: "W3C CSS Animation", targets: ["W3C CSS Animation"]),
        .library(name: "W3C CSS", targets: ["W3C CSS"])
    ],
    dependencies: [
        .package(path: "../swift-cssom"),
        .package(path: "../../swift-primitives/swift-formatting-primitives"),
        .package(path: "../../swift-primitives/swift-geometry-primitives"),
        .package(path: "../swift-ieee-754"),
        .package(path: "../swift-iec-61966"),
        .package(path: "../../swift-foundations/swift-ascii"),
        .package(path: "../swift-rfc-4648")
    ],
    targets: [
        // MARK: - Core Modules

        .target(
            name: "W3C CSS Shared",
            dependencies: [
                .product(name: "W3C CSSOM", package: "swift-cssom"),
                .product(name: "ASCII", package: "swift-ascii"),
                .product(name: "Formatting Primitives", package: "swift-formatting-primitives"),
                .product(name: "Geometry Primitives", package: "swift-geometry-primitives")
    ]
        ),

        .target(
            name: "W3C CSS Values",
            dependencies: [
                .w3cCSSShared,
                .product(name: "IEEE 754", package: "swift-ieee-754"),
                .product(name: "IEC 61966", package: "swift-iec-61966"),
                .product(name: "RFC 4648", package: "swift-rfc-4648")
    ]
        ),

        .target(
            name: "W3C CSS Color",
            dependencies: [.w3cCSSShared, .w3cCSSValues, .w3cCSSSyntax]
        ),

        .target(
            name: "W3C CSS Syntax",
            dependencies: [.w3cCSSShared, .w3cCSSValues]
        ),

        .target(
            name: "W3C CSS Cascade",
            dependencies: [.w3cCSSShared, .w3cCSSSyntax, .w3cCSSSelectors]
        ),

        .target(
            name: "W3C CSS Selectors",
            dependencies: [.w3cCSSShared]
        ),

        .target(
            name: "W3C CSS Variables",
            dependencies: [.w3cCSSShared]
        ),

        // MARK: - Layout Modules

        .target(
            name: "W3C CSS Display",
            dependencies: [.w3cCSSShared, .w3cCSSValues]
        ),

        .target(
            name: "W3C CSS Flexbox",
            dependencies: [.w3cCSSShared, .w3cCSSValues, .w3cCSSAlignment]
        ),

        .target(
            name: "W3C CSS Grid",
            dependencies: [.w3cCSSShared, .w3cCSSValues]
        ),

        .target(
            name: "W3C CSS Positioning",
            dependencies: [.w3cCSSShared, .w3cCSSValues, .w3cCSSSyntax]
        ),

        .target(
            name: "W3C CSS Multicolumn",
            dependencies: [.w3cCSSShared, .w3cCSSValues, .w3cCSSColor, .w3cCSSBackgrounds]
        ),

        .target(
            name: "W3C CSS BoxModel",
            dependencies: [.w3cCSSShared, .w3cCSSValues]
        ),

        // MARK: - Typography Modules

        .target(
            name: "W3C CSS Text",
            dependencies: [.w3cCSSShared, .w3cCSSValues, .w3cCSSColor]
        ),

        .target(
            name: "W3C CSS Fonts",
            dependencies: [.w3cCSSShared, .w3cCSSValues, .w3cCSSSyntax, .w3cCSSText]
        ),

        .target(
            name: "W3C CSS TextDecoration",
            dependencies: [.w3cCSSShared, .w3cCSSValues, .w3cCSSColor]
        ),

        .target(
            name: "W3C CSS WritingModes",
            dependencies: [.w3cCSSShared]
        ),

        // MARK: - Visual Effects Modules

        .target(
            name: "W3C CSS Backgrounds",
            dependencies: [.w3cCSSShared, .w3cCSSValues, .w3cCSSColor, .w3cCSSImages]
        ),

        .target(
            name: "W3C CSS Images",
            dependencies: [.w3cCSSShared, .w3cCSSValues, .w3cCSSColor]
        ),

        .target(
            name: "W3C CSS Transforms",
            dependencies: [.w3cCSSShared, .w3cCSSValues]
        ),

        .target(
            name: "W3C CSS Filters",
            dependencies: [.w3cCSSShared, .w3cCSSValues, .w3cCSSColor]
        ),

        .target(
            name: "W3C CSS Masking",
            dependencies: [.w3cCSSShared, .w3cCSSValues, .w3cCSSImages, .w3cCSSPositioning]
        ),

        .target(
            name: "W3C CSS Compositing",
            dependencies: [.w3cCSSShared]
        ),

        // MARK: - Animation Modules

        .target(
            name: "W3C CSS Animations",
            dependencies: [.w3cCSSShared, .w3cCSSEasing, .w3cCSSMasking, .w3cCSSPositioning]
        ),

        .target(
            name: "W3C CSS Transitions",
            dependencies: [.w3cCSSShared, .w3cCSSValues, .w3cCSSEasing, .w3cCSSColor, .w3cCSSSyntax]
        ),

        .target(
            name: "W3C CSS Easing",
            dependencies: [.w3cCSSShared, .w3cCSSValues]
        ),

        // MARK: - Conditional & Media Modules

        .target(
            name: "W3C CSS Conditional",
            dependencies: [.w3cCSSShared]
        ),

        .target(
            name: "W3C CSS MediaQueries",
            dependencies: [.w3cCSSShared, .w3cCSSValues, .w3cCSSSyntax]
        ),

        // MARK: - User Interface Modules

        .target(
            name: "W3C CSS UI",
            dependencies: [.w3cCSSShared, .w3cCSSValues, .w3cCSSColor, .w3cCSSBackgrounds]
        ),

        .target(
            name: "W3C CSS PseudoElements",
            dependencies: [.w3cCSSShared]
        ),

        .target(
            name: "W3C CSS PseudoClasses",
            dependencies: [.w3cCSSShared]
        ),

        // MARK: - Advanced Feature Modules

        .target(
            name: "W3C CSS Containment",
            dependencies: [.w3cCSSShared, .w3cCSSValues, .w3cCSSLists]
        ),

        .target(
            name: "W3C CSS Scroll",
            dependencies: [.w3cCSSShared, .w3cCSSValues, .w3cCSSColor]
        ),

        .target(
            name: "W3C CSS Logical",
            dependencies: [.w3cCSSShared, .w3cCSSValues]
        ),

        .target(
            name: "W3C CSS Alignment",
            dependencies: [.w3cCSSShared, .w3cCSSValues]
        ),

        // MARK: - Specialized Modules

        .target(
            name: "W3C CSS Lists",
            dependencies: [.w3cCSSShared, .w3cCSSValues, .w3cCSSCounterStyles, .w3cCSSImages]
        ),

        .target(
            name: "W3C CSS CounterStyles",
            dependencies: [.w3cCSSShared, .w3cCSSSyntax]
        ),

        .target(
            name: "W3C CSS Paged",
            dependencies: [.w3cCSSShared, .w3cCSSValues, .w3cCSSSyntax]
        ),

        // MARK: - Umbrella Modules

        .target(
            name: "W3C CSS Layout",
            dependencies: [
                .w3cCSSDisplay,
                .w3cCSSFlexbox,
                .w3cCSSGrid,
                .w3cCSSPositioning,
                .w3cCSSMulticolumn,
                .w3cCSSBoxModel,
                .w3cCSSAlignment
            ]
        ),

        .target(
            name: "W3C CSS Typography",
            dependencies: [
                .w3cCSSText,
                .w3cCSSFonts,
                .w3cCSSTextDecoration,
                .w3cCSSWritingModes
            ]
        ),

        .target(
            name: "W3C CSS Visual",
            dependencies: [
                .w3cCSSBackgrounds,
                .w3cCSSImages,
                .w3cCSSTransforms,
                .w3cCSSFilters,
                .w3cCSSMasking,
                .w3cCSSCompositing,
                .w3cCSSPositioning
            ]
        ),

        .target(
            name: "W3C CSS Animation",
            dependencies: [
                .w3cCSSAnimations,
                .w3cCSSTransitions,
                .w3cCSSEasing,
                .w3cCSSPositioning
            ]
        ),

        .target(
            name: "W3C CSS",
            dependencies: [
                // Core
                .w3cCSSShared,
                .w3cCSSValues,
                .w3cCSSColor,
                .w3cCSSSyntax,
                .w3cCSSCascade,
                .w3cCSSSelectors,
                .w3cCSSVariables,
                // Layout
                .w3cCSSLayout,
                // Typography
                .w3cCSSTypography,
                // Visual
                .w3cCSSVisual,
                // Animation
                .w3cCSSAnimation,
                // Conditional & Media
                .w3cCSSConditional,
                .w3cCSSMediaQueries,
                // UI
                .w3cCSSUI,
                .w3cCSSPseudoElements,
                .w3cCSSPseudoClasses,
                // Advanced
                .w3cCSSContainment,
                .w3cCSSScroll,
                .w3cCSSLogical,
                // Specialized
                .w3cCSSLists,
                .w3cCSSCounterStyles,
                .w3cCSSPaged
            ]
        ),
        .testTarget(
            name: "W3C CSS Alignment Tests",
            dependencies: [
                "W3C CSS Shared",
            ]
        ),
        .testTarget(
            name: "W3C CSS Animations Tests",
            dependencies: [
                "W3C CSS Shared",
            ]
        ),
        .testTarget(
            name: "W3C CSS Backgrounds Tests",
            dependencies: [
                "W3C CSS Shared",
            ]
        ),
        .testTarget(
            name: "W3C CSS BoxModel Tests",
            dependencies: [
                "W3C CSS Shared",
            ]
        ),
        .testTarget(
            name: "W3C CSS Cascade Tests",
            dependencies: [
                "W3C CSS Shared",
            ]
        ),
        .testTarget(
            name: "W3C CSS Color Tests",
            dependencies: [
                "W3C CSS Shared",
            ]
        ),
        .testTarget(
            name: "W3C CSS Compositing Tests",
            dependencies: [
                "W3C CSS Shared",
            ]
        ),
        .testTarget(
            name: "W3C CSS Conditional Tests",
            dependencies: [
                "W3C CSS Shared",
            ]
        ),
        .testTarget(
            name: "W3C CSS Containment Tests",
            dependencies: [
                "W3C CSS Shared",
            ]
        ),
        .testTarget(
            name: "W3C CSS CounterStyles Tests",
            dependencies: [
                "W3C CSS Shared",
            ]
        ),
        .testTarget(
            name: "W3C CSS Display Tests",
            dependencies: [
                "W3C CSS Shared",
            ]
        ),
        .testTarget(
            name: "W3C CSS Easing Tests",
            dependencies: [
                "W3C CSS Shared",
            ]
        ),
        .testTarget(
            name: "W3C CSS Filters Tests",
            dependencies: [
                "W3C CSS Shared",
            ]
        ),
        .testTarget(
            name: "W3C CSS Flexbox Tests",
            dependencies: [
                "W3C CSS Shared",
            ]
        ),
        .testTarget(
            name: "W3C CSS Fonts Tests",
            dependencies: [
                "W3C CSS Shared",
            ]
        ),
        .testTarget(
            name: "W3C CSS Grid Tests",
            dependencies: [
                "W3C CSS Shared",
            ]
        ),
        .testTarget(
            name: "W3C CSS Images Tests",
            dependencies: [
                "W3C CSS Shared",
            ]
        ),
        .testTarget(
            name: "W3C CSS Lists Tests",
            dependencies: [
                "W3C CSS Shared",
            ]
        ),
        .testTarget(
            name: "W3C CSS Logical Tests",
            dependencies: [
                "W3C CSS Shared",
            ]
        ),
        .testTarget(
            name: "W3C CSS Masking Tests",
            dependencies: [
                "W3C CSS Shared",
            ]
        ),
        .testTarget(
            name: "W3C CSS MediaQueries Tests",
            dependencies: [
                "W3C CSS Shared",
            ]
        ),
        .testTarget(
            name: "W3C CSS Multicolumn Tests",
            dependencies: [
                "W3C CSS Shared",
            ]
        ),
        .testTarget(
            name: "W3C CSS Paged Tests",
            dependencies: [
                "W3C CSS Shared",
            ]
        ),
        .testTarget(
            name: "W3C CSS Positioning Tests",
            dependencies: [
                "W3C CSS Shared",
            ]
        ),
        .testTarget(
            name: "W3C CSS PseudoClasses Tests",
            dependencies: [
                "W3C CSS Shared",
            ]
        ),
        .testTarget(
            name: "W3C CSS PseudoElements Tests",
            dependencies: [
                "W3C CSS Shared",
            ]
        ),
        .testTarget(
            name: "W3C CSS Scroll Tests",
            dependencies: [
                "W3C CSS Shared",
            ]
        ),
        .testTarget(
            name: "W3C CSS Selectors Tests",
            dependencies: [
                "W3C CSS Shared",
            ]
        ),
        .testTarget(
            name: "W3C CSS Shared Tests",
            dependencies: [
                "W3C CSS Shared",
            ]
        ),
        .testTarget(
            name: "W3C CSS Syntax Tests",
            dependencies: [
                "W3C CSS Shared",
            ]
        ),
        .testTarget(
            name: "W3C CSS Text Tests",
            dependencies: [
                "W3C CSS Shared",
            ]
        ),
        .testTarget(
            name: "W3C CSS TextDecoration Tests",
            dependencies: [
                "W3C CSS Shared",
            ]
        ),
        .testTarget(
            name: "W3C CSS Transforms Tests",
            dependencies: [
                "W3C CSS Shared",
            ]
        ),
        .testTarget(
            name: "W3C CSS Transitions Tests",
            dependencies: [
                "W3C CSS Shared",
            ]
        ),
        .testTarget(
            name: "W3C CSS UI Tests",
            dependencies: [
                "W3C CSS Shared",
            ]
        ),
        .testTarget(
            name: "W3C CSS Values Tests",
            dependencies: [
                "W3C CSS Shared",
            ]
        ),
        .testTarget(
            name: "W3C CSS Variables Tests",
            dependencies: [
                "W3C CSS Shared",
            ]
        ),
        .testTarget(
            name: "W3C CSS WritingModes Tests",
            dependencies: [
                "W3C CSS Shared",
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableExperimentalFeature("SuppressedAssociatedTypes"),
        .enableExperimentalFeature("SuppressedAssociatedTypesWithDefaults"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
