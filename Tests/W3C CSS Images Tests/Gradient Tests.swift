// Gradient Tests.swift
// swift-w3c-css
//
// Tests for CSS Gradient type

import Testing
import W3C_CSS_Values

@testable import W3C_CSS_Images

// MARK: - Linear Gradients

@Suite
struct `Gradient - Linear with Direction` {
    @Test func `linear gradient with side direction`() {
        let gradient = Gradient.linear(
            direction: .to(.right),
            colorStops: [
                Gradient.ColorStop(.named(.red)),
                Gradient.ColorStop(.named(.blue)),
            ]
        )
        #expect(gradient.description == "linear-gradient(to right, red, blue)")
    }

    @Test func `linear gradient with diagonal direction`() {
        let diagonalGradient = Gradient.linear(
            direction: .to(.bottomRight),
            colorStops: [
                Gradient.ColorStop(.named(.yellow)),
                Gradient.ColorStop(.named(.green)),
            ]
        )
        #expect(diagonalGradient.description == "linear-gradient(to bottom right, yellow, green)")
    }

    @Test func `linear gradient factory method with direction`() {
        let linearGradient = Gradient.linearGradient(
            to: .right,
            colors: [.named(.red), .named(.blue)]
        )
        #expect(linearGradient.description == "linear-gradient(to right, red, blue)")
    }
}

@Suite
struct `Gradient - Linear with Angle` {
    @Test func `linear gradient with degree angle`() {
        let gradient = Gradient.linear(
            direction: .angle(.deg(45)),
            colorStops: [
                Gradient.ColorStop(.named(.red)),
                Gradient.ColorStop(.named(.blue)),
            ]
        )
        #expect(gradient.description == "linear-gradient(45deg, red, blue)")
    }

    @Test func `linear gradient with radian angle`() {
        let radGradient = Gradient.linear(
            direction: .angle(.rad(1.57)),
            colorStops: [
                Gradient.ColorStop(.named(.yellow)),
                Gradient.ColorStop(.named(.green)),
            ]
        )
        #expect(radGradient.description == "linear-gradient(1.57rad, yellow, green)")
    }

    @Test func `linear gradient factory method with angle`() {
        let angleGradient = Gradient.linearGradient(
            angle: .deg(45),
            colors: [.named(.red), .named(.blue)]
        )
        #expect(angleGradient.description == "linear-gradient(45deg, red, blue)")
    }
}

@Suite
struct `Gradient - Linear with Color Stop Positions` {
    @Test func `linear gradient with percentage positions`() {
        let gradient = Gradient.linear(
            direction: .to(.bottom),
            colorStops: [
                Gradient.ColorStop(.named(.red), at: .percentage(Percentage(0))),
                Gradient.ColorStop(.named(.yellow), at: .percentage(Percentage(50))),
                Gradient.ColorStop(.named(.blue), at: .percentage(Percentage(100))),
            ]
        )
        #expect(gradient.description == "linear-gradient(to bottom, red 0%, yellow 50%, blue 100%)")
    }

    @Test func `linear gradient with length positions`() {
        let gradientWithLengths = Gradient.linear(
            direction: .to(.right),
            colorStops: [
                Gradient.ColorStop(.named(.red), at: .length(.px(0))),
                Gradient.ColorStop(.named(.blue), at: .length(.px(200))),
            ]
        )
        #expect(gradientWithLengths.description == "linear-gradient(to right, red 0px, blue 200px)")
    }

    @Test func `linear gradient with mixed position types`() {
        let gradient = Gradient.linear(
            direction: .to(.right),
            colorStops: [
                Gradient.ColorStop(.named(.red)),
                Gradient.ColorStop(.named(.yellow), at: .percentage(Percentage(50))),
                Gradient.ColorStop(.named(.blue), at: .length(.px(300))),
            ]
        )
        #expect(gradient.description == "linear-gradient(to right, red, yellow 50%, blue 300px)")
    }
}

@Suite
struct `Gradient - Repeating Linear` {
    @Test func `repeating linear gradient with percentages`() {
        let gradient = Gradient.repeatingLinear(
            direction: .to(.right),
            colorStops: [
                Gradient.ColorStop(.named(.red), at: .percentage(Percentage(0))),
                Gradient.ColorStop(.named(.blue), at: .percentage(Percentage(25))),
            ]
        )
        #expect(gradient.description == "repeating-linear-gradient(to right, red 0%, blue 25%)")
    }

