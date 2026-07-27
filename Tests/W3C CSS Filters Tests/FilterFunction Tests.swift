// FilterFunction Tests.swift
// swift-w3c-css
//
// Tests for CSS FilterFunction type

import Testing
import W3C_CSS_Values

@testable import W3C_CSS_Filters

// MARK: - Blur Filter

@Suite
struct `FilterFunction - Blur` {
    @Test(arguments: [
        (Length.px(5), "blur(5px)"),
        (Length.em(0.5), "blur(0.5em)"),
        (Length.rem(1), "blur(1rem)"),
        (Length.px(10), "blur(10px)"),
    ])
    func `blur filter renders correctly`(
        radius: Length,
        expected: String
    ) {
        let blur = FilterFunction.blur(radius)
        #expect(blur.description == expected)
    }
}

// MARK: - Brightness Filter

@Suite
struct `FilterFunction - Brightness` {
    @Test(arguments: [
        (0.5, "brightness(50%)"),
        (1.0, "brightness(100%)"),
        (0.0, "brightness(0%)"),
        (1.5, "brightness(1.5)"),
        (2.0, "brightness(2)"),
    ])
    func `brightness filter renders correctly`(
        value: Double,
        expected: String
    ) {
        let brightness = FilterFunction.brightness(value)
        #expect(brightness.description == expected)
    }

    @Test func `brightness values between 0-1 render as percentages`() {
        let brightness50 = FilterFunction.brightness(0.5)
        #expect(brightness50.description == "brightness(50%)")

        let brightness75 = FilterFunction.brightness(0.75)
        #expect(brightness75.description == "brightness(75%)")
    }

    @Test func `brightness values outside 0-1 render as decimals`() {
        let brightness150 = FilterFunction.brightness(1.5)
        #expect(brightness150.description == "brightness(1.5)")

        let brightness200 = FilterFunction.brightness(2.0)
        #expect(brightness200.description == "brightness(2)")
    }
}

// MARK: - Contrast Filter

@Suite
struct `FilterFunction - Contrast` {
    @Test(arguments: [
        (0.75, "contrast(75%)"),
        (1.0, "contrast(100%)"),
        (2.0, "contrast(2)"),
        (0.5, "contrast(50%)"),
    ])
    func `contrast filter renders correctly`(
        value: Double,
        expected: String
    ) {
        let contrast = FilterFunction.contrast(value)
        #expect(contrast.description == expected)
    }
}

// MARK: - Drop Shadow Filter

@Suite
struct `FilterFunction - Drop Shadow` {
    @Test func `basic shadow without blur or color`() {
        let basicShadow = FilterFunction.dropShadow(
            offsetX: .px(5),
            offsetY: .px(5),
            blurRadius: nil,
            color: nil
        )
        #expect(basicShadow.description == "drop-shadow(5px 5px)")
    }

    @Test func `shadow with blur radius`() {
        let shadowWithBlur = FilterFunction.dropShadow(
            offsetX: .px(5),
            offsetY: .px(5),
            blurRadius: .px(10),
            color: nil
        )
        #expect(shadowWithBlur.description == "drop-shadow(5px 5px 10px)")
    }

    @Test func `shadow with blur and color`() {
        let fullShadow = FilterFunction.dropShadow(
            offsetX: .px(5),
            offsetY: .px(5),
            blurRadius: .px(10),
            color: .named(.black)
        )
        #expect(fullShadow.description == "drop-shadow(5px 5px 10px black)")
    }

    @Test func `shadow with negative offsets`() {
        let negativeShadow = FilterFunction.dropShadow(
            offsetX: .px(-3),
            offsetY: .px(-3),
            blurRadius: .px(5),
            color: .named(.gray)
        )
        #expect(negativeShadow.description == "drop-shadow(-3px -3px 5px gray)")
    }

    @Test func `shadow with zero offsets`() {
        let zeroShadow = FilterFunction.dropShadow(
            offsetX: .px(0),
            offsetY: .px(0),
            blurRadius: .px(10),
            color: .named(.red)
        )
        #expect(zeroShadow.description == "drop-shadow(0px 0px 10px red)")
    }
}

// MARK: - Grayscale Filter

@Suite
struct `FilterFunction - Grayscale` {
    @Test(arguments: [
        (0.5, "grayscale(50%)"),
        (1.0, "grayscale(100%)"),
        (0.0, "grayscale(0%)"),
        (0.25, "grayscale(25%)"),
    ])
    func `grayscale filter renders correctly`(
        value: Double,
        expected: String
    ) {
        let grayscale = FilterFunction.grayscale(value)
        #expect(grayscale.description == expected)
    }
}

// MARK: - Hue Rotate Filter

