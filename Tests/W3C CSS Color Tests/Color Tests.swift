// Color Tests.swift
// swift-w3c-css
//
// Tests for CSS Color type

import Testing
import W3C_CSS_Values

@testable import W3C_CSS_Color

// MARK: - Named Colors

@Suite
struct `Color - Named Colors` {
    @Test(arguments: [
        (NamedColor.red, "red"),
        (.blue, "blue"),
        (.transparent, "transparent"),
        (.currentColor, "currentColor"),
        (.black, "black"),
        (.white, "white"),
    ])
    func `named color renders correctly`(
        named: NamedColor,
        expected: String
    ) {
        #expect(W3C_CSS_Values.Color.named(named).description == expected)
    }

    @Test func `currentColor static property renders correctly`() {
        #expect(W3C_CSS_Values.Color.named(.currentColor).description == "currentColor")
    }

    @Test func `transparent static property renders correctly`() {
        #expect(W3C_CSS_Values.Color.named(.transparent).description == "transparent")
    }
}

// MARK: - Hex Colors

@Suite
struct `Color - Hex Format` {
    @Test func `6-digit hex color renders correctly`() {
        #expect(W3C_CSS_Values.Color.hex(HexColor("#ff0000")).description == "#ff0000")
    }

    @Test func `3-digit hex color renders correctly`() {
        #expect(W3C_CSS_Values.Color.hex(HexColor("#00f")).description == "#00f")
    }

    @Test func `hex factory method creates correct color`() {
        #expect(W3C_CSS_Values.Color.hex("#ff0000").description == "#ff0000")
    }
}

// MARK: - RGB Colors

@Suite
struct `Color - RGB Format` {
    @Test(arguments: [
        (255, 0, 0, "rgb(255, 0, 0)"),
        (0, 128, 255, "rgb(0, 128, 255)"),
        (0, 0, 0, "rgb(0, 0, 0)"),
        (255, 255, 255, "rgb(255, 255, 255)"),
    ])
    func `rgb color renders correctly`(
        red: Int,
        green: Int,
        blue: Int,
        expected: String
    ) {
        #expect(W3C_CSS_Values.Color.rgb(red, green, blue).description == expected)
    }

    @Test func `rgb with named parameters renders correctly`() {
        #expect(
            W3C_CSS_Values.Color.rgb(red: 255, green: 0, blue: 0).description == "rgb(255, 0, 0)"
        )
    }
}

@Suite
struct `Color - RGBA Format` {
    @Test(arguments: [
        (255, 0, 0, 1.0, "rgba(255, 0, 0, 1)"),
        (0, 128, 255, 0.5, "rgba(0, 128, 255, 0.5)"),
        (0, 255, 0, 0.5, "rgba(0, 255, 0, 0.5)"),
    ])
    func `rgba color renders correctly`(
        red: Int,
        green: Int,
        blue: Int,
        alpha: Double,
        expected: String
    ) {
        #expect(W3C_CSS_Values.Color.rgba(red, green, blue, alpha).description == expected)
    }

    @Test func `rgba with named parameters renders correctly`() {
        #expect(
            W3C_CSS_Values.Color.rgba(red: 0, green: 255, blue: 0, alpha: 0.5).description
                == "rgba(0, 255, 0, 0.5)"
        )
    }
}

// MARK: - HSL Colors

@Suite
struct `Color - HSL Format` {
    @Test func `hsl with degrees renders correctly`() {
        #expect(W3C_CSS_Values.Color.hsl(.deg(0), 100, 50).description == "hsl(0deg, 100%, 50%)")
        #expect(
            W3C_CSS_Values.Color.hsl(.deg(120), 100, 50).description == "hsl(120deg, 100%, 50%)"
        )
    }

    @Test func `hsl with turns renders correctly`() {
        #expect(
            W3C_CSS_Values.Color.hsl(.turn(0.5), 75, 25).description == "hsl(0.5turn, 75%, 25%)"
        )
    }

    @Test func `hsl with named parameters renders correctly`() {
        #expect(
            W3C_CSS_Values.Color.hsl(hue: .deg(120), saturation: 100, lightness: 50).description
                == "hsl(120deg, 100%, 50%)"
        )
    }
}

@Suite
struct `Color - HSLA Format` {
    @Test func `hsla with degrees renders correctly`() {
        #expect(
            W3C_CSS_Values.Color.hsla(.deg(0), 100, 50, 1.0).description
                == "hsla(0deg, 100%, 50%, 1)"
        )
    }

    @Test func `hsla with radians renders correctly`() {
        #expect(
            W3C_CSS_Values.Color.hsla(.rad(3.14), 75, 25, 0.5).description
                == "hsla(3.14rad, 75%, 25%, 0.5)"
        )
    }
}

// MARK: - HWB Colors

@Suite
struct `Color - HWB Format` {
    @Test func `hwb with degrees renders correctly`() {
        #expect(W3C_CSS_Values.Color.hwb(.deg(0), 10, 0).description == "hwb(0deg 10% 0%)")
    }

