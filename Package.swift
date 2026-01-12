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
        .macCatalyst(.v26),
    ],
    products: [
        // Core Modules
        .library(name: .w3cCSSShared, targets: [.w3cCSSShared]),
        .library(name: .w3cCSSValues, targets: [.w3cCSSValues]),
        .library(name: .w3cCSSColor, targets: [.w3cCSSColor]),
        .library(name: .w3cCSSSyntax, targets: [.w3cCSSSyntax]),
        .library(name: .w3cCSSCascade, targets: [.w3cCSSCascade]),
        .library(name: .w3cCSSSelectors, targets: [.w3cCSSSelectors]),
        .library(name: .w3cCSSVariables, targets: [.w3cCSSVariables]),

        // Layout Modules
        .library(name: .w3cCSSDisplay, targets: [.w3cCSSDisplay]),
        .library(name: .w3cCSSFlexbox, targets: [.w3cCSSFlexbox]),
        .library(name: .w3cCSSGrid, targets: [.w3cCSSGrid]),
        .library(name: .w3cCSSPositioning, targets: [.w3cCSSPositioning]),
        .library(name: .w3cCSSMulticolumn, targets: [.w3cCSSMulticolumn]),
        .library(name: .w3cCSSBoxModel, targets: [.w3cCSSBoxModel]),

        // Typography Modules
        .library(name: .w3cCSSText, targets: [.w3cCSSText]),
        .library(name: .w3cCSSFonts, targets: [.w3cCSSFonts]),
        .library(name: .w3cCSSTextDecoration, targets: [.w3cCSSTextDecoration]),
        .library(name: .w3cCSSWritingModes, targets: [.w3cCSSWritingModes]),

        // Visual Effects Modules
        .library(name: .w3cCSSBackgrounds, targets: [.w3cCSSBackgrounds]),
        .library(name: .w3cCSSImages, targets: [.w3cCSSImages]),
        .library(name: .w3cCSSTransforms, targets: [.w3cCSSTransforms]),
        .library(name: .w3cCSSFilters, targets: [.w3cCSSFilters]),
        .library(name: .w3cCSSMasking, targets: [.w3cCSSMasking]),
        .library(name: .w3cCSSCompositing, targets: [.w3cCSSCompositing]),

        // Animation Modules
        .library(name: .w3cCSSAnimations, targets: [.w3cCSSAnimations]),
        .library(name: .w3cCSSTransitions, targets: [.w3cCSSTransitions]),
        .library(name: .w3cCSSEasing, targets: [.w3cCSSEasing]),

        // Conditional & Media Modules
        .library(name: .w3cCSSConditional, targets: [.w3cCSSConditional]),
        .library(name: .w3cCSSMediaQueries, targets: [.w3cCSSMediaQueries]),

        // User Interface Modules
        .library(name: .w3cCSSUI, targets: [.w3cCSSUI]),
        .library(name: .w3cCSSPseudoElements, targets: [.w3cCSSPseudoElements]),
        .library(name: .w3cCSSPseudoClasses, targets: [.w3cCSSPseudoClasses]),

        // Advanced Feature Modules
        .library(name: .w3cCSSContainment, targets: [.w3cCSSContainment]),
        .library(name: .w3cCSSScroll, targets: [.w3cCSSScroll]),
        .library(name: .w3cCSSLogical, targets: [.w3cCSSLogical]),
        .library(name: .w3cCSSAlignment, targets: [.w3cCSSAlignment]),

        // Specialized Modules
        .library(name: .w3cCSSLists, targets: [.w3cCSSLists]),
        .library(name: .w3cCSSCounterStyles, targets: [.w3cCSSCounterStyles]),
        .library(name: .w3cCSSPaged, targets: [.w3cCSSPaged]),

        // Umbrella Modules
        .library(name: .w3cCSSLayout, targets: [.w3cCSSLayout]),
        .library(name: .w3cCSSTypography, targets: [.w3cCSSTypography]),
        .library(name: .w3cCSSVisual, targets: [.w3cCSSVisual]),
        .library(name: .w3cCSSAnimation, targets: [.w3cCSSAnimation]),
        .library(name: .w3cCSS, targets: [.w3cCSS]),
    ],
    dependencies: [
        .package(url: "https://github.com/swift-standards/swift-cssom.git", from: "0.0.1"),
        .package(url: "https://github.com/swift-primitives/swift-formatting-primitives.git", from: "0.0.1"),
        .package(url: "https://github.com/swift-primitives/swift-geometry-primitives.git", from: "0.0.1"),
        .package(url: "https://github.com/swift-standards/swift-ieee-754.git", from: "0.0.1"),
        .package(url: "https://github.com/swift-standards/swift-iec-61966.git", from: "0.0.1"),
        .package(url: "https://github.com/swift-foundations/swift-ascii.git", from: "0.0.1"),
        .package(url: "https://github.com/swift-standards/swift-rfc-4648.git", from: "0.0.1"),
    ],
    targets: [
        // MARK: - Core Modules

        .target(
            name: .w3cCSSShared,
            dependencies: [
                .product(name: "W3C CSSOM", package: "swift-cssom"),
                .product(name: "ASCII", package: "swift-ascii"),
                .product(name: "Formatting Primitives", package: "swift-formatting-primitives"),
                .product(name: "Geometry Primitives", package: "swift-geometry-primitives")
            ]
        ),
        .testTarget(
            name: .w3cCSSShared.tests,
            dependencies: [.w3cCSSShared]
        ),

        .target(
            name: .w3cCSSValues,
            dependencies: [
                .w3cCSSShared,
                .product(name: "IEEE 754", package: "swift-ieee-754"),
                .product(name: "IEC 61966", package: "swift-iec-61966"),
                .product(name: "RFC 4648", package: "swift-rfc-4648")
            ]
        ),
        .testTarget(
            name: .w3cCSSValues.tests,
            dependencies: [.w3cCSSValues]
        ),

        .target(
            name: .w3cCSSColor,
            dependencies: [.w3cCSSShared, .w3cCSSValues, .w3cCSSSyntax]
        ),
        .testTarget(
            name: .w3cCSSColor.tests,
            dependencies: [.w3cCSSColor]
        ),

        .target(
            name: .w3cCSSSyntax,
            dependencies: [.w3cCSSShared, .w3cCSSValues]
        ),
        .testTarget(
            name: .w3cCSSSyntax.tests,
            dependencies: [.w3cCSSSyntax]
        ),

        .target(
            name: .w3cCSSCascade,
            dependencies: [.w3cCSSShared, .w3cCSSSyntax, .w3cCSSSelectors]
        ),
        .testTarget(
            name: .w3cCSSCascade.tests,
            dependencies: [.w3cCSSCascade]
        ),

        .target(
            name: .w3cCSSSelectors,
            dependencies: [.w3cCSSShared]
        ),
        .testTarget(
            name: .w3cCSSSelectors.tests,
            dependencies: [.w3cCSSSelectors]
        ),

        .target(
            name: .w3cCSSVariables,
            dependencies: [.w3cCSSShared]
        ),
        .testTarget(
            name: .w3cCSSVariables.tests,
            dependencies: [.w3cCSSVariables]
        ),

        // MARK: - Layout Modules

        .target(
            name: .w3cCSSDisplay,
            dependencies: [.w3cCSSShared, .w3cCSSValues]
        ),
        .testTarget(
            name: .w3cCSSDisplay.tests,
            dependencies: [.w3cCSSDisplay]
        ),

        .target(
            name: .w3cCSSFlexbox,
            dependencies: [.w3cCSSShared, .w3cCSSValues, .w3cCSSAlignment]
        ),
        .testTarget(
            name: .w3cCSSFlexbox.tests,
            dependencies: [.w3cCSSFlexbox]
        ),

        .target(
            name: .w3cCSSGrid,
            dependencies: [.w3cCSSShared, .w3cCSSValues]
        ),
        .testTarget(
            name: .w3cCSSGrid.tests,
            dependencies: [.w3cCSSGrid]
        ),

        .target(
            name: .w3cCSSPositioning,
            dependencies: [.w3cCSSShared, .w3cCSSValues, .w3cCSSSyntax]
        ),
        .testTarget(
            name: .w3cCSSPositioning.tests,
            dependencies: [.w3cCSSPositioning]
        ),

        .target(
            name: .w3cCSSMulticolumn,
            dependencies: [.w3cCSSShared, .w3cCSSValues, .w3cCSSColor, .w3cCSSBackgrounds]
        ),
        .testTarget(
            name: .w3cCSSMulticolumn.tests,
            dependencies: [.w3cCSSMulticolumn]
        ),

        .target(
            name: .w3cCSSBoxModel,
            dependencies: [.w3cCSSShared, .w3cCSSValues]
        ),
        .testTarget(
            name: .w3cCSSBoxModel.tests,
            dependencies: [.w3cCSSBoxModel]
        ),

        // MARK: - Typography Modules

        .target(
            name: .w3cCSSText,
            dependencies: [.w3cCSSShared, .w3cCSSValues, .w3cCSSColor]
        ),
        .testTarget(
            name: .w3cCSSText.tests,
            dependencies: [.w3cCSSText]
        ),

        .target(
            name: .w3cCSSFonts,
            dependencies: [.w3cCSSShared, .w3cCSSValues, .w3cCSSSyntax, .w3cCSSText]
        ),
        .testTarget(
            name: .w3cCSSFonts.tests,
            dependencies: [.w3cCSSFonts]
        ),

        .target(
            name: .w3cCSSTextDecoration,
            dependencies: [.w3cCSSShared, .w3cCSSValues, .w3cCSSColor]
        ),
        .testTarget(
            name: .w3cCSSTextDecoration.tests,
            dependencies: [.w3cCSSTextDecoration]
        ),

        .target(
            name: .w3cCSSWritingModes,
            dependencies: [.w3cCSSShared]
        ),
        .testTarget(
            name: .w3cCSSWritingModes.tests,
            dependencies: [.w3cCSSWritingModes]
        ),

        // MARK: - Visual Effects Modules

        .target(
            name: .w3cCSSBackgrounds,
            dependencies: [.w3cCSSShared, .w3cCSSValues, .w3cCSSColor, .w3cCSSImages]
        ),
        .testTarget(
            name: .w3cCSSBackgrounds.tests,
            dependencies: [.w3cCSSBackgrounds]
        ),

        .target(
            name: .w3cCSSImages,
            dependencies: [.w3cCSSShared, .w3cCSSValues, .w3cCSSColor]
        ),
        .testTarget(
            name: .w3cCSSImages.tests,
            dependencies: [.w3cCSSImages]
        ),

        .target(
            name: .w3cCSSTransforms,
            dependencies: [.w3cCSSShared, .w3cCSSValues]
        ),
        .testTarget(
            name: .w3cCSSTransforms.tests,
            dependencies: [.w3cCSSTransforms]
        ),

        .target(
            name: .w3cCSSFilters,
            dependencies: [.w3cCSSShared, .w3cCSSValues, .w3cCSSColor]
        ),
        .testTarget(
            name: .w3cCSSFilters.tests,
            dependencies: [.w3cCSSFilters]
        ),

        .target(
            name: .w3cCSSMasking,
            dependencies: [.w3cCSSShared, .w3cCSSValues, .w3cCSSImages, .w3cCSSPositioning]
        ),
        .testTarget(
            name: .w3cCSSMasking.tests,
            dependencies: [.w3cCSSMasking]
        ),

        .target(
            name: .w3cCSSCompositing,
            dependencies: [.w3cCSSShared]
        ),
        .testTarget(
            name: .w3cCSSCompositing.tests,
            dependencies: [.w3cCSSCompositing]
        ),

        // MARK: - Animation Modules

        .target(
            name: .w3cCSSAnimations,
            dependencies: [.w3cCSSShared, .w3cCSSEasing, .w3cCSSMasking, .w3cCSSPositioning]
        ),
        .testTarget(
            name: .w3cCSSAnimations.tests,
            dependencies: [.w3cCSSAnimations]
        ),

        .target(
            name: .w3cCSSTransitions,
            dependencies: [.w3cCSSShared, .w3cCSSValues, .w3cCSSEasing, .w3cCSSColor, .w3cCSSSyntax]
        ),
        .testTarget(
            name: .w3cCSSTransitions.tests,
            dependencies: [.w3cCSSTransitions]
        ),

        .target(
            name: .w3cCSSEasing,
            dependencies: [.w3cCSSShared, .w3cCSSValues]
        ),
        .testTarget(
            name: .w3cCSSEasing.tests,
            dependencies: [.w3cCSSEasing]
        ),

        // MARK: - Conditional & Media Modules

        .target(
            name: .w3cCSSConditional,
            dependencies: [.w3cCSSShared]
        ),
        .testTarget(
            name: .w3cCSSConditional.tests,
            dependencies: [.w3cCSSConditional]
        ),

        .target(
            name: .w3cCSSMediaQueries,
            dependencies: [.w3cCSSShared, .w3cCSSValues, .w3cCSSSyntax]
        ),
        .testTarget(
            name: .w3cCSSMediaQueries.tests,
            dependencies: [.w3cCSSMediaQueries]
        ),

        // MARK: - User Interface Modules

        .target(
            name: .w3cCSSUI,
            dependencies: [.w3cCSSShared, .w3cCSSValues, .w3cCSSColor, .w3cCSSBackgrounds]
        ),
        .testTarget(
            name: .w3cCSSUI.tests,
            dependencies: [.w3cCSSUI]
        ),

        .target(
            name: .w3cCSSPseudoElements,
            dependencies: [.w3cCSSShared]
        ),
        .testTarget(
            name: .w3cCSSPseudoElements.tests,
            dependencies: [.w3cCSSPseudoElements]
        ),

        .target(
            name: .w3cCSSPseudoClasses,
            dependencies: [.w3cCSSShared]
        ),
        .testTarget(
            name: .w3cCSSPseudoClasses.tests,
            dependencies: [.w3cCSSPseudoClasses]
        ),

        // MARK: - Advanced Feature Modules

        .target(
            name: .w3cCSSContainment,
            dependencies: [.w3cCSSShared, .w3cCSSValues, .w3cCSSLists]
        ),
        .testTarget(
            name: .w3cCSSContainment.tests,
            dependencies: [.w3cCSSContainment]
        ),

        .target(
            name: .w3cCSSScroll,
            dependencies: [.w3cCSSShared, .w3cCSSValues, .w3cCSSColor]
        ),
        .testTarget(
            name: .w3cCSSScroll.tests,
            dependencies: [.w3cCSSScroll]
        ),

        .target(
            name: .w3cCSSLogical,
            dependencies: [.w3cCSSShared, .w3cCSSValues]
        ),
        .testTarget(
            name: .w3cCSSLogical.tests,
            dependencies: [.w3cCSSLogical]
        ),

        .target(
            name: .w3cCSSAlignment,
            dependencies: [.w3cCSSShared, .w3cCSSValues]
        ),
        .testTarget(
            name: .w3cCSSAlignment.tests,
            dependencies: [.w3cCSSAlignment]
        ),

        // MARK: - Specialized Modules

        .target(
            name: .w3cCSSLists,
            dependencies: [.w3cCSSShared, .w3cCSSValues, .w3cCSSCounterStyles, .w3cCSSImages]
        ),
        .testTarget(
            name: .w3cCSSLists.tests,
            dependencies: [.w3cCSSLists]
        ),

        .target(
            name: .w3cCSSCounterStyles,
            dependencies: [.w3cCSSShared, .w3cCSSSyntax]
        ),
        .testTarget(
            name: .w3cCSSCounterStyles.tests,
            dependencies: [.w3cCSSCounterStyles]
        ),

        .target(
            name: .w3cCSSPaged,
            dependencies: [.w3cCSSShared, .w3cCSSValues, .w3cCSSSyntax]
        ),
        .testTarget(
            name: .w3cCSSPaged.tests,
            dependencies: [.w3cCSSPaged]
        ),

        // MARK: - Umbrella Modules

        .target(
            name: .w3cCSSLayout,
            dependencies: [
                .w3cCSSDisplay,
                .w3cCSSFlexbox,
                .w3cCSSGrid,
                .w3cCSSPositioning,
                .w3cCSSMulticolumn,
                .w3cCSSBoxModel,
                .w3cCSSAlignment,
            ]
        ),

        .target(
            name: .w3cCSSTypography,
            dependencies: [
                .w3cCSSText,
                .w3cCSSFonts,
                .w3cCSSTextDecoration,
                .w3cCSSWritingModes,
            ]
        ),

        .target(
            name: .w3cCSSVisual,
            dependencies: [
                .w3cCSSBackgrounds,
                .w3cCSSImages,
                .w3cCSSTransforms,
                .w3cCSSFilters,
                .w3cCSSMasking,
                .w3cCSSCompositing,
                .w3cCSSPositioning,
            ]
        ),

        .target(
            name: .w3cCSSAnimation,
            dependencies: [
                .w3cCSSAnimations,
                .w3cCSSTransitions,
                .w3cCSSEasing,
                .w3cCSSPositioning,
            ]
        ),

        .target(
            name: .w3cCSS,
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
                .w3cCSSPaged,
            ]
        )
    ],
    swiftLanguageModes: [.v6]
)
