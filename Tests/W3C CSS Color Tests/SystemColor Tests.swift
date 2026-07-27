// SystemColor Tests.swift
// swift-w3c-css
//
// Tests for CSS SystemColor type

import Testing

@testable import W3C_CSS_Color

// MARK: - Basic System Colors

@Suite
struct `SystemColor - Basic Colors` {
    @Test(arguments: [
        (SystemColor.canvas, "Canvas"),
        (.canvasText, "CanvasText"),
        (.buttonBorder, "ButtonBorder"),
        (.buttonFace, "ButtonFace"),
        (.buttonText, "ButtonText"),
    ])
    func `basic system colors render correctly`(
        color: SystemColor,
        expected: String
    ) {
        #expect(color.description == expected)
    }
}

// MARK: - Highlight and Selection Colors

@Suite
struct `SystemColor - Highlight Colors` {
    @Test(arguments: [
        (SystemColor.highlight, "Highlight"),
        (.highlightText, "HighlightText"),
        (.selectedItem, "SelectedItem"),
        (.selectedItemText, "SelectedItemText"),
    ])
    func `highlight and selection system colors render correctly`(
        color: SystemColor,
        expected: String
    ) {
        #expect(color.description == expected)
    }
}

// MARK: - Link and Text Colors

@Suite
struct `SystemColor - Link Colors` {
    @Test(arguments: [
        (SystemColor.linkText, "LinkText"),
        (.activeText, "ActiveText"),
        (.visitedText, "VisitedText"),
    ])
    func `link and text system colors render correctly`(
        color: SystemColor,
        expected: String
    ) {
        #expect(color.description == expected)
    }
}

// MARK: - Input Field Colors

@Suite
struct `SystemColor - Field Colors` {
    @Test(arguments: [
        (SystemColor.field, "Field"),
        (.fieldText, "FieldText"),
    ])
    func `input field system colors render correctly`(
        color: SystemColor,
        expected: String
    ) {
        #expect(color.description == expected)
    }
}

// MARK: - Accent Colors

@Suite
struct `SystemColor - Accent Colors` {
    @Test(arguments: [
        (SystemColor.accentColor, "AccentColor"),
        (.accentColorText, "AccentColorText"),
    ])
    func `accent system colors render correctly`(
        color: SystemColor,
        expected: String
    ) {
        #expect(color.description == expected)
    }
}

// MARK: - Mark Colors

@Suite
struct `SystemColor - Mark Colors` {
    @Test(arguments: [
        (SystemColor.mark, "Mark"),
        (.markText, "MarkText"),
    ])
    func `mark system colors render correctly`(
        color: SystemColor,
        expected: String
    ) {
        #expect(color.description == expected)
    }
}

// MARK: - Deprecated System Colors

@Suite
struct `SystemColor - Deprecated Colors` {
    @Test(arguments: [
        (SystemColor.activeBorder, "ActiveBorder"),
        (.activeCaption, "ActiveCaption"),
        (.appWorkspace, "AppWorkspace"),
        (.background, "Background"),
        (.buttonHighlight, "ButtonHighlight"),
        (.buttonShadow, "ButtonShadow"),
        (.captionText, "CaptionText"),
    ])
    func `deprecated system colors render correctly`(
        color: SystemColor,
        expected: String
    ) {
        #expect(color.description == expected)
    }
}

// MARK: - Raw Value Initialization

@Suite
struct `SystemColor - Raw Value Initialization` {
    @Test(arguments: [
        ("Canvas", "Canvas"),
        ("CanvasText", "CanvasText"),
        ("CustomColor", "CustomColor"),
    ])
    func `raw value initializer works correctly`(
        rawValue: String,
        expected: String
    ) {
        let color = SystemColor(rawValue: rawValue)
        #expect(color.rawValue == expected)
        #expect(color.description == expected)
    }

    @Test func `custom system color can be created`() {
        let customColor = SystemColor(rawValue: "CustomSystemColor")
        #expect(customColor.rawValue == "CustomSystemColor")
        #expect(customColor.description == "CustomSystemColor")
    }
}

// MARK: - Protocol Conformance

@Suite
struct `SystemColor - Hashable Conformance` {
    @Test func `equal system colors are equal`() {
        let canvas1 = SystemColor.canvas
        let canvas2 = SystemColor.canvas
        #expect(canvas1 == canvas2)
    }

    @Test func `different system colors are not equal`() {
        let canvas = SystemColor.canvas
        let field = SystemColor.field
        #expect(canvas != field)
    }

    @Test(arguments: [
        (SystemColor.canvas, SystemColor.canvasText),
        (.mark, .markText),
        (.field, .fieldText),
        (.accentColor, .accentColorText),
    ])
    func `different color pairs are not equal`(
        color1: SystemColor,
        color2: SystemColor
    ) {
        #expect(color1 != color2)
    }
}

// MARK: - Edge Cases

@Suite
struct `SystemColor - Edge Cases` {
    @Test func `empty raw value`() {
        let color = SystemColor(rawValue: "")
        #expect(color.rawValue.isEmpty)
        #expect(color.description.isEmpty)
    }

    @Test func `raw value with spaces`() {
        let color = SystemColor(rawValue: "My Custom Color")
        #expect(color.rawValue == "My Custom Color")
        #expect(color.description == "My Custom Color")
    }

    @Test func `raw value with special characters`() {
        let color = SystemColor(rawValue: "Color-2.0")
        #expect(color.rawValue == "Color-2.0")
        #expect(color.description == "Color-2.0")
    }

    @Test func `case sensitivity is preserved`() {
        let color1 = SystemColor(rawValue: "canvas")
        let color2 = SystemColor(rawValue: "Canvas")
        #expect(color1.rawValue != color2.rawValue)
        #expect(color1 != color2)
    }

    @Test func `description matches raw value`() {
        let predefinedColors = [
            SystemColor.canvas, .canvasText, .field, .fieldText,
            .accentColor, .accentColorText, .mark, .markText,
        ]

        for color in predefinedColors {
            #expect(color.description == color.rawValue)
        }
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `SystemColor - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `system color creation from raw value 100K times`() {
            let colors = ["Canvas", "CanvasText", "Field", "FieldText"]

            for i in 0..<100_000 {
                let rawValue = colors[i % colors.count]
                _ = SystemColor(rawValue: rawValue)
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `system color description access 100K times`() {
            let colors = [
                SystemColor.canvas, .canvasText, .field, .fieldText,
                .accentColor, .accentColorText, .mark, .markText,
            ]

            for i in 0..<100_000 {
                let color = colors[i % colors.count]
                _ = color.description
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `system color comparison 100K times`() {
            let color1 = SystemColor.canvas
            let color2 = SystemColor.field

            for _ in 0..<100_000 {
                _ = color1 == color2
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `system color raw value access 100K times`() {
            let colors = [
                SystemColor.canvas, .canvasText, .field, .fieldText,
                .accentColor, .accentColorText, .mark, .markText,
            ]

            for i in 0..<100_000 {
                let color = colors[i % colors.count]
                _ = color.rawValue
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `custom system color creation 100K times`() {
            for i in 0..<100_000 {
                _ = SystemColor(rawValue: "CustomColor\(i % 10)")
            }
        }
    }
}
