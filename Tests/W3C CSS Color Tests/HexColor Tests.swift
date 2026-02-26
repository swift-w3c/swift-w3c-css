// HexColor Tests.swift
// swift-w3c-css
//
// Tests for CSS HexColor type

import Foundation
import Testing
import W3C_CSS_Values

@testable import W3C_CSS_Color

// MARK: - Basic Hex Colors

@Suite
struct `HexColor - Basic Values` {
    @Test(arguments: [
        ("#ff0000", "#ff0000"),
        ("#00ff00", "#00ff00"),
        ("#0000ff", "#0000ff"),
        ("#000000", "#000000"),
        ("#ffffff", "#ffffff"),
    ])
    func `basic hex color values render correctly`(
        input: String,
        expected: String
    ) {
        #expect(HexColor(input).description == expected)
    }
}

@Suite
struct `HexColor - Short Format` {
    @Test(arguments: [
        ("#f00", "#f00"),
        ("#0f0", "#0f0"),
        ("#00f", "#00f"),
        ("#000", "#000"),
        ("#fff", "#fff"),
    ])
    func `short hex color values render correctly`(
        input: String,
        expected: String
    ) {
        #expect(HexColor(input).description == expected)
    }
}

// MARK: - Hex Colors with Alpha

@Suite
struct `HexColor - With Alpha` {
    @Test(arguments: [
        ("#ff0000ff", "#ff0000ff"),
        ("#00ff0080", "#00ff0080"),
        ("#0000ff00", "#0000ff00"),
    ])
    func `hex color values with alpha render correctly`(
        input: String,
        expected: String
    ) {
        #expect(HexColor(input).description == expected)
    }

    @Test(arguments: [
        ("#f00f", "#f00f"),
        ("#0f08", "#0f08"),
        ("#00f0", "#00f0"),
    ])
    func `short hex color values with alpha render correctly`(
        input: String,
        expected: String
    ) {
        #expect(HexColor(input).description == expected)
    }
}

// MARK: - Prefix Handling

@Suite
struct `HexColor - Prefix Handling` {
    @Test(arguments: [
        ("ff0000", "#ff0000"),
        ("f00", "#f00"),
    ])
    func `missing # prefix is automatically added`(
        input: String,
        expected: String
    ) {
        #expect(HexColor(input).description == expected)
    }
}

// MARK: - RGB Constructor

@Suite
struct `HexColor - RGB Constructor` {
    @Test(arguments: [
        (255, 0, 0, "#FF0000"),
        (0, 255, 0, "#00FF00"),
        (0, 0, 255, "#0000FF"),
        (128, 128, 128, "#808080"),
    ])
    func `RGB constructor creates correct hex color`(
        red: Int,
        green: Int,
        blue: Int,
        expected: String
    ) {
        let color = HexColor.rgb(red, green, blue)
        #expect(color.description == expected)
    }

    @Test func `RGB constructor clamps overflow values`() {
        let overflowRed = HexColor.rgb(300, 0, 0)
        #expect(overflowRed.description == "#FF0000")
    }

    @Test func `RGB constructor clamps negative values`() {
        let negativeGreen = HexColor.rgb(0, -50, 0)
        #expect(negativeGreen.description == "#000000")
    }
}

// MARK: - RGBA Constructor

@Suite
struct `HexColor - RGBA Constructor` {
    @Test(arguments: [
        (255, 0, 0, 1.0, "#FF0000FF"),
        (0, 255, 0, 0.5, "#00FF0080"),
        (0, 0, 255, 0.0, "#0000FF00"),
    ])
    func `RGBA constructor creates correct hex color with alpha`(
        red: Int,
        green: Int,
        blue: Int,
        alpha: Double,
        expected: String
    ) {
        let color = HexColor.rgba(red, green, blue, alpha)
        #expect(color.description == expected)
    }

    @Test func `RGBA constructor clamps alpha overflow values`() {
        let overflowAlpha = HexColor.rgba(255, 0, 0, 1.5)
        #expect(overflowAlpha.description == "#FF0000FF")
    }

    @Test func `RGBA constructor clamps negative alpha values`() {
        let negativeAlpha = HexColor.rgba(0, 255, 0, -0.5)
        #expect(negativeAlpha.description == "#00FF0000")
    }
}

// MARK: - Validation

@Suite
struct `HexColor - Validation` {
    @Test(arguments: [
        ("#f00", true),
        ("#f00f", true),
        ("#ff0000", true),
        ("#ff0000ff", true),
    ])
    func `valid hex color formats are recognized`(
        input: String,
        expected: Bool
    ) {
        #expect(HexColor(input).isValid == expected)
    }

    @Test(arguments: [
        ("#f0", false),
        ("#f0000", false),
        ("#f00000000", false),
        ("no-prefix", false),
    ])
    func `invalid hex color formats are rejected`(
        input: String,
        expected: Bool
    ) {
        #expect(HexColor(input).isValid == expected)
    }
}

// MARK: - Protocol Conformance

@Suite
struct `HexColor - Hashable Conformance` {
    @Test func `equal hex colors are equal`() {
        let red1 = HexColor("#ff0000")
        let red2 = HexColor("#ff0000")
        #expect(red1 == red2)
    }

    @Test func `different hex colors are not equal`() {
        let red = HexColor("#ff0000")
        let blue = HexColor("#0000ff")
        #expect(red != blue)
    }

    @Test func `case-sensitive comparison`() {
        let redLowercase = HexColor("#ff0000")
        let redUppercase = HexColor("#FF0000")
        #expect(redLowercase != redUppercase)
    }
}

// MARK: - Edge Cases

@Suite
struct `HexColor - Edge Cases` {
    @Test func `all zeros hex color`() {
        #expect(HexColor("#000000").description == "#000000")
    }

    @Test func `all maximum hex color`() {
        #expect(HexColor("#ffffff").description == "#ffffff")
    }

    @Test func `fully transparent with alpha`() {
        #expect(HexColor("#00000000").description == "#00000000")
    }

    @Test func `fully opaque with alpha`() {
        #expect(HexColor("#ffffffff").description == "#ffffffff")
    }

    @Test func `short format all zeros`() {
        #expect(HexColor("#000").description == "#000")
    }

    @Test func `short format all maximum`() {
        #expect(HexColor("#fff").description == "#fff")
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `HexColor - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `hex color creation from string 100K times`() {
            for i in 0..<100_000 {
                let hex = String(format: "#%06x", i % 0xFFFFFF)
                _ = HexColor(hex)
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `hex color creation from RGB 100K times`() {
            for i in 0..<100_000 {
                let value = i % 256
                _ = HexColor.rgb(value, value, value)
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `hex color creation from RGBA 100K times`() {
            for i in 0..<100_000 {
                let value = i % 256
                _ = HexColor.rgba(value, 0, 0, 0.5)
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `hex color validation 100K times`() {
            let validColor = HexColor("#ff0000")
            for _ in 0..<100_000 {
                _ = validColor.isValid
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `hex color comparison 100K times`() {
            let color1 = HexColor("#ff0000")
            let color2 = HexColor("#0000ff")
            for _ in 0..<100_000 {
                _ = color1 == color2
            }
        }
    }
}
