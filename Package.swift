// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-w3c-css",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [

        .library(name: "W3C CSS Shared", targets: ["W3C CSS Shared"]),
        .library(name: "W3C CSS Values", targets: ["W3C CSS Values"]),
        .library(name: "W3C CSS Color", targets: ["W3C CSS Color"]),
        .library(name: "W3C CSS Syntax", targets: ["W3C CSS Syntax"]),
        .library(name: "W3C CSS Cascade", targets: ["W3C CSS Cascade"]),
        .library(name: "W3C CSS Selectors", targets: ["W3C CSS Selectors"]),
        .library(name: "W3C CSS Variables", targets: ["W3C CSS Variables"]),

        .library(name: "W3C CSS Display", targets: ["W3C CSS Display"]),
        .library(name: "W3C CSS Flexbox", targets: ["W3C CSS Flexbox"]),
        .library(name: "W3C CSS Grid", targets: ["W3C CSS Grid"]),
        .library(name: "W3C CSS Positioning", targets: ["W3C CSS Positioning"]),
        .library(name: "W3C CSS Multicolumn", targets: ["W3C CSS Multicolumn"]),
        .library(name: "W3C CSS BoxModel", targets: ["W3C CSS BoxModel"]),

        .library(name: "W3C CSS Text", targets: ["W3C CSS Text"]),
        .library(name: "W3C CSS Fonts", targets: ["W3C CSS Fonts"]),
        .library(name: "W3C CSS TextDecoration", targets: ["W3C CSS TextDecoration"]),
        .library(name: "W3C CSS WritingModes", targets: ["W3C CSS WritingModes"]),

        .library(name: "W3C CSS Backgrounds", targets: ["W3C CSS Backgrounds"]),
        .library(name: "W3C CSS Images", targets: ["W3C CSS Images"]),
        .library(name: "W3C CSS Transforms", targets: ["W3C CSS Transforms"]),
        .library(name: "W3C CSS Filters", targets: ["W3C CSS Filters"]),
        .library(name: "W3C CSS Masking", targets: ["W3C CSS Masking"]),
        .library(name: "W3C CSS Compositing", targets: ["W3C CSS Compositing"]),

        .library(name: "W3C CSS Animations", targets: ["W3C CSS Animations"]),
        .library(name: "W3C CSS Transitions", targets: ["W3C CSS Transitions"]),
        .library(name: "W3C CSS Easing", targets: ["W3C CSS Easing"]),

        .library(name: "W3C CSS Conditional", targets: ["W3C CSS Conditional"]),
        .library(name: "W3C CSS MediaQueries", targets: ["W3C CSS MediaQueries"]),

        .library(name: "W3C CSS UI", targets: ["W3C CSS UI"]),
        .library(name: "W3C CSS PseudoElements", targets: ["W3C CSS PseudoElements"]),
        .library(name: "W3C CSS PseudoClasses", targets: ["W3C CSS PseudoClasses"]),

        .library(name: "W3C CSS Containment", targets: ["W3C CSS Containment"]),
        .library(name: "W3C CSS Scroll", targets: ["W3C CSS Scroll"]),
        .library(name: "W3C CSS Logical", targets: ["W3C CSS Logical"]),
        .library(name: "W3C CSS Alignment", targets: ["W3C CSS Alignment"]),

        .library(name: "W3C CSS Lists", targets: ["W3C CSS Lists"]),
        .library(name: "W3C CSS CounterStyles", targets: ["W3C CSS CounterStyles"]),
        .library(name: "W3C CSS Paged", targets: ["W3C CSS Paged"]),

        .library(name: "W3C CSS Layout", targets: ["W3C CSS Layout"]),
        .library(name: "W3C CSS Typography", targets: ["W3C CSS Typography"]),
        .library(name: "W3C CSS Visual", targets: ["W3C CSS Visual"]),
        .library(name: "W3C CSS Animation", targets: ["W3C CSS Animation"]),
        .library(name: "W3C CSS", targets: ["W3C CSS"]),
    ],
    dependencies: [
        .package(url: "https://github.com/swift-w3c/swift-w3c-cssom.git", branch: "main"),
        .package(
            url: "https://github.com/swift-molecules/swift-format.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-geometry.git",
            branch: "main"
        ),
        .package(url: "https://github.com/swift-ieee/swift-ieee-754.git", branch: "main"),
        .package(url: "https://github.com/swift-iec/swift-iec-61966.git", branch: "main"),
        .package(
            url: "https://github.com/swift-molecules/swift-ascii.git",
            branch: "main"
        ),
        .package(url: "https://github.com/swift-ietf/swift-rfc-4648.git", branch: "main"),
    ],
    targets: [

        .target(
            name: "W3C CSS Shared",
            dependencies: [
                .product(name: "W3C CSSOM", package: "swift-w3c-cssom"),
                .product(name: "ASCII", package: "swift-ascii"),
                .product(name: "Format Primitive", package: "swift-format"),
                .product(name: "Geometry", package: "swift-geometry"),
            ]
        ),

        .target(
            name: "W3C CSS Values",
            dependencies: [
                .target(name: "W3C CSS Shared"),
                .product(name: "IEEE 754", package: "swift-ieee-754"),
                .product(name: "IEC 61966", package: "swift-iec-61966"),
                .product(name: "RFC 4648", package: "swift-rfc-4648"),
            ]
        ),

        .target(
            name: "W3C CSS Color",
            dependencies: [.target(name: "W3C CSS Shared"), .target(name: "W3C CSS Values"), .target(name: "W3C CSS Syntax")]
        ),

        .target(
            name: "W3C CSS Syntax",
            dependencies: [.target(name: "W3C CSS Shared"), .target(name: "W3C CSS Values")]
        ),

        .target(
            name: "W3C CSS Cascade",
            dependencies: [.target(name: "W3C CSS Shared"), .target(name: "W3C CSS Syntax"), .target(name: "W3C CSS Selectors")]
        ),

        .target(
            name: "W3C CSS Selectors",
            dependencies: [.target(name: "W3C CSS Shared")]
        ),

        .target(
            name: "W3C CSS Variables",
            dependencies: [.target(name: "W3C CSS Shared")]
        ),

        .target(
            name: "W3C CSS Display",
            dependencies: [.target(name: "W3C CSS Shared"), .target(name: "W3C CSS Values")]
        ),

        .target(
            name: "W3C CSS Flexbox",
            dependencies: [.target(name: "W3C CSS Shared"), .target(name: "W3C CSS Values"), .target(name: "W3C CSS Alignment")]
        ),

        .target(
            name: "W3C CSS Grid",
            dependencies: [.target(name: "W3C CSS Shared"), .target(name: "W3C CSS Values")]
        ),

        .target(
            name: "W3C CSS Positioning",
            dependencies: [.target(name: "W3C CSS Shared"), .target(name: "W3C CSS Values"), .target(name: "W3C CSS Syntax")]
        ),

        .target(
            name: "W3C CSS Multicolumn",
            dependencies: [.target(name: "W3C CSS Shared"), .target(name: "W3C CSS Values"), .target(name: "W3C CSS Color"), .target(name: "W3C CSS Backgrounds")]
        ),

        .target(
            name: "W3C CSS BoxModel",
            dependencies: [.target(name: "W3C CSS Shared"), .target(name: "W3C CSS Values")]
        ),

        .target(
            name: "W3C CSS Text",
            dependencies: [.target(name: "W3C CSS Shared"), .target(name: "W3C CSS Values"), .target(name: "W3C CSS Color")]
        ),

        .target(
            name: "W3C CSS Fonts",
            dependencies: [.target(name: "W3C CSS Shared"), .target(name: "W3C CSS Values"), .target(name: "W3C CSS Syntax"), .target(name: "W3C CSS Text")]
        ),

        .target(
            name: "W3C CSS TextDecoration",
            dependencies: [.target(name: "W3C CSS Shared"), .target(name: "W3C CSS Values"), .target(name: "W3C CSS Color")]
        ),

        .target(
            name: "W3C CSS WritingModes",
            dependencies: [.target(name: "W3C CSS Shared")]
        ),

        .target(
            name: "W3C CSS Backgrounds",
            dependencies: [.target(name: "W3C CSS Shared"), .target(name: "W3C CSS Values"), .target(name: "W3C CSS Color"), .target(name: "W3C CSS Images")]
        ),

        .target(
            name: "W3C CSS Images",
            dependencies: [.target(name: "W3C CSS Shared"), .target(name: "W3C CSS Values"), .target(name: "W3C CSS Color")]
        ),

        .target(
            name: "W3C CSS Transforms",
            dependencies: [.target(name: "W3C CSS Shared"), .target(name: "W3C CSS Values")]
        ),

        .target(
            name: "W3C CSS Filters",
            dependencies: [.target(name: "W3C CSS Shared"), .target(name: "W3C CSS Values"), .target(name: "W3C CSS Color")]
        ),

        .target(
            name: "W3C CSS Masking",
            dependencies: [.target(name: "W3C CSS Shared"), .target(name: "W3C CSS Values"), .target(name: "W3C CSS Images"), .target(name: "W3C CSS Positioning")]
        ),

        .target(
            name: "W3C CSS Compositing",
            dependencies: [.target(name: "W3C CSS Shared")]
        ),

        .target(
            name: "W3C CSS Animations",
            dependencies: [.target(name: "W3C CSS Shared"), .target(name: "W3C CSS Easing"), .target(name: "W3C CSS Masking"), .target(name: "W3C CSS Positioning")]
        ),

        .target(
            name: "W3C CSS Transitions",
            dependencies: [
                "W3C CSS Shared", "W3C CSS Values", "W3C CSS Easing", "W3C CSS Color", "W3C CSS Syntax",
            ]
        ),

        .target(
            name: "W3C CSS Easing",
            dependencies: [.target(name: "W3C CSS Shared"), .target(name: "W3C CSS Values")]
        ),

        .target(
            name: "W3C CSS Conditional",
            dependencies: [.target(name: "W3C CSS Shared")]
        ),

        .target(
            name: "W3C CSS MediaQueries",
            dependencies: [.target(name: "W3C CSS Shared"), .target(name: "W3C CSS Values"), .target(name: "W3C CSS Syntax")]
        ),

        .target(
            name: "W3C CSS UI",
            dependencies: [.target(name: "W3C CSS Shared"), .target(name: "W3C CSS Values"), .target(name: "W3C CSS Color"), .target(name: "W3C CSS Backgrounds")]
        ),

        .target(
            name: "W3C CSS PseudoElements",
            dependencies: [.target(name: "W3C CSS Shared")]
        ),

        .target(
            name: "W3C CSS PseudoClasses",
            dependencies: [.target(name: "W3C CSS Shared")]
        ),

        .target(
            name: "W3C CSS Containment",
            dependencies: [.target(name: "W3C CSS Shared"), .target(name: "W3C CSS Values"), .target(name: "W3C CSS Lists")]
        ),

        .target(
            name: "W3C CSS Scroll",
            dependencies: [.target(name: "W3C CSS Shared"), .target(name: "W3C CSS Values"), .target(name: "W3C CSS Color")]
        ),

        .target(
            name: "W3C CSS Logical",
            dependencies: [.target(name: "W3C CSS Shared"), .target(name: "W3C CSS Values")]
        ),

        .target(
            name: "W3C CSS Alignment",
            dependencies: [.target(name: "W3C CSS Shared"), .target(name: "W3C CSS Values")]
        ),

        .target(
            name: "W3C CSS Lists",
            dependencies: [.target(name: "W3C CSS Shared"), .target(name: "W3C CSS Values"), .target(name: "W3C CSS CounterStyles"), .target(name: "W3C CSS Images")]
        ),

        .target(
            name: "W3C CSS CounterStyles",
            dependencies: [.target(name: "W3C CSS Shared"), .target(name: "W3C CSS Syntax")]
        ),

        .target(
            name: "W3C CSS Paged",
            dependencies: [.target(name: "W3C CSS Shared"), .target(name: "W3C CSS Values"), .target(name: "W3C CSS Syntax")]
        ),

        .target(
            name: "W3C CSS Layout",
            dependencies: [
                .target(name: "W3C CSS Display"),
                .target(name: "W3C CSS Flexbox"),
                .target(name: "W3C CSS Grid"),
                .target(name: "W3C CSS Positioning"),
                .target(name: "W3C CSS Multicolumn"),
                .target(name: "W3C CSS BoxModel"),
                .target(name: "W3C CSS Alignment"),
            ]
        ),

        .target(
            name: "W3C CSS Typography",
            dependencies: [
                .target(name: "W3C CSS Text"),
                .target(name: "W3C CSS Fonts"),
                .target(name: "W3C CSS TextDecoration"),
                .target(name: "W3C CSS WritingModes"),
            ]
        ),

        .target(
            name: "W3C CSS Visual",
            dependencies: [
                .target(name: "W3C CSS Backgrounds"),
                .target(name: "W3C CSS Images"),
                .target(name: "W3C CSS Transforms"),
                .target(name: "W3C CSS Filters"),
                .target(name: "W3C CSS Masking"),
                .target(name: "W3C CSS Compositing"),
                .target(name: "W3C CSS Positioning"),
            ]
        ),

        .target(
            name: "W3C CSS Animation",
            dependencies: [
                .target(name: "W3C CSS Animations"),
                .target(name: "W3C CSS Transitions"),
                .target(name: "W3C CSS Easing"),
                .target(name: "W3C CSS Positioning"),
            ]
        ),

        .target(
            name: "W3C CSS",
            dependencies: [

                .target(name: "W3C CSS Shared"),
                .target(name: "W3C CSS Values"),
                .target(name: "W3C CSS Color"),
                .target(name: "W3C CSS Syntax"),
                .target(name: "W3C CSS Cascade"),
                .target(name: "W3C CSS Selectors"),
                .target(name: "W3C CSS Variables"),

                .target(name: "W3C CSS Layout"),

                .target(name: "W3C CSS Typography"),

                .target(name: "W3C CSS Visual"),

                .target(name: "W3C CSS Animation"),

                .target(name: "W3C CSS Conditional"),
                .target(name: "W3C CSS MediaQueries"),

                .target(name: "W3C CSS UI"),
                .target(name: "W3C CSS PseudoElements"),
                .target(name: "W3C CSS PseudoClasses"),

                .target(name: "W3C CSS Containment"),
                .target(name: "W3C CSS Scroll"),
                .target(name: "W3C CSS Logical"),

                .target(name: "W3C CSS Lists"),
                .target(name: "W3C CSS CounterStyles"),
                .target(name: "W3C CSS Paged"),
            ]
        ),
        .testTarget(
            name: "W3C CSS Alignment Tests",
            dependencies: [
                .target(name: "W3C CSS Alignment"),
                .target(name: "W3C CSS Shared"),
            ]
        ),
        .testTarget(
            name: "W3C CSS Animations Tests",
            dependencies: [
                .target(name: "W3C CSS Animations"),
                .target(name: "W3C CSS Values"),
                .target(name: "W3C CSS Shared"),
            ]
        ),
        .testTarget(
            name: "W3C CSS Backgrounds Tests",
            dependencies: [
                .target(name: "W3C CSS Backgrounds"),
                .target(name: "W3C CSS Values"),
            ]
        ),
        .testTarget(
            name: "W3C CSS BoxModel Tests",
            dependencies: [
                .target(name: "W3C CSS BoxModel"),
                .target(name: "W3C CSS Shared"),
            ]
        ),
        .testTarget(
            name: "W3C CSS Cascade Tests",
            dependencies: [
                .target(name: "W3C CSS Cascade"),
                .target(name: "W3C CSS Shared"),
            ]
        ),
        .testTarget(
            name: "W3C CSS Color Tests",
            dependencies: [
                .target(name: "W3C CSS Color"),
                .target(name: "W3C CSS Values"),
            ]
        ),
        .testTarget(
            name: "W3C CSS Compositing Tests",
            dependencies: [
                .target(name: "W3C CSS Compositing"),
                .target(name: "W3C CSS Shared"),
            ]
        ),
        .testTarget(
            name: "W3C CSS Conditional Tests",
            dependencies: [
                .target(name: "W3C CSS Conditional"),
                .target(name: "W3C CSS Shared"),
            ]
        ),
        .testTarget(
            name: "W3C CSS Containment Tests",
            dependencies: [
                .target(name: "W3C CSS Containment"),
                .target(name: "W3C CSS Shared"),
            ]
        ),
        .testTarget(
            name: "W3C CSS CounterStyles Tests",
            dependencies: [
                .target(name: "W3C CSS CounterStyles"),
                .target(name: "W3C CSS Shared"),
            ]
        ),
        .testTarget(
            name: "W3C CSS Display Tests",
            dependencies: [
                .target(name: "W3C CSS Display"),
                .target(name: "W3C CSS Shared"),
            ]
        ),
        .testTarget(
            name: "W3C CSS Easing Tests",
            dependencies: [
                .target(name: "W3C CSS Easing"),
                .target(name: "W3C CSS Values"),
            ]
        ),
        .testTarget(
            name: "W3C CSS Filters Tests",
            dependencies: [
                .target(name: "W3C CSS Filters"),
                .target(name: "W3C CSS Values"),
            ]
        ),
        .testTarget(
            name: "W3C CSS Flexbox Tests",
            dependencies: [
                .target(name: "W3C CSS Flexbox"),
                .target(name: "W3C CSS Shared"),
            ]
        ),
        .testTarget(
            name: "W3C CSS Fonts Tests",
            dependencies: [
                .target(name: "W3C CSS Fonts"),
                .target(name: "W3C CSS Shared"),
            ]
        ),
        .testTarget(
            name: "W3C CSS Grid Tests",
            dependencies: [
                .target(name: "W3C CSS Grid"),
                .target(name: "W3C CSS Shared"),
            ]
        ),
        .testTarget(
            name: "W3C CSS Images Tests",
            dependencies: [
                .target(name: "W3C CSS Images"),
                .target(name: "W3C CSS Color"),
                .target(name: "W3C CSS Values"),
                .target(name: "W3C CSS Shared"),
            ]
        ),
        .testTarget(
            name: "W3C CSS Lists Tests",
            dependencies: [
                .target(name: "W3C CSS Lists"),
                .target(name: "W3C CSS Shared"),
            ]
        ),
        .testTarget(
            name: "W3C CSS Logical Tests",
            dependencies: [
                .target(name: "W3C CSS Logical"),
                .target(name: "W3C CSS Shared"),
            ]
        ),
        .testTarget(
            name: "W3C CSS Masking Tests",
            dependencies: [
                .target(name: "W3C CSS Masking"),
                .target(name: "W3C CSS Values"),
            ]
        ),
        .testTarget(
            name: "W3C CSS MediaQueries Tests",
            dependencies: [
                .target(name: "W3C CSS MediaQueries"),
                .target(name: "W3C CSS Values"),
            ]
        ),
        .testTarget(
            name: "W3C CSS Multicolumn Tests",
            dependencies: [
                .target(name: "W3C CSS Multicolumn"),
                .target(name: "W3C CSS Shared"),
            ]
        ),
        .testTarget(
            name: "W3C CSS Paged Tests",
            dependencies: [
                .target(name: "W3C CSS Paged"),
                .target(name: "W3C CSS Shared"),
            ]
        ),
        .testTarget(
            name: "W3C CSS Positioning Tests",
            dependencies: [
                .target(name: "W3C CSS Positioning"),
                .target(name: "W3C CSS Shared"),
            ]
        ),
        .testTarget(
            name: "W3C CSS PseudoClasses Tests",
            dependencies: [
                .target(name: "W3C CSS PseudoClasses"),
                .target(name: "W3C CSS Shared"),
            ]
        ),
        .testTarget(
            name: "W3C CSS PseudoElements Tests",
            dependencies: [
                .target(name: "W3C CSS PseudoElements"),
                .target(name: "W3C CSS Shared"),
            ]
        ),
        .testTarget(
            name: "W3C CSS Scroll Tests",
            dependencies: [
                .target(name: "W3C CSS Scroll"),
                .target(name: "W3C CSS Shared"),
            ]
        ),
        .testTarget(
            name: "W3C CSS Selectors Tests",
            dependencies: [
                .target(name: "W3C CSS Selectors"),
                .target(name: "W3C CSS Shared"),
            ]
        ),
        .testTarget(
            name: "W3C CSS Shared Tests",
            dependencies: [
                .target(name: "W3C CSS Shared")
            ]
        ),
        .testTarget(
            name: "W3C CSS Syntax Tests",
            dependencies: [
                .target(name: "W3C CSS Syntax"),
                .target(name: "W3C CSS Shared"),
            ]
        ),
        .testTarget(
            name: "W3C CSS Text Tests",
            dependencies: [
                .target(name: "W3C CSS Text"),
                .target(name: "W3C CSS Shared"),
            ]
        ),
        .testTarget(
            name: "W3C CSS TextDecoration Tests",
            dependencies: [
                .target(name: "W3C CSS TextDecoration"),
                .target(name: "W3C CSS Shared"),
            ]
        ),
        .testTarget(
            name: "W3C CSS Transforms Tests",
            dependencies: [
                .target(name: "W3C CSS Transforms"),
                .target(name: "W3C CSS Values"),
            ]
        ),
        .testTarget(
            name: "W3C CSS Transitions Tests",
            dependencies: [
                .target(name: "W3C CSS Transitions"),
                .target(name: "W3C CSS Shared"),
            ]
        ),
        .testTarget(
            name: "W3C CSS UI Tests",
            dependencies: [
                .target(name: "W3C CSS UI"),
                .target(name: "W3C CSS Shared"),
            ]
        ),
        .testTarget(
            name: "W3C CSS Values Tests",
            dependencies: [
                .target(name: "W3C CSS Values"),
                .target(name: "W3C CSS Shared"),
            ]
        ),
        .testTarget(
            name: "W3C CSS Variables Tests",
            dependencies: [
                .target(name: "W3C CSS Variables"),
                .target(name: "W3C CSS Shared"),
            ]
        ),
        .testTarget(
            name: "W3C CSS WritingModes Tests",
            dependencies: [
                .target(name: "W3C CSS WritingModes"),
                .target(name: "W3C CSS Shared"),
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
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
