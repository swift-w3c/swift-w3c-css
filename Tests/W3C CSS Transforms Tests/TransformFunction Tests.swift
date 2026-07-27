// TransformFunction Tests.swift
// swift-w3c-css
//
// Tests for CSS TransformFunction type

import Testing
import W3C_CSS_Values

@testable import W3C_CSS_Transforms

// MARK: - Matrix Transformations

@Suite
struct `TransformFunction - Matrix` {
    @Test func `2D matrix renders correctly`() {
        let matrix = TransformFunction.matrix(a: 1, b: 2, c: -1, d: 1, tx: 80, ty: 80)
        #expect(matrix.description == "matrix(1, 2, -1, 1, 80, 80)")
    }

    @Test func `identity matrix renders correctly`() {
        let identity = TransformFunction.identity
        #expect(identity.description == "matrix(1, 0, 0, 1, 0, 0)")
    }

    @Test(arguments: [
        (1, 0, 0, 1, 0, 0, "matrix(1, 0, 0, 1, 0, 0)"),
        (2, 0, 0, 2, 0, 0, "matrix(2, 0, 0, 2, 0, 0)"),
        (1, 0, 0, 1, 100, 50, "matrix(1, 0, 0, 1, 100, 50)"),
    ])
    // swiftlint:disable:next function_parameter_count
    func `various 2D matrices render correctly`(
        a: Double,
        b: Double,
        c: Double,
        d: Double,
        tx: Double,
        ty: Double,
        expected: String
    ) {
        let matrix = TransformFunction.matrix(a: a, b: b, c: c, d: d, tx: tx, ty: ty)
        #expect(matrix.description == expected)
    }
}

@Suite
struct `TransformFunction - Matrix 3D` {
    @Test func `3D matrix renders correctly`() {
        let matrix3d = TransformFunction.matrix3d(values: [
            1, 0, 0, 0, 0, 1, 3, 0, 0, 0, 1, 0, 50, 100, 0, 1.1,
        ])
        #expect(
            matrix3d.description == "matrix3d(1, 0, 0, 0, 0, 1, 3, 0, 0, 0, 1, 0, 50, 100, 0, 1.1)"
        )
    }

    @Test func `identity 3D matrix renders correctly`() {
        let identity3d = TransformFunction.matrix3d(values: [
            1, 0, 0, 0,
            0, 1, 0, 0,
            0, 0, 1, 0,
            0, 0, 0, 1,
        ])
        #expect(
            identity3d.description == "matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1)"
        )
    }
}

// MARK: - Perspective

@Suite
struct `TransformFunction - Perspective` {
    @Test(arguments: [
        (Length.px(200), "perspective(200px)"),
        (Length.px(500), "perspective(500px)"),
        (Length.em(10), "perspective(10em)"),
        (Length.rem(20), "perspective(20rem)"),
    ])
    func `perspective transformation renders correctly`(
        distance: Length,
        expected: String
    ) {
        let perspective = TransformFunction.perspective(distance)
        #expect(perspective.description == expected)
    }
}

// MARK: - Rotation Transformations

@Suite
struct `TransformFunction - Rotate 2D` {
    @Test(arguments: [
        (Angle.deg(45), "rotate(45deg)"),
        (Angle.deg(90), "rotate(90deg)"),
        (Angle.deg(180), "rotate(180deg)"),
        (Angle.rad(1.57), "rotate(1.57rad)"),
        (Angle.turn(0.5), "rotate(0.5turn)"),
    ])
    func `2D rotation renders correctly`(
        angle: Angle,
        expected: String
    ) {
        let rotate = TransformFunction.rotate(angle)
        #expect(rotate.description == expected)
    }

    @Test func `negative rotation`() {
        let rotate = TransformFunction.rotate(.deg(-45))
        #expect(rotate.description == "rotate(-45deg)")
    }

    @Test func `zero rotation`() {
        let rotate = TransformFunction.rotate(.deg(0))
        #expect(rotate.description == "rotate(0deg)")
    }
}

