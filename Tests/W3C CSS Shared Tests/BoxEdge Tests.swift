// BoxEdge Tests.swift
// swift-w3c-css
//
// Tests for CSS BoxEdge type

import Testing

@testable import W3C_CSS_Shared

// MARK: - Main BoxEdge Values

@Suite
struct `BoxEdge - Main Values` {
    @Test(arguments: [
        (BoxEdge.contentBox, "content-box"),
        (BoxEdge.paddingBox, "padding-box"),
        (BoxEdge.borderBox, "border-box"),
        (BoxEdge.marginBox, "margin-box"),
        (BoxEdge.fillBox, "fill-box"),
        (BoxEdge.strokeBox, "stroke-box"),
        (BoxEdge.viewBox, "view-box"),
    ])
    func `main box edge values render correctly`(
        boxEdge: BoxEdge,
        expected: String
    ) {
        #expect(boxEdge.description == expected)
    }
}

@Suite
struct `BoxEdge - Raw Values` {
    @Test(arguments: [
        (BoxEdge.contentBox, "content-box"),
        (BoxEdge.borderBox, "border-box"),
        (BoxEdge.viewBox, "view-box"),
    ])
    func `main raw values are correct`(
        boxEdge: BoxEdge,
        expected: String
    ) {
        #expect(boxEdge.rawValue == expected)
    }
}

@Suite
struct `BoxEdge - RawValue Initialization` {
    @Test func `initializes from valid raw value`() {
        let contentBox = BoxEdge(rawValue: "content-box")
        #expect(contentBox == BoxEdge.contentBox)

        let borderBox = BoxEdge(rawValue: "border-box")
        #expect(borderBox == BoxEdge.borderBox)
    }

    @Test func `returns nil for invalid raw value`() {
        let invalid = BoxEdge(rawValue: "invalid-box")
        #expect(invalid == nil)
    }
}

// MARK: - Visual Subtype

@Suite
struct `BoxEdge.Visual - Values` {
    @Test(arguments: [
        (BoxEdge.Visual.contentBox, "content-box"),
        (BoxEdge.Visual.paddingBox, "padding-box"),
        (BoxEdge.Visual.borderBox, "border-box"),
    ])
    func `visual box edge values render correctly`(
        boxEdge: BoxEdge.Visual,
        expected: String
    ) {
        #expect(boxEdge.description == expected)
    }
}

// MARK: - Layout Subtype

@Suite
struct `BoxEdge.Layout - Values` {
    @Test(arguments: [
        (BoxEdge.Layout.contentBox, "content-box"),
        (BoxEdge.Layout.paddingBox, "padding-box"),
        (BoxEdge.Layout.borderBox, "border-box"),
        (BoxEdge.Layout.marginBox, "margin-box"),
    ])
    func `layout box edge values render correctly`(
        boxEdge: BoxEdge.Layout,
        expected: String
    ) {
        #expect(boxEdge.description == expected)
    }
}

// MARK: - Paint Subtype

@Suite
struct `BoxEdge.Paint - Values` {
    @Test(arguments: [
        (BoxEdge.Paint.contentBox, "content-box"),
        (BoxEdge.Paint.paddingBox, "padding-box"),
        (BoxEdge.Paint.borderBox, "border-box"),
        (BoxEdge.Paint.fillBox, "fill-box"),
        (BoxEdge.Paint.strokeBox, "stroke-box"),
    ])
    func `paint box edge values render correctly`(
        boxEdge: BoxEdge.Paint,
        expected: String
    ) {
        #expect(boxEdge.description == expected)
    }
}

// MARK: - Coordinate Subtype

@Suite
struct `BoxEdge.Coordinate - Values` {
    @Test(arguments: [
        (BoxEdge.Coordinate.contentBox, "content-box"),
        (BoxEdge.Coordinate.paddingBox, "padding-box"),
        (BoxEdge.Coordinate.borderBox, "border-box"),
        (BoxEdge.Coordinate.fillBox, "fill-box"),
        (BoxEdge.Coordinate.strokeBox, "stroke-box"),
        (BoxEdge.Coordinate.viewBox, "view-box"),
    ])
    func `coordinate box edge values render correctly`(
        boxEdge: BoxEdge.Coordinate,
        expected: String
    ) {
        #expect(boxEdge.description == expected)
    }
}

// MARK: - Geometry Subtype