@Suite
struct `FilterFunction - Hue Rotate` {
    @Test(arguments: [
        (Angle.deg(90), "hue-rotate(90deg)"),
        (Angle.deg(180), "hue-rotate(180deg)"),
        (Angle.turn(0.25), "hue-rotate(0.25turn)"),
        (Angle.rad(1.57), "hue-rotate(1.57rad)"),
    ])
    func `hue-rotate filter renders correctly`(
        angle: Angle,
        expected: String
    ) {
        let rotate = FilterFunction.hueRotate(angle)
        #expect(rotate.description == expected)
    }

    @Test func `hue-rotate with negative angle`() {
        let rotate = FilterFunction.hueRotate(.deg(-45))
        #expect(rotate.description == "hue-rotate(-45deg)")
    }

    @Test func `hue-rotate with 0 degrees`() {
        let rotate = FilterFunction.hueRotate(.deg(0))
        #expect(rotate.description == "hue-rotate(0deg)")
    }

    @Test func `hue-rotate with 360 degrees`() {
        let rotate = FilterFunction.hueRotate(.deg(360))
        #expect(rotate.description == "hue-rotate(360deg)")
    }
}

// MARK: - Invert Filter

@Suite
struct `FilterFunction - Invert` {
    @Test(arguments: [
        (0.75, "invert(75%)"),
        (1.0, "invert(100%)"),
        (0.0, "invert(0%)"),
        (0.5, "invert(50%)"),
    ])
    func `invert filter renders correctly`(
        value: Double,
        expected: String
    ) {
        let invert = FilterFunction.invert(value)
        #expect(invert.description == expected)
    }
}

// MARK: - Opacity Filter

@Suite
struct `FilterFunction - Opacity` {
    @Test(arguments: [
        (0.5, "opacity(50%)"),
        (1.0, "opacity(100%)"),
        (0.0, "opacity(0%)"),
        (0.75, "opacity(75%)"),
    ])
    func `opacity filter renders correctly`(
        value: Double,
        expected: String
    ) {
        let opacity = FilterFunction.opacity(value)
        #expect(opacity.description == expected)
    }
}

// MARK: - Saturate Filter

@Suite
struct `FilterFunction - Saturate` {
    @Test(arguments: [
        (0.5, "saturate(50%)"),
        (1.0, "saturate(100%)"),
        (2.0, "saturate(2)"),
        (0.0, "saturate(0%)"),
    ])
    func `saturate filter renders correctly`(
        value: Double,
        expected: String
    ) {
        let saturate = FilterFunction.saturate(value)
        #expect(saturate.description == expected)
    }

    @Test func `saturate values greater than 1 render as decimals`() {
        let saturate200 = FilterFunction.saturate(2.0)
        #expect(saturate200.description == "saturate(2)")

        let saturate150 = FilterFunction.saturate(1.5)
        #expect(saturate150.description == "saturate(1.5)")
    }
}

// MARK: - Sepia Filter

@Suite
struct `FilterFunction - Sepia` {
    @Test(arguments: [
        (0.6, "sepia(60%)"),
        (1.0, "sepia(100%)"),
        (0.0, "sepia(0%)"),
        (0.8, "sepia(80%)"),
    ])
    func `sepia filter renders correctly`(
        value: Double,
        expected: String
    ) {
        let sepia = FilterFunction.sepia(value)
        #expect(sepia.description == expected)
    }
}

// MARK: - Protocol Conformance

@Suite
struct `FilterFunction - Hashable Conformance` {
    @Test func `equal blur filters are equal`() {
        let blur1 = FilterFunction.blur(.px(5))
        let blur2 = FilterFunction.blur(.px(5))
        #expect(blur1 == blur2)
    }

    @Test func `different blur filters are not equal`() {
        let blur1 = FilterFunction.blur(.px(5))
        let blur3 = FilterFunction.blur(.px(10))
        #expect(blur1 != blur3)
    }

    @Test func `different filter types are not equal`() {
        let blur = FilterFunction.blur(.px(5))
        let brightness = FilterFunction.brightness(0.5)
        #expect(blur != brightness)
    }

    @Test func `equal drop shadows are equal`() {
        let shadow1 = FilterFunction.dropShadow(
            offsetX: .px(5),
            offsetY: .px(5),
            blurRadius: .px(10),
            color: .named(.black)
        )

        let shadow2 = FilterFunction.dropShadow(
            offsetX: .px(5),
            offsetY: .px(5),
            blurRadius: .px(10),
            color: .named(.black)
        )

        #expect(shadow1 == shadow2)
    }