@Suite
struct `TransformFunction - Rotate 3D` {
    @Test func `3D rotation renders correctly`() {
        let rotate3d = TransformFunction.rotate3d(x: 1, y: 1, z: 1, angle: .deg(90))
        #expect(rotate3d.description == "rotate3d(1, 1, 1, 90deg)")
    }

    @Test(arguments: [
        (1, 0, 0, Angle.deg(45), "rotate3d(1, 0, 0, 45deg)"),
        (0, 1, 0, Angle.deg(90), "rotate3d(0, 1, 0, 90deg)"),
        (0, 0, 1, Angle.deg(180), "rotate3d(0, 0, 1, 180deg)"),
    ])
    func `3D rotation on different axes`(
        x: Double,
        y: Double,
        z: Double,
        angle: Angle,
        expected: String
    ) {
        let rotate3d = TransformFunction.rotate3d(x: x, y: y, z: z, angle: angle)
        #expect(rotate3d.description == expected)
    }
}

@Suite
struct `TransformFunction - Rotate Axes` {
    @Test func `rotateX renders correctly`() {
        let rotateX = TransformFunction.rotateX(.deg(180))
        #expect(rotateX.description == "rotateX(180deg)")
    }

    @Test func `rotateY renders correctly`() {
        let rotateY = TransformFunction.rotateY(.deg(90))
        #expect(rotateY.description == "rotateY(90deg)")
    }

    @Test func `rotateZ renders correctly`() {
        let rotateZ = TransformFunction.rotateZ(.deg(45))
        #expect(rotateZ.description == "rotateZ(45deg)")
    }

    @Test(arguments: [
        (Angle.deg(0), "rotateX(0deg)", "rotateY(0deg)", "rotateZ(0deg)"),
        (Angle.deg(90), "rotateX(90deg)", "rotateY(90deg)", "rotateZ(90deg)"),
        (Angle.deg(180), "rotateX(180deg)", "rotateY(180deg)", "rotateZ(180deg)"),
    ])
    func `axis rotations with various angles`(
        angle: Angle,
        expectedX: String,
        expectedY: String,
        expectedZ: String
    ) {
        #expect(TransformFunction.rotateX(angle).description == expectedX)
        #expect(TransformFunction.rotateY(angle).description == expectedY)
        #expect(TransformFunction.rotateZ(angle).description == expectedZ)
    }
}

// MARK: - Scaling Transformations

@Suite
struct `TransformFunction - Scale` {
    @Test func `uniform scale renders correctly`() {
        let scale1 = TransformFunction.scale(1.5)
        #expect(scale1.description == "scale(1.5)")
    }

    @Test func `non-uniform scale renders correctly`() {
        let scale2 = TransformFunction.scale(sx: 1.5, sy: 2)
        #expect(scale2.description == "scale(1.5, 2)")
    }

    @Test(arguments: [
        (1.0, "scale(1)"),
        (2.0, "scale(2)"),
        (0.5, "scale(0.5)"),
        (0.0, "scale(0)"),
    ])
    func `various uniform scales`(
        scale: Double,
        expected: String
    ) {
        let scaleTransform = TransformFunction.scale(scale)
        #expect(scaleTransform.description == expected)
    }
}

@Suite
struct `TransformFunction - Scale 3D` {
    @Test func `3D scale renders correctly`() {
        let scale3d = TransformFunction.scale3d(sx: 1, sy: 1.5, sz: 1.5)
        #expect(scale3d.description == "scale3d(1, 1.5, 1.5)")
    }

    @Test(arguments: [
        (1, 1, 1, "scale3d(1, 1, 1)"),
        (2, 2, 2, "scale3d(2, 2, 2)"),
        (0.5, 1.5, 2, "scale3d(0.5, 1.5, 2)"),
    ])
    func `various 3D scales`(
        sx: Double,
        sy: Double,
        sz: Double,
        expected: String
    ) {
        let scale3d = TransformFunction.scale3d(sx: sx, sy: sy, sz: sz)
        #expect(scale3d.description == expected)
    }
}