@Suite
struct `BoxEdge.Geometry - Values` {
    @Test(arguments: [
        (BoxEdge.Geometry.contentBox, "content-box"),
        (BoxEdge.Geometry.paddingBox, "padding-box"),
        (BoxEdge.Geometry.borderBox, "border-box"),
        (BoxEdge.Geometry.marginBox, "margin-box"),
        (BoxEdge.Geometry.fillBox, "fill-box"),
        (BoxEdge.Geometry.strokeBox, "stroke-box"),
        (BoxEdge.Geometry.viewBox, "view-box"),
    ])
    func `geometry box edge values render correctly`(
        boxEdge: BoxEdge.Geometry,
        expected: String
    ) {
        #expect(boxEdge.description == expected)
    }
}

// MARK: - Protocol Conformance

@Suite
struct `BoxEdge - Hashable Conformance` {
    @Test func `equal box edges are equal`() {
        let contentBox1 = BoxEdge.contentBox
        let contentBox2 = BoxEdge.contentBox
        #expect(contentBox1 == contentBox2)
    }

    @Test func `different box edges are not equal`() {
        let contentBox = BoxEdge.contentBox
        let borderBox = BoxEdge.borderBox
        #expect(contentBox != borderBox)
    }
}

@Suite
struct `BoxEdge - Subtype Hashable Conformance` {
    @Test func `equal visual box edges are equal`() {
        let visualContentBox1 = BoxEdge.Visual.contentBox
        let visualContentBox2 = BoxEdge.Visual.contentBox
        #expect(visualContentBox1 == visualContentBox2)
    }

    @Test func `different visual box edges are not equal`() {
        let visualContentBox = BoxEdge.Visual.contentBox
        let visualBorderBox = BoxEdge.Visual.borderBox
        #expect(visualContentBox != visualBorderBox)
    }
}

// MARK: - RawValue Initialization Subtypes

@Suite
struct `BoxEdge - Subtype RawValue Initialization` {
    @Test func `visual subtype initializes from raw value`() {
        let visualContentBox = BoxEdge.Visual(rawValue: "content-box")
        #expect(visualContentBox == BoxEdge.Visual.contentBox)
    }

    @Test func `layout subtype initializes from raw value`() {
        let layoutMarginBox = BoxEdge.Layout(rawValue: "margin-box")
        #expect(layoutMarginBox == BoxEdge.Layout.marginBox)
    }

    @Test func `paint subtype returns nil for invalid value`() {
        let invalidGeometry = BoxEdge.Paint(rawValue: "view-box")
        #expect(invalidGeometry == nil)
    }
}

// MARK: - Edge Cases

@Suite
struct `BoxEdge - Edge Cases` {
    @Test func `all main box edge types are distinct`() {
        let allBoxEdges: [BoxEdge] = [
            .contentBox, .paddingBox, .borderBox,
            .marginBox, .fillBox, .strokeBox, .viewBox,
        ]
        let uniqueDescriptions = Set(allBoxEdges.map { $0.description })
        #expect(uniqueDescriptions.count == allBoxEdges.count)
    }

    @Test func `svg-specific box edges exist`() {
        #expect(BoxEdge.fillBox.description == "fill-box")
        #expect(BoxEdge.strokeBox.description == "stroke-box")
        #expect(BoxEdge.viewBox.description == "view-box")
    }

    @Test func `common box edges exist in all subtypes`() {
        #expect(BoxEdge.contentBox.description == "content-box")
        #expect(BoxEdge.Visual.contentBox.description == "content-box")
        #expect(BoxEdge.Layout.contentBox.description == "content-box")
        #expect(BoxEdge.Paint.contentBox.description == "content-box")
        #expect(BoxEdge.Coordinate.contentBox.description == "content-box")
        #expect(BoxEdge.Geometry.contentBox.description == "content-box")
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `BoxEdge - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `box edge access 100K times`() {
            for _ in 0..<100_000 {
                _ = BoxEdge.contentBox
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `box edge raw value initialization 100K times`() {
            for _ in 0..<100_000 {
                _ = BoxEdge(rawValue: "border-box")
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `box edge comparison 100K times`() {
            let boxEdge1 = BoxEdge.contentBox
            for _ in 0..<100_000 {
                _ = BoxEdge.borderBox == boxEdge1
            }
        }
    }
}