    @Test func `hwb with turns renders correctly`() {
        #expect(W3C_CSS_Values.Color.hwb(.turn(0.5), 25, 25).description == "hwb(0.5turn 25% 25%)")
    }
}

// MARK: - Modern Color Spaces

@Suite
struct `Color - LAB Format` {
    @Test func `lab color renders correctly`() {
        #expect(W3C_CSS_Values.Color.lab(50, 20, -40).description == "lab(50% 20 -40)")
    }
}

@Suite
struct `Color - LCH Format` {
    @Test func `lch color renders correctly`() {
        #expect(W3C_CSS_Values.Color.lch(50, 30, 40).description == "lch(50% 30 40)")
    }
}

@Suite
struct `Color - OKLAB Format` {
    @Test func `oklab color renders correctly`() {
        #expect(W3C_CSS_Values.Color.oklab(0.5, 0.1, -0.2).description == "oklab(0.5 0.1 -0.2)")
    }
}

@Suite
struct `Color - OKLCH Format` {
    @Test func `oklch color renders correctly`() {
        #expect(W3C_CSS_Values.Color.oklch(0.5, 0.2, 240).description == "oklch(0.5 0.2 240)")
    }
}

// MARK: - Color Mixing

@Suite
struct `Color - Color Mix` {
    @Test func `color-mix with rectangular color space`() {
        let mix1 = Color.mix(.rectangular(.srgb), .named(.red), .named(.blue))
        #expect(mix1.description == "color-mix(in srgb, red, blue)")
    }

    @Test func `color-mix with polar color space and percentage`() {
        let mix2 = Color.mix(.polar(.hsl), .rgb(255, 0, 0), .rgb(0, 0, 255), 25)
        #expect(mix2.description == "color-mix(in hsl, rgb(255, 0, 0), rgb(0, 0, 255) 25%)")
    }
}

// MARK: - System Colors

@Suite
struct `Color - System Colors` {
    @Test func `system color renders correctly`() {
        #expect(W3C_CSS_Values.Color.system(.canvas).description == "Canvas")
    }
}

// MARK: - Protocol Conformance

@Suite
struct `Color - Hashable Conformance` {
    @Test func `equal named colors are equal`() {
        #expect(W3C_CSS_Values.Color.named(.red) == Color.named(.red))
    }

    @Test func `different rgb values are not equal`() {
        #expect(W3C_CSS_Values.Color.rgb(255, 0, 0) != Color.rgb(254, 0, 0))
    }

    @Test func `different alpha values are not equal`() {
        #expect(W3C_CSS_Values.Color.rgba(0, 0, 255, 1.0) != Color.rgba(0, 0, 255, 0.9))
    }
}

// MARK: - Edge Cases

@Suite
struct `Color - Edge Cases` {
    @Test func `rgb boundary values - all zeros`() {
        #expect(W3C_CSS_Values.Color.rgb(0, 0, 0).description == "rgb(0, 0, 0)")
    }

    @Test func `rgb boundary values - all maximum`() {
        #expect(W3C_CSS_Values.Color.rgb(255, 255, 255).description == "rgb(255, 255, 255)")
    }

    @Test func `rgba alpha boundary - fully transparent`() {
        let color = W3C_CSS_Values.Color.rgba(0, 0, 0, 0.0)
        #expect(color.description.contains("0"))
    }

    @Test func `rgba alpha boundary - fully opaque`() {
        let color = W3C_CSS_Values.Color.rgba(0, 0, 0, 1.0)
        #expect(color.description.contains("1"))
    }

    @Test func `hsl saturation and lightness at 0`() {
        #expect(W3C_CSS_Values.Color.hsl(.deg(0), 0, 0).description == "hsl(0deg, 0%, 0%)")
    }

    @Test func `hsl saturation and lightness at 100`() {
        #expect(W3C_CSS_Values.Color.hsl(.deg(0), 100, 100).description == "hsl(0deg, 100%, 100%)")
    }

    @Test func `hue wrapping at 360 degrees`() {
        #expect(W3C_CSS_Values.Color.hsl(.deg(360), 50, 50).description == "hsl(360deg, 50%, 50%)")
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `Color - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `named color creation 100K times`() {
            for _ in 0..<100_000 {
                _ = W3C_CSS_Values.Color.named(.red)
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `rgb color creation 100K times`() {
            for i in 0..<100_000 {
                let value = i % 256
                _ = W3C_CSS_Values.Color.rgb(value, value, value)
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `rgba color creation 100K times`() {
            for i in 0..<100_000 {
                let value = i % 256
                _ = W3C_CSS_Values.Color.rgba(value, 0, 0, 0.5)
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `hsl color creation 100K times`() {
            for i in 0..<100_000 {
                let hue = Double(i % 360)
                _ = W3C_CSS_Values.Color.hsl(.deg(hue), 50, 50)
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `color comparison 100K times`() {
            let color1 = W3C_CSS_Values.Color.named(.red)
            let color2 = W3C_CSS_Values.Color.named(.blue)
            for _ in 0..<100_000 {
                _ = color1 == color2
            }
        }
    }
}