@Suite
struct `TransformFunction - Scale Axes` {
    @Test func `scaleX renders correctly`() {
        let scaleX = TransformFunction.scaleX(2)
        #expect(scaleX.description == "scaleX(2)")
    }

    @Test func `scaleY renders correctly`() {
        let scaleY = TransformFunction.scaleY(0.5)
        #expect(scaleY.description == "scaleY(0.5)")
    }

    @Test func `scaleZ renders correctly`() {
        let scaleZ = TransformFunction.scaleZ(3)
        #expect(scaleZ.description == "scaleZ(3)")
    }
}

// MARK: - Skewing Transformations

@Suite
struct `TransformFunction - Skew` {
    @Test func `skew with single angle renders correctly`() {
        let skew1 = TransformFunction.skew(.deg(10))
        #expect(skew1.description == "skew(10deg)")
    }

    @Test func `skew with two angles renders correctly`() {
        let skew2 = TransformFunction.skew(.deg(10), .deg(5))
        #expect(skew2.description == "skew(10deg, 5deg)")
    }

    @Test(arguments: [
        (Angle.deg(0), "skew(0deg)"),
        (Angle.deg(15), "skew(15deg)"),
        (Angle.deg(30), "skew(30deg)"),
        (Angle.deg(-10), "skew(-10deg)"),
    ])
    func `various skew angles`(
        angle: Angle,
        expected: String
    ) {
        let skew = TransformFunction.skew(angle)
        #expect(skew.description == expected)
    }
}

@Suite
struct `TransformFunction - Skew Axes` {
    @Test func `skewX renders correctly`() {
        let skewX = TransformFunction.skewX(.deg(15))
        #expect(skewX.description == "skewX(15deg)")
    }

    @Test func `skewY renders correctly`() {
        let skewY = TransformFunction.skewY(.deg(20))
        #expect(skewY.description == "skewY(20deg)")
    }

    @Test(arguments: [
        (Angle.deg(0), "skewX(0deg)", "skewY(0deg)"),
        (Angle.deg(10), "skewX(10deg)", "skewY(10deg)"),
        (Angle.deg(-15), "skewX(-15deg)", "skewY(-15deg)"),
    ])
    func `axis skews with various angles`(
        angle: Angle,
        expectedX: String,
        expectedY: String
    ) {
        #expect(TransformFunction.skewX(angle).description == expectedX)
        #expect(TransformFunction.skewY(angle).description == expectedY)
    }
}

// MARK: - Translation Transformations

@Suite
struct `TransformFunction - Translate 2D` {
    @Test func `translate with single axis renders correctly`() {
        let translate1 = TransformFunction.translateX(.px(100))
        #expect(translate1.description == "translateX(100px)")
    }

    @Test func `translate with both axes renders correctly`() {
        let translate2 = TransformFunction.translate(100, 200)
        #expect(translate2.description == "translate(100px, 200px)")
    }

    @Test func `translate with percentages`() {
        let translatePercentage = TransformFunction.translatePercent(50, 100)
        #expect(translatePercentage.description == "translate(50%, 100%)")
    }

    @Test(arguments: [
        (0, 0, "translate(0px, 0px)"),
        (100, 50, "translate(100px, 50px)"),
        (-50, -100, "translate(-50px, -100px)"),
    ])
    func `various 2D translations`(
        x: Int,
        y: Int,
        expected: String
    ) {
        let translate = TransformFunction.translate(x, y)
        #expect(translate.description == expected)
    }
}

@Suite
struct `TransformFunction - Translate 3D` {
    @Test func `3D translate renders correctly`() {
        let translate3d = TransformFunction.translate3d(.px(50), .px(100), .px(50))
        #expect(translate3d.description == "translate3d(50px, 100px, 50px)")
    }