    @Test func `repeating linear gradient without direction`() {
        let gradient = Gradient.repeatingLinear(
            direction: nil,
            colorStops: [
                Gradient.ColorStop(.named(.red)),
                Gradient.ColorStop(.named(.blue)),
            ]
        )
        #expect(gradient.description == "repeating-linear-gradient(red, blue)")
    }
}

// MARK: - Radial Gradients

@Suite
struct `Gradient - Radial Basic` {
    @Test func `radial gradient without options`() {
        let gradient = Gradient.radial(
            options: nil,
            colorStops: [
                Gradient.ColorStop(.named(.yellow)),
                Gradient.ColorStop(.named(.green)),
            ]
        )
        #expect(gradient.description == "radial-gradient(yellow, green)")
    }

    @Test func `radial gradient with circle shape`() {
        let circleGradient = Gradient.radial(
            options: Gradient.RadialOptions(shape: .circle),
            colorStops: [
                Gradient.ColorStop(.named(.yellow)),
                Gradient.ColorStop(.named(.green)),
            ]
        )
        #expect(circleGradient.description == "radial-gradient(circle, yellow, green)")
    }

    @Test func `radial gradient factory method`() {
        let radialGradient = Gradient.radialGradient(
            colors: [.named(.yellow), .named(.green)]
        )
        #expect(radialGradient.description == "radial-gradient(yellow, green)")
    }
}

@Suite
struct `Gradient - Radial with Options` {
    @Test func `radial gradient with complete options`() {
        let gradient = Gradient.radial(
            options: Gradient.RadialOptions(
                shape: .circle,
                size: .keyword(.closestCorner),
                at: .center
            ),
            colorStops: [
                Gradient.ColorStop(.named(.yellow)),
                Gradient.ColorStop(.named(.green)),
            ]
        )
        #expect(
            gradient.description
                == "radial-gradient(circle closest-corner at center, yellow, green)"
        )
    }

    @Test func `radial gradient with elliptical size`() {
        let explicitSizeGradient = Gradient.radial(
            options: Gradient.RadialOptions(
                shape: .ellipse,
                size: .elliptical(
                    radiusX: .percentage(Percentage(50)),
                    radiusY: .percentage(Percentage(25))
                ),
                at: .topLeft
            ),
            colorStops: [
                Gradient.ColorStop(.named(.red)),
                Gradient.ColorStop(.named(.blue)),
            ]
        )
        #expect(
            explicitSizeGradient.description
                == "radial-gradient(ellipse 50% 25% at top left, red, blue)"
        )
    }

    @Test func `radial gradient factory method with options`() {
        let radialWithOptions = Gradient.radialGradient(
            shape: .circle,
            size: .keyword(.closestCorner),
            at: .center,
            colors: [.named(.yellow), .named(.green)]
        )
        #expect(
            radialWithOptions.description
                == "radial-gradient(circle closest-corner at center, yellow, green)"
        )
    }
}

@Suite
struct `Gradient - Repeating Radial` {
    @Test func `repeating radial gradient`() {
        let gradient = Gradient.repeatingRadial(
            options: Gradient.RadialOptions(shape: .circle),
            colorStops: [
                Gradient.ColorStop(.named(.yellow), at: .percentage(Percentage(0))),
                Gradient.ColorStop(.named(.green), at: .percentage(Percentage(20))),
            ]
        )
        #expect(gradient.description == "repeating-radial-gradient(circle, yellow 0%, green 20%)")
    }

    @Test func `repeating radial gradient without options`() {
        let gradient = Gradient.repeatingRadial(
            options: nil,
            colorStops: [
                Gradient.ColorStop(.named(.red)),
                Gradient.ColorStop(.named(.blue)),
            ]
        )
        #expect(gradient.description == "repeating-radial-gradient(red, blue)")
    }
}

// MARK: - Conic Gradients

@Suite
struct `Gradient - Conic Basic` {
    @Test func `conic gradient without options`() {
        let gradient = Gradient.conic(
            angle: nil,
            at: nil,
            colorStops: [
                Gradient.ColorStop(.named(.red)),
                Gradient.ColorStop(.named(.yellow)),
                Gradient.ColorStop(.named(.blue)),
            ]
        )
        #expect(gradient.description == "conic-gradient(red, yellow, blue)")
    }