    @Test func `different drop shadows are not equal`() {
        let shadow1 = FilterFunction.dropShadow(
            offsetX: .px(5),
            offsetY: .px(5),
            blurRadius: .px(10),
            color: .named(.black)
        )

        let shadow2 = FilterFunction.dropShadow(
            offsetX: .px(5),
            offsetY: .px(5),
            blurRadius: .px(5),
            color: .named(.black)
        )

        #expect(shadow1 != shadow2)
    }

    @Test func `equal brightness filters are equal`() {
        let b1 = FilterFunction.brightness(0.5)
        let b2 = FilterFunction.brightness(0.5)
        #expect(b1 == b2)
    }

    @Test func `different brightness filters are not equal`() {
        let b1 = FilterFunction.brightness(0.5)
        let b2 = FilterFunction.brightness(0.75)
        #expect(b1 != b2)
    }
}

// MARK: - Usage in Context

@Suite
struct `FilterFunction - CSS Property Usage` {
    @Test func `single filter in filter property`() {
        let filter = "filter: \(FilterFunction.blur(.px(10)))"
        #expect(filter == "filter: blur(10px)")
    }

    @Test func `multiple filters in filter property`() {
        let filter = "filter: \(FilterFunction.blur(.px(10))) \(FilterFunction.brightness(1.2))"
        #expect(filter == "filter: blur(10px) brightness(1.2)")
    }

    @Test func `filter in backdrop-filter property`() {
        let backdropFilter =
            "backdrop-filter: \(FilterFunction.grayscale(1.0)) \(FilterFunction.contrast(1.1))"
        #expect(backdropFilter == "backdrop-filter: grayscale(100%) contrast(1.1)")
    }

    @Test func `complex filter chain`() {
        let filter =
            "filter: \(FilterFunction.blur(.px(5))) \(FilterFunction.brightness(0.8)) \(FilterFunction.contrast(1.2)) \(FilterFunction.grayscale(0.5))"
        #expect(filter == "filter: blur(5px) brightness(80%) contrast(1.2) grayscale(50%)")
    }
}

// MARK: - Edge Cases

@Suite
struct `FilterFunction - Edge Cases` {
    @Test func `blur with zero radius`() {
        let blur = FilterFunction.blur(.px(0))
        #expect(blur.description == "blur(0px)")
    }

    @Test func `brightness with zero value`() {
        let brightness = FilterFunction.brightness(0)
        #expect(brightness.description == "brightness(0%)")
    }

    @Test func `contrast with zero value`() {
        let contrast = FilterFunction.contrast(0)
        #expect(contrast.description == "contrast(0%)")
    }

    @Test func `grayscale with full intensity`() {
        let grayscale = FilterFunction.grayscale(1.0)
        #expect(grayscale.description == "grayscale(100%)")
    }

    @Test func `opacity with zero value`() {
        let opacity = FilterFunction.opacity(0)
        #expect(opacity.description == "opacity(0%)")
    }

    @Test func `saturate with zero value`() {
        let saturate = FilterFunction.saturate(0)
        #expect(saturate.description == "saturate(0%)")
    }

    @Test func `sepia with full intensity`() {
        let sepia = FilterFunction.sepia(1.0)
        #expect(sepia.description == "sepia(100%)")
    }

    @Test func `very large blur radius`() {
        let blur = FilterFunction.blur(.px(1000))
        #expect(blur.description == "blur(1000px)")
    }

    @Test func `very high brightness value`() {
        let brightness = FilterFunction.brightness(10.0)
        #expect(brightness.description == "brightness(10)")
    }

    @Test func `drop shadow with all parameters`() {
        let shadow = FilterFunction.dropShadow(
            offsetX: .em(1),
            offsetY: .em(2),
            blurRadius: .rem(0.5),
            color: .rgb(255, 0, 0)
        )
        #expect(shadow.description.contains("drop-shadow"))
        #expect(shadow.description.contains("1em"))
        #expect(shadow.description.contains("2em"))
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `FilterFunction - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `blur filter creation 100K times`() {
            for i in 0..<100_000 {
                _ = FilterFunction.blur(.px(Double(i % 100)))
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `brightness filter creation 100K times`() {
            for i in 0..<100_000 {
                _ = FilterFunction.brightness(Double(i % 100) / 100.0)
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `drop shadow filter creation 10K times`() {
            for i in 0..<10_000 {
                _ = FilterFunction.dropShadow(
                    offsetX: .px(Double(i % 10)),
                    offsetY: .px(Double(i % 10)),
                    blurRadius: .px(5),
                    color: .named(.black)
                )
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `filter comparison 100K times`() {
            let filter1 = FilterFunction.blur(.px(10))
            for i in 0..<100_000 {
                _ = filter1 == FilterFunction.blur(.px(Double(i % 20)))
            }
        }
    }
}