    @Test(arguments: [
        (Length.px(0), Length.px(0), Length.px(0), "translate3d(0px, 0px, 0px)"),
        (Length.em(1), Length.em(2), Length.em(3), "translate3d(1em, 2em, 3em)"),
        (Length.rem(5), Length.rem(10), Length.rem(15), "translate3d(5rem, 10rem, 15rem)"),
    ])
    func `various 3D translations`(
        x: Length,
        y: Length,
        z: Length,
        expected: String
    ) {
        let translate3d = TransformFunction.translate3d(x, y, z)
        #expect(translate3d.description == expected)
    }
}

@Suite
struct `TransformFunction - Translate Axes` {
    @Test func `translateX renders correctly`() {
        let translateX = TransformFunction.translateX(.px(100))
        #expect(translateX.description == "translateX(100px)")
    }

    @Test func `translateY renders correctly`() {
        let translateY = TransformFunction.translateY(.px(200))
        #expect(translateY.description == "translateY(200px)")
    }

    @Test func `translateZ renders correctly`() {
        let translateZ = TransformFunction.translateZ(.px(300))
        #expect(translateZ.description == "translateZ(300px)")
    }

    @Test(arguments: [
        (Length.px(0), "translateX(0px)", "translateY(0px)", "translateZ(0px)"),
        (Length.em(1), "translateX(1em)", "translateY(1em)", "translateZ(1em)"),
        (Length.rem(5), "translateX(5rem)", "translateY(5rem)", "translateZ(5rem)"),
    ])
    func `axis translations with various lengths`(
        length: Length,
        expectedX: String,
        expectedY: String,
        expectedZ: String
    ) {
        #expect(TransformFunction.translateX(length).description == expectedX)
        #expect(TransformFunction.translateY(length).description == expectedY)
        #expect(TransformFunction.translateZ(length).description == expectedZ)
    }

    @Test func `translateX and translateY with percentages`() {
        let translateXPercent = TransformFunction.translateX(.percentage(50))
        #expect(translateXPercent.description == "translateX(50%)")

        let translateYPercent = TransformFunction.translateY(.percentage(75))
        #expect(translateYPercent.description == "translateY(75%)")
    }
}

// MARK: - Convenience Constructors

@Suite
struct `TransformFunction - Convenience Methods` {
    @Test func `uniform scale convenience method`() {
        let uniformScale = TransformFunction.scale(sx: 2)
        #expect(uniformScale.description == "scale(2)")
    }

    @Test func `scale with percentage convenience method`() {
        let uniformScale2 = TransformFunction.scale(20.percent)
        #expect(uniformScale2.description == "scale(20%)")
    }

    @Test func `translate convenience methods`() {
        let pxTranslate = TransformFunction.translate(100, 50)
        #expect(pxTranslate.description == "translate(100px, 50px)")

        let percentTranslate = TransformFunction.translatePercent(25, 75)
        #expect(percentTranslate.description == "translate(25%, 75%)")
    }
}

// MARK: - Protocol Conformance

@Suite
struct `TransformFunction - Hashable Conformance` {
    @Test func `equal scale transforms are equal`() {
        let scale1 = TransformFunction.scale(1.5)
        let scale2 = TransformFunction.scale(1.5)
        #expect(scale1 == scale2)
    }

    @Test func `different scale transforms are not equal`() {
        let scale1 = TransformFunction.scale(1.5)
        let scale3 = TransformFunction.scale(2)
        #expect(scale1 != scale3)
    }

    @Test func `equal translate transforms are equal`() {
        let translate1 = TransformFunction.translate(100, 50)
        let translate2 = TransformFunction.translate(100, 50)
        #expect(translate1 == translate2)
    }

    @Test func `different translate transforms are not equal`() {
        let translate1 = TransformFunction.translate(100, 50)
        let translate3 = TransformFunction.translate(200, 50)
        #expect(translate1 != translate3)
    }

    @Test func `different transform types are not equal`() {
        let scale = TransformFunction.scale(2)
        let rotate = TransformFunction.rotate(.deg(45))
        let translate = TransformFunction.translateX(.px(100))

        #expect(scale != rotate)
        #expect(rotate != translate)
        #expect(translate != scale)
    }