    @Test func `conic gradient factory method`() {
        let conicGradient = Gradient.conicGradient(
            colors: [.named(.red), .named(.yellow), .named(.blue)]
        )
        #expect(conicGradient.description == "conic-gradient(red, yellow, blue)")
    }
}

@Suite
struct `Gradient - Conic with Options` {
    @Test func `conic gradient with angle and position`() {
        let gradientWithOptions = Gradient.conic(
            angle: .deg(45),
            at: .center,
            colorStops: [
                Gradient.ColorStop(.named(.red)),
                Gradient.ColorStop(.named(.yellow)),
                Gradient.ColorStop(.named(.blue)),
            ]
        )
        #expect(
            gradientWithOptions.description
                == "conic-gradient(from 45deg, at center, red, yellow, blue)"
        )
    }

    @Test func `conic gradient with only angle`() {
        let gradient = Gradient.conic(
            angle: .deg(90),
            at: nil,
            colorStops: [
                Gradient.ColorStop(.named(.red)),
                Gradient.ColorStop(.named(.blue)),
            ]
        )
        #expect(gradient.description == "conic-gradient(from 90deg, red, blue)")
    }

    @Test func `conic gradient factory method with options`() {
        let conicWithOptions = Gradient.conicGradient(
            from: .deg(45),
            at: .center,
            colors: [.named(.red), .named(.yellow), .named(.blue)]
        )
        #expect(
            conicWithOptions.description
                == "conic-gradient(from 45deg, at center, red, yellow, blue)"
        )
    }
}

@Suite
struct `Gradient - Repeating Conic` {
    @Test func `repeating conic gradient`() {
        let gradient = Gradient.repeatingConic(
            angle: .deg(0),
            at: .center,
            colorStops: [
                Gradient.ColorStop(.named(.red), at: .percentage(Percentage(0))),
                Gradient.ColorStop(.named(.blue), at: .percentage(Percentage(25))),
            ]
        )
        #expect(
            gradient.description
                == "repeating-conic-gradient(from 0deg, at center, red 0%, blue 25%)"
        )
    }

    @Test func `repeating conic gradient without options`() {
        let gradient = Gradient.repeatingConic(
            angle: nil,
            at: nil,
            colorStops: [
                Gradient.ColorStop(.named(.red)),
                Gradient.ColorStop(.named(.blue)),
            ]
        )
        #expect(gradient.description == "repeating-conic-gradient(red, blue)")
    }
}

// MARK: - Color Interpolation

@Suite
struct `Gradient - Color Interpolation` {
    @Test func `linear gradient with rectangular color space`() {
        let gradient = Gradient.linear(
            direction: .to(.right),
            colorStops: [
                Gradient.ColorStop(.named(.red)),
                Gradient.ColorStop(.named(.blue)),
            ],
            interpolation: .rectangular(.srgb)
        )
        #expect(gradient.description == "linear-gradient(in srgb, to right, red, blue)")
    }

    @Test func `radial gradient with polar color space`() {
        let hslGradient = Gradient.radial(
            options: nil,
            colorStops: [
                Gradient.ColorStop(.named(.yellow)),
                Gradient.ColorStop(.named(.green)),
            ],
            interpolation: .polar(.hsl, .shorter)
        )
        #expect(hslGradient.description == "radial-gradient(in hsl shorter hue, yellow, green)")
    }

    @Test func `conic gradient with color interpolation`() {
        let gradient = Gradient.conic(
            angle: nil,
            at: nil,
            colorStops: [
                Gradient.ColorStop(.named(.red)),
                Gradient.ColorStop(.named(.blue)),
            ],
            interpolation: .rectangular(.lab)
        )
        #expect(gradient.description == "conic-gradient(in lab, red, blue)")
    }
}

// MARK: - Protocol Conformance

@Suite
struct `Gradient - Hashable Conformance` {
    @Test func `equal linear gradients are equal`() {
        let gradient1 = Gradient.linearGradient(
            to: .right,
            colors: [.named(.red), .named(.blue)]
        )

        let gradient2 = Gradient.linearGradient(
            to: .right,
            colors: [.named(.red), .named(.blue)]
        )

        #expect(gradient1 == gradient2)
    }

