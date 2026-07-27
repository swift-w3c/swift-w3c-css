# swift-w3c-css

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

Modeling of CSS values, selectors, and rules per the W3C CSS specifications.

## Standard Reference

- **W3C**: CSS
- **Title**: Cascading Style Sheets (CSS)

## Installation

Add the package to your `Package.swift` dependencies:

```swift
dependencies: [
    .package(url: "https://github.com/swift-w3c/swift-w3c-css.git", from: "0.3.0")
]
```

Add the product to a target that needs it:

```swift
.target(
    name: "YourTarget",
    dependencies: [
        .product(name: "W3C CSS", package: "swift-w3c-css")
    ]
)
```

## License

Apache 2.0. See [LICENSE.md](LICENSE.md).