    @Test func `equal rotation transforms are equal`() {
        let rotate1 = TransformFunction.rotate(.deg(45))
        let rotate2 = TransformFunction.rotate(.deg(45))
        #expect(rotate1 == rotate2)
    }
}

// MARK: - Usage in Context

@Suite
struct `TransformFunction - CSS Property Usage` {
    @Test func `single transform in transform property`() {
        let transform = "transform: \(TransformFunction.rotate(.deg(45)))"
        #expect(transform == "transform: rotate(45deg)")
    }

    @Test func `multiple transforms in transform property`() {
        let transform =
            "transform: \(TransformFunction.translate(100, 50)) \(TransformFunction.rotate(.deg(45))) \(TransformFunction.scale(1.5))"
        #expect(transform == "transform: translate(100px, 50px) rotate(45deg) scale(1.5)")
    }

    @Test func `3D transform chain`() {
        let transform =
            "transform: \(TransformFunction.translate3d(.px(50), .px(100), .px(50))) \(TransformFunction.rotateX(.deg(45))) \(TransformFunction.scale3d(sx: 1.5, sy: 1.5, sz: 1.5))"
        #expect(
            transform
                == "transform: translate3d(50px, 100px, 50px) rotateX(45deg) scale3d(1.5, 1.5, 1.5)"
        )
    }
}

// MARK: - Edge Cases

@Suite
struct `TransformFunction - Edge Cases` {
    @Test func `zero scale`() {
        let scale = TransformFunction.scale(0)
        #expect(scale.description == "scale(0)")
    }

    @Test func `negative scale`() {
        let scale = TransformFunction.scale(-1)
        #expect(scale.description == "scale(-1)")
    }

    @Test func `zero rotation`() {
        let rotate = TransformFunction.rotate(.deg(0))
        #expect(rotate.description == "rotate(0deg)")
    }

    @Test func `360 degree rotation`() {
        let rotate = TransformFunction.rotate(.deg(360))
        #expect(rotate.description == "rotate(360deg)")
    }

    @Test func `zero translation`() {
        let translate = TransformFunction.translate(0, 0)
        #expect(translate.description == "translate(0px, 0px)")
    }

    @Test func `negative translation`() {
        let translate = TransformFunction.translate(-100, -50)
        #expect(translate.description == "translate(-100px, -50px)")
    }

    @Test func `very large values`() {
        let translate = TransformFunction.translate(10000, 10000)
        #expect(translate.description == "translate(10000px, 10000px)")

        let scale = TransformFunction.scale(100)
        #expect(scale.description == "scale(100)")

        let rotate = TransformFunction.rotate(.deg(720))
        #expect(rotate.description == "rotate(720deg)")
    }

    @Test func `identity matrix equals specific values`() {
        let identity = TransformFunction.identity
        let explicitIdentity = TransformFunction.matrix(a: 1, b: 0, c: 0, d: 1, tx: 0, ty: 0)
        #expect(identity.description == explicitIdentity.description)
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `TransformFunction - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `translate creation 100K times`() {
            for i in 0..<100_000 {
                _ = TransformFunction.translate(i, i)
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `rotate creation 100K times`() {
            for i in 0..<100_000 {
                _ = TransformFunction.rotate(.deg(Double(i % 360)))
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `scale creation 100K times`() {
            for i in 0..<100_000 {
                _ = TransformFunction.scale(Double(i % 10) / 10.0)
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `transform comparison 100K times`() {
            let transform1 = TransformFunction.rotate(.deg(45))
            for i in 0..<100_000 {
                _ = transform1 == TransformFunction.rotate(.deg(Double(i % 360)))
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `3D transform creation 10K times`() {
            for i in 0..<10_000 {
                _ = TransformFunction.translate3d(
                    Length.px(Double(i)),
                    Length.px(Double(i * 2)),
                    Length.px(Double(i * 3))
                )
            }
        }
    }
}