    @Test func `different linear gradients are not equal`() {
        let gradient1 = Gradient.linearGradient(
            to: .right,
            colors: [.named(.red), .named(.blue)]
        )

        let gradient3 = Gradient.linearGradient(
            to: .bottom,
            colors: [.named(.red), .named(.blue)]
        )

        #expect(gradient1 != gradient3)
    }

    @Test func `equal radial gradients are equal`() {
        let gradient1 = Gradient.radialGradient(
            colors: [.named(.yellow), .named(.green)]
        )

        let gradient2 = Gradient.radialGradient(
            colors: [.named(.yellow), .named(.green)]
        )

        #expect(gradient1 == gradient2)
    }

    @Test func `different gradient types are not equal`() {
        let linear = Gradient.linearGradient(
            to: .right,
            colors: [.named(.red), .named(.blue)]
        )

        let radial = Gradient.radialGradient(
            colors: [.named(.red), .named(.blue)]
        )

        #expect(linear != radial)
    }
}

// MARK: - Edge Cases

@Suite
struct `Gradient - Edge Cases` {
    @Test func `gradient with single color stop`() {
        let gradient = Gradient.linear(
            direction: nil,
            colorStops: [
                Gradient.ColorStop(.named(.red))
            ]
        )
        #expect(gradient.description == "linear-gradient(red)")
    }

    @Test func `gradient with many color stops`() {
        let gradient = Gradient.linear(
            direction: .to(.right),
            colorStops: [
                Gradient.ColorStop(.named(.red)),
                Gradient.ColorStop(.named(.orange)),
                Gradient.ColorStop(.named(.yellow)),
                Gradient.ColorStop(.named(.green)),
                Gradient.ColorStop(.named(.blue)),
            ]
        )
        #expect(
            gradient.description == "linear-gradient(to right, red, orange, yellow, green, blue)"
        )
    }

    @Test func `radial gradient with all size keywords`() {
        let keywords: [Gradient.RadialOptions.Size.Keyword] = [
            .closestSide, .farthestSide, .closestCorner, .farthestCorner,
        ]

        for keyword in keywords {
            let gradient = Gradient.radial(
                options: Gradient.RadialOptions(
                    shape: .circle,
                    size: .keyword(keyword)
                ),
                colorStops: [
                    Gradient.ColorStop(.named(.red)),
                    Gradient.ColorStop(.named(.blue)),
                ]
            )
            // Just verify it contains the keyword
            #expect(gradient.description.contains(keyword.rawValue))
        }
    }

    @Test func `conic gradient with 0 degree angle`() {
        let gradient = Gradient.conic(
            angle: .deg(0),
            at: nil,
            colorStops: [
                Gradient.ColorStop(.named(.red)),
                Gradient.ColorStop(.named(.blue)),
            ]
        )
        #expect(gradient.description == "conic-gradient(from 0deg, red, blue)")
    }

    @Test func `conic gradient with 360 degree angle`() {
        let gradient = Gradient.conic(
            angle: .deg(360),
            at: nil,
            colorStops: [
                Gradient.ColorStop(.named(.red)),
                Gradient.ColorStop(.named(.blue)),
            ]
        )
        #expect(gradient.description == "conic-gradient(from 360deg, red, blue)")
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `Gradient - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `linear gradient creation 10K times`() {
            for _ in 0..<10_000 {
                _ = Gradient.linearGradient(
                    to: .right,
                    colors: [.named(.red), .named(.blue)]
                )
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `radial gradient creation 10K times`() {
            for _ in 0..<10_000 {
                _ = Gradient.radialGradient(
                    colors: [.named(.yellow), .named(.green)]
                )
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `conic gradient creation 10K times`() {
            for _ in 0..<10_000 {
                _ = Gradient.conicGradient(
                    colors: [.named(.red), .named(.yellow), .named(.blue)]
                )
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `gradient comparison 100K times`() {
            let gradient1 = Gradient.linearGradient(
                to: .right,
                colors: [.named(.red), .named(.blue)]
            )
            for i in 0..<100_000 {
                let side: Gradient.Direction.Side = (i % 2 == 0) ? .right : .left
                _ =
                    gradient1
                    == Gradient.linearGradient(
                        to: side,
                        colors: [.named(.red), .named(.blue)]
                    )
            }
        }
    }
}
