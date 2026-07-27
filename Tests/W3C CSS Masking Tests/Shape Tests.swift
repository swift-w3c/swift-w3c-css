// Shape Tests.swift
// swift-w3c-css
//
// Tests for CSS Shape type

import Testing
import W3C_CSS_Values

@testable import W3C_CSS_Masking

// MARK: - Basic Functionality

@Suite
struct `Shape - Rect Initialization` {
    @Test func `rect initializes with 10px 100px 100px 10px`() {
        let shape = Shape.rect(top: .px(10), right: .px(100), bottom: .px(100), left: .px(10))
        #expect(shape.description == "rect(10px, 100px, 100px, 10px)")
    }

    @Test func `rect initializes with zero values`() {
        let shape = Shape.rect(top: .px(0), right: .px(0), bottom: .px(0), left: .px(0))
        #expect(shape.description == "rect(0px, 0px, 0px, 0px)")
    }

    @Test func `rect initializes with 20px all sides`() {
        let shape = Shape.rect(top: .px(20), right: .px(20), bottom: .px(20), left: .px(20))
        #expect(shape.description == "rect(20px, 20px, 20px, 20px)")
    }

    @Test func `rect factory method with Double values works correctly`() {
        let shape = Shape.rect(
            top: Double(10),
            right: Double(100),
            bottom: Double(100),
            left: Double(10)
        )
        #expect(shape.description == "rect(10px, 100px, 100px, 10px)")
    }

    @Test func `rect with uniform values works correctly`() {
        let shape = Shape.rect(all: 20)
        #expect(shape.description == "rect(20px, 20px, 20px, 20px)")
    }
}

@Suite
struct `Shape - Static Properties` {
    @Test func `auto property returns auto rect`() {
        let shape = Shape.auto
        #expect(shape.description == "rect(auto, auto, auto, auto)")
    }
}

// MARK: - Protocol Conformance

@Suite
struct `Shape - Hashable Conformance` {
    @Test func `equal shapes are equal`() {
        let shape1 = Shape.rect(top: .px(10), right: .px(100), bottom: .px(100), left: .px(10))
        let shape2 = Shape.rect(top: .px(10), right: .px(100), bottom: .px(100), left: .px(10))
        #expect(shape1 == shape2)
    }

    @Test func `different shapes are not equal`() {
        let shape1 = Shape.rect(top: .px(10), right: .px(100), bottom: .px(100), left: .px(10))
        let shape2 = Shape.rect(top: .px(20), right: .px(100), bottom: .px(100), left: .px(10))
        #expect(shape1 != shape2)
    }
}

// MARK: - Deprecation

@Suite
struct `Shape - Deprecation` {
    @Test func `shape is marked as deprecated`() {
        // This test documents that Shape is correctly marked as deprecated.
        // The compiler will generate warnings when Shape is used outside of
        // the @_spi(SuppressDeprecationWarnings) context.
        let shape = Shape.rect(all: 10)
        #expect(shape.description.contains("rect"))
    }
}

// MARK: - Edge Cases

@Suite
struct `Shape - Edge Cases` {
    @Test func `rect with zero values`() {
        let shape = Shape.rect(all: 0)
        #expect(shape.description == "rect(0px, 0px, 0px, 0px)")
    }

    @Test func `rect with large values`() {
        let shape = Shape.rect(
            top: .px(10000),
            right: .px(10000),
            bottom: .px(10000),
            left: .px(10000)
        )
        #expect(shape.description == "rect(10000px, 10000px, 10000px, 10000px)")
    }

    // Note: The CSS clip property's rect() function does NOT support percentages
    // per W3C CSS 2.1 spec - only <length> and 'auto' are valid
    // See: https://www.w3.org/TR/CSS2/visufx.html#clipping
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `Shape - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `shape creation 100K times`() {
            for i in 0..<100_000 {
                _ = Shape.rect(all: Double(i % 100))
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `shape description generation 100K times`() {
            let shape = Shape.rect(top: .px(10), right: .px(100), bottom: .px(100), left: .px(10))
            for _ in 0..<100_000 {
                _ = shape.description
            }
        }
    }
}
