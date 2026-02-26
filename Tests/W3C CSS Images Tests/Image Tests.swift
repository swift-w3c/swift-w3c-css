// Image Tests.swift
// swift-w3c-css
//
// Tests for CSS Image type

import Testing
import W3C_CSS_Color
import W3C_CSS_Shared
import W3C_CSS_Values

@testable import W3C_CSS_Images

// MARK: - URL Images

@Suite
struct `Image - URL Initialization` {
    @Test(arguments: [
        ("image.jpg", #"url("image.jpg")"#),
        ("/images/banner.png", #"url("/images/banner.png")"#),
        ("https://example.com/photo.jpg", #"url("https://example.com/photo.jpg")"#),
    ])
    func `url images render correctly`(
        url: String,
        expected: String
    ) {
        let image = Image.url(Url(url))
        #expect(image.description == expected)
    }

    @Test func `url image handles quoted input`() {
        let imageWithQuotes = Image.url(#""path/to/image.jpg""#)
        #expect(imageWithQuotes.description == #"url("\"path/to/image.jpg\"")"#)
    }
}

// MARK: - Gradient Images

@Suite
struct `Image - Linear Gradient` {
    @Test func `linear gradient without direction renders correctly`() {
        let linearGradient = Image.gradient(
            Gradient.linear(
                direction: nil,
                colorStops: [
                    Gradient.ColorStop(Color.named(.red)),
                    Gradient.ColorStop(Color.named(.blue)),
                ]
            )
        )
        #expect(linearGradient.description == "linear-gradient(red, blue)")
    }

    @Test func `linear gradient factory method without direction`() {
        let linearGradient = Image.linearGradient([
            Color.named(.red),
            Color.named(.blue),
        ])
        #expect(linearGradient.description == "linear-gradient(red, blue)")
    }

    @Test func `linear gradient with side direction`() {
        let linearGradientWithSide = Image.linearGradient(
            to: .right,
            stops: [Color.named(.yellow), Color.named(.green)]
        )
        #expect(linearGradientWithSide.description == "linear-gradient(to right, yellow, green)")
    }

    @Test func `linear gradient with angle`() {
        let linearGradientWithAngle = Image.linearGradient(
            angle: Angle.deg(90),
            stops: [Color.named(.yellow), Color.named(.green)]
        )
        #expect(linearGradientWithAngle.description == "linear-gradient(90deg, yellow, green)")
    }
}

@Suite
struct `Image - Radial Gradient` {
    @Test func `radial gradient renders correctly`() {
        let radialOptions = Gradient.RadialOptions(shape: .circle)
        let radialGradient = Image.gradient(
            Gradient.radial(
                options: radialOptions,
                colorStops: [
                    Gradient.ColorStop(Color.named(.yellow)),
                    Gradient.ColorStop(Color.named(.green)),
                ]
            )
        )
        #expect(radialGradient.description == "radial-gradient(circle, yellow, green)")
    }

    @Test func `radial gradient factory method`() {
        let radialGradient = Image.radialGradient([
            Color.named(.orange),
            Color.named(.purple),
        ])
        #expect(radialGradient.description == "radial-gradient(orange, purple)")
    }
}

@Suite
struct `Image - Conic Gradient` {
    @Test func `conic gradient factory method`() {
        let conicGradient = Image.conicGradient(
            from: Angle.deg(45),
            stops: [Color.named(.red), Color.named(.yellow), Color.named(.blue)]
        )
        #expect(conicGradient.description == "conic-gradient(from 45deg, red, yellow, blue)")
    }
}

// MARK: - Special Image Types

@Suite
struct `Image - Element Reference` {
    @Test(arguments: [
        ("header", "element(#header)"),
        ("logo", "element(#logo)"),
        ("nav", "element(#nav)"),
    ])
    func `element images render correctly`(
        id: String,
        expected: String
    ) {
        let element = Image.element(id: id)
        #expect(element.description == expected)
    }
}

@Suite
struct `Image - Cross Fade` {
    @Test func `cross fade with URL images`() {
        let crossFade = Image.crossFade(
            percentage: Percentage(40),
            from: .url("old.jpg"),
            to: .url("new.jpg")
        )
        #expect(crossFade.description == #"cross-fade(40% url("old.jpg"), url("new.jpg"))"#)
    }

    @Test func `cross fade with gradient`() {
        let linearGradient = Gradient.linear(
            direction: nil,
            colorStops: [
                Gradient.ColorStop(Color.named(.red)),
                Gradient.ColorStop(Color.named(.blue)),
            ]
        )

        let crossFadeWithGradient = Image.crossFade(
            percentage: Percentage(75),
            from: .url("image.jpg"),
            to: .gradient(linearGradient)
        )
        #expect(
            crossFadeWithGradient.description
                == #"cross-fade(75% url("image.jpg"), linear-gradient(red, blue))"#
        )
    }
}

@Suite
struct `Image - Image Set` {
    @Test func `image set with two items`() {
        let imageSet = Image.imageSet(images: [
            ImageSetItem(url: "image.png", resolution: "1x"),
            ImageSetItem(url: "image-2x.png", resolution: "2x"),
        ])
        #expect(imageSet.description == #"image-set(url("image.png") 1x, url("image-2x.png") 2x)"#)
    }

    @Test func `image set with multiple items`() {
        let imageSetWithManyItems = Image.imageSet(images: [
            ImageSetItem(url: "small.jpg", resolution: "1x"),
            ImageSetItem(url: "medium.jpg", resolution: "2x"),
            ImageSetItem(url: "large.jpg", resolution: "3x"),
        ])
        #expect(
            imageSetWithManyItems.description
                == #"image-set(url("small.jpg") 1x, url("medium.jpg") 2x, url("large.jpg") 3x)"#
        )
    }

    @Test func `image set factory method`() {
        let imageSet = Image.imageSet([
            (url: "image.png", resolution: "1x"),
            (url: "image-2x.png", resolution: "2x"),
        ])
        #expect(imageSet.description == #"image-set(url("image.png") 1x, url("image-2x.png") 2x)"#)
    }
}

@Suite
struct `Image - Paint Worklet` {
    @Test func `paint without arguments`() {
        let paint = Image.paint(name: "myPaintWorklet")
        #expect(paint.description == "paint(myPaintWorklet)")
    }

    @Test func `paint with arguments`() {
        let paintWithArgs = Image.paint(name: "checkerboard", arguments: ["green", "10px"])
        #expect(paintWithArgs.description == "paint(checkerboard, green, 10px)")
    }

    @Test func `paint factory method`() {
        let paint = Image.paint("checkboard", arguments: ["black", "white", "10px"])
        #expect(paint.description == "paint(checkboard, black, white, 10px)")
    }
}

@Suite
struct `Image - None Value` {
    @Test func `none image renders correctly`() {
        let none = Image.none
        #expect(none.description == "none")
    }
}

// MARK: - Protocol Conformance

@Suite
struct `Image - Hashable Conformance` {
    @Test func `equal URL images are equal`() {
        #expect(Image.url("image.jpg") == Image.url("image.jpg"))
    }

    @Test func `different URL images are not equal`() {
        #expect(Image.url("image1.jpg") != Image.url("image2.jpg"))
    }

    @Test func `equal gradients are equal`() {
        let gradient1 = Gradient.linear(
            direction: nil,
            colorStops: [
                Gradient.ColorStop(Color.named(.red)),
                Gradient.ColorStop(Color.named(.blue)),
            ]
        )
        let gradient2 = Gradient.linear(
            direction: nil,
            colorStops: [
                Gradient.ColorStop(Color.named(.red)),
                Gradient.ColorStop(Color.named(.blue)),
            ]
        )
        #expect(Image.gradient(gradient1) == Image.gradient(gradient2))
    }

    @Test func `different gradients are not equal`() {
        let gradient1 = Gradient.linear(
            direction: nil,
            colorStops: [
                Gradient.ColorStop(Color.named(.red)),
                Gradient.ColorStop(Color.named(.blue)),
            ]
        )
        let gradient2 = Gradient.linear(
            direction: .angle(.deg(45)),
            colorStops: [
                Gradient.ColorStop(Color.named(.red)),
                Gradient.ColorStop(Color.named(.blue)),
            ]
        )
        #expect(Image.gradient(gradient1) != Image.gradient(gradient2))
    }

    @Test func `equal paint worklets are equal`() {
        #expect(Image.paint(name: "worklet1") == Image.paint(name: "worklet1"))
    }

    @Test func `different paint worklets are not equal`() {
        #expect(Image.paint(name: "worklet1") != Image.paint(name: "worklet2"))
    }

    @Test func `different types are not equal`() {
        #expect(Image.url("image.jpg") != Image.none)
        let gradient = Gradient.linear(
            direction: nil,
            colorStops: [
                Gradient.ColorStop(Color.named(.red)),
                Gradient.ColorStop(Color.named(.blue)),
            ]
        )
        #expect(Image.gradient(gradient) != Image.url("gradient.png"))
    }

    @Test func `none values are equal`() {
        #expect(Image.none == Image.none)
    }
}

// MARK: - Usage in Context

@Suite
struct `Image - CSS Property Usage` {
    @Test func `image renders correctly in background-image property`() {
        let backgroundImage = "background-image: \(Image.url("banner.jpg"))"
        #expect(backgroundImage == #"background-image: url("banner.jpg")"#)
    }

    @Test func `image renders correctly in border-image property`() {
        let borderImage =
            "border-image: \(Image.linearGradient([Color.named(.red), Color.named(.blue)]))"
        #expect(borderImage == "border-image: linear-gradient(red, blue)")
    }

    @Test func `image renders correctly in list-style-image property`() {
        let listStyleImage = "list-style-image: \(Image.url("bullet.png"))"
        #expect(listStyleImage == #"list-style-image: url("bullet.png")"#)
    }
}

// MARK: - Edge Cases

@Suite
struct `Image - Edge Cases` {
    @Test func `empty URL string`() {
        let image = Image.url("")
        #expect(image.description == #"url("")"#)
    }

    @Test func `URL with special characters`() {
        let image = Image.url("path/to/image with spaces.jpg")
        #expect(image.description == #"url("path/to/image with spaces.jpg")"#)
    }

    @Test func `paint worklet with no arguments array`() {
        let paint = Image.paint(name: "simple")
        #expect(paint.description == "paint(simple)")
    }

    @Test func `paint worklet with empty arguments array`() {
        let paint = Image.paint(name: "simple", arguments: [])
        #expect(paint.description == "paint(simple)")
    }

    @Test func `cross fade with 0 percent`() {
        let crossFade = Image.crossFade(
            percentage: Percentage(0),
            from: .url("old.jpg"),
            to: .url("new.jpg")
        )
        #expect(crossFade.description == #"cross-fade(0% url("old.jpg"), url("new.jpg"))"#)
    }

    @Test func `cross fade with 100 percent`() {
        let crossFade = Image.crossFade(
            percentage: Percentage(100),
            from: .url("old.jpg"),
            to: .url("new.jpg")
        )
        #expect(crossFade.description == #"cross-fade(100% url("old.jpg"), url("new.jpg"))"#)
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `Image - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `URL image creation 100K times`() {
            for i in 0..<100_000 {
                _ = Image.url(Url("image\(i).jpg"))
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `gradient image creation 10K times`() {
            for _ in 0..<10_000 {
                _ = Image.linearGradient([
                    Color.named(.red),
                    Color.named(.blue),
                ])
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `image comparison 100K times`() {
            let image1 = Image.url(Url("test.jpg"))
            for i in 0..<100_000 {
                _ = image1 == Image.url(Url("test\(i % 10).jpg"))
            }
        }
    }
}
