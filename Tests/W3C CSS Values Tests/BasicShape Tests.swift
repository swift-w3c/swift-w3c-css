// BasicShape Tests.swift
// swift-w3c-css
//
// Tests for CSS BasicShape type

import Testing

@testable import W3C_CSS_Values

// MARK: - Inset Shape

@Suite
struct `BasicShape - Inset` {
    @Test func `inset without border radius renders correctly`() {
        let inset = BasicShape.inset(
            top: .px(20),
            right: .px(50),
            bottom: .px(10),
            left: .px(30),
            borderRadius: nil
        )
        #expect(inset.description == "inset(20px 50px 10px 30px)")
    }

    @Test func `inset with border radius renders correctly`() {
        let insetWithRadius = BasicShape.inset(
            top: .px(20),
            right: .px(50),
            bottom: .px(10),
            left: .px(30),
            borderRadius: "10px"
        )
        #expect(insetWithRadius.description == "inset(20px 50px 10px 30px round 10px)")
    }

    @Test func `inset with percentages renders correctly`() {
        let insetWithPercentages = BasicShape.inset(
            top: .percentage(10),
            right: .percentage(20),
            bottom: .percentage(10),
            left: .percentage(20),
            borderRadius: nil
        )
        #expect(insetWithPercentages.description == "inset(10% 20% 10% 20%)")
    }
}

// MARK: - XYWH Shape

@Suite
struct `BasicShape - XYWH` {
    @Test func `xywh without border radius renders correctly`() {
        let xywh = BasicShape.xywh(
            x: .px(10),
            y: .px(20),
            width: .px(200),
            height: .px(100),
            borderRadius: nil
        )
        #expect(xywh.description == "xywh(10px 20px 200px 100px)")
    }

    @Test func `xywh with border radius renders correctly`() {
        let xywhWithRadius = BasicShape.xywh(
            x: .px(10),
            y: .px(20),
            width: .px(200),
            height: .px(100),
            borderRadius: "5px"
        )
        #expect(xywhWithRadius.description == "xywh(10px 20px 200px 100px round 5px)")
    }
}

// MARK: - Rect Shape

@Suite
struct `BasicShape - Rect` {
    @Test func `rect without border radius renders correctly`() {
        let rect = BasicShape.rect(
            top: .px(10),
            right: .px(210),
            bottom: .px(110),
            left: .px(20),
            borderRadius: nil
        )
        #expect(rect.description == "rect(10px 210px 110px 20px)")
    }

    @Test func `rect with border radius renders correctly`() {
        let rectWithRadius = BasicShape.rect(
            top: .px(10),
            right: .px(210),
            bottom: .px(110),
            left: .px(20),
            borderRadius: "8px"
        )
        #expect(rectWithRadius.description == "rect(10px 210px 110px 20px round 8px)")
    }
}

// MARK: - Circle Shape

@Suite
struct `BasicShape - Circle` {
    @Test(arguments: [
        (BasicShape.ShapeRadius.length(.px(50)), Position.center, "circle(50px at center)"),
        (.percentage(50), .topLeft, "circle(50% at top left)"),
        (.closestSide, .bottom, "circle(closest-side at bottom)"),
    ])
    func `circle with radius and position renders correctly`(
        radius: BasicShape.ShapeRadius,
        position: Position,
        expected: String
    ) {
        let circle = BasicShape.circle(radius: radius, at: position)
        #expect(circle.description == expected)
    }

    @Test func `circle with no position renders correctly`() {
        let circleNoPosition = BasicShape.circle(radius: .length(.px(50)), at: nil)
        #expect(circleNoPosition.description == "circle(50px)")
    }

    @Test func `circle with no radius renders correctly`() {
        let circleNoRadius = BasicShape.circle(radius: nil, at: .center)
        #expect(circleNoRadius.description == "circle( at center)")
    }

    @Test func `empty circle renders correctly`() {
        let emptyCircle = BasicShape.circle(radius: nil, at: nil)
        #expect(emptyCircle.description == "circle()")
    }
}

// MARK: - Ellipse Shape

@Suite
struct `BasicShape - Ellipse` {
    @Test func `ellipse with radii and position renders correctly`() {
        let ellipse = BasicShape.ellipse(
            radiusX: .length(.px(100)),
            radiusY: .length(.px(50)),
            at: .center
        )
        #expect(ellipse.description == "ellipse(100px 50px at center)")
    }

    @Test func `ellipse with percentage radii renders correctly`() {
        let ellipsePercentRadius = BasicShape.ellipse(
            radiusX: .percentage(50),
            radiusY: .percentage(25),
            at: .topLeft
        )
        #expect(ellipsePercentRadius.description == "ellipse(50% 25% at top left)")
    }

    @Test func `ellipse with keyword radii renders correctly`() {
        let ellipseWithKeywordRadius = BasicShape.ellipse(
            radiusX: .closestSide,
            radiusY: .farthestSide,
            at: .bottom
        )
        #expect(
            ellipseWithKeywordRadius.description == "ellipse(closest-side farthest-side at bottom)"
        )
    }

    @Test func `ellipse with no position renders correctly`() {
        let ellipseNoPosition = BasicShape.ellipse(
            radiusX: .length(.px(100)),
            radiusY: .length(.px(50)),
            at: nil
        )
        #expect(ellipseNoPosition.description == "ellipse(100px 50px)")
    }

    @Test func `ellipse with no radii renders correctly`() {
        let ellipseNoRadii = BasicShape.ellipse(radiusX: nil, radiusY: nil, at: .center)
        #expect(ellipseNoRadii.description == "ellipse( at center)")
    }

    @Test func `empty ellipse renders correctly`() {
        let emptyEllipse = BasicShape.ellipse(radiusX: nil, radiusY: nil, at: nil)
        #expect(emptyEllipse.description == "ellipse()")
    }
}

// MARK: - Polygon Shape

@Suite
struct `BasicShape - Polygon` {
    @Test func `polygon with points renders correctly`() {
        let points = [
            BasicShape.PolygonPoint(.percentage(50), .percentage(0)),
            BasicShape.PolygonPoint(.percentage(100), .percentage(50)),
            BasicShape.PolygonPoint(.percentage(50), .percentage(100)),
            BasicShape.PolygonPoint(.percentage(0), .percentage(50)),
        ]

        let polygon = BasicShape.polygon(points: points)
        #expect(polygon.description == "polygon(50% 0%, 100% 50%, 50% 100%, 0% 50%)")
    }

    @Test func `polygon with fill rule renders correctly`() {
        let points = [
            BasicShape.PolygonPoint(.percentage(50), .percentage(0)),
            BasicShape.PolygonPoint(.percentage(100), .percentage(50)),
            BasicShape.PolygonPoint(.percentage(50), .percentage(100)),
            BasicShape.PolygonPoint(.percentage(0), .percentage(50)),
        ]

        let polygonWithFillRule = BasicShape.polygon(fillRule: .evenodd, points: points)
        #expect(
            polygonWithFillRule.description
                == "polygon(evenodd, 50% 0%, 100% 50%, 50% 100%, 0% 50%)"
        )
    }

    @Test func `polygon factory method with tuples works correctly`() {
        let tuplePoints: [(LengthPercentage, LengthPercentage)] = [
            (.percentage(50), .percentage(0)),
            (.percentage(100), .percentage(50)),
            (.percentage(50), .percentage(100)),
            (.percentage(0), .percentage(50)),
        ]

        let polygon = BasicShape.polygon(points: tuplePoints)
        #expect(polygon.description == "polygon(50% 0%, 100% 50%, 50% 100%, 0% 50%)")
    }

    @Test func `polygon factory method with tuples and fill rule works correctly`() {
        let tuplePoints: [(LengthPercentage, LengthPercentage)] = [
            (.percentage(50), .percentage(0)),
            (.percentage(100), .percentage(50)),
            (.percentage(50), .percentage(100)),
            (.percentage(0), .percentage(50)),
        ]

        let polygonWithFillRule = BasicShape.polygon(fillRule: .evenodd, points: tuplePoints)
        #expect(
            polygonWithFillRule.description
                == "polygon(evenodd, 50% 0%, 100% 50%, 50% 100%, 0% 50%)"
        )
    }
}

// MARK: - Path Shape

@Suite
struct `BasicShape - Path` {
    @Test func `path without fill rule renders correctly`() {
        let path = BasicShape.path(pathData: "M 0,0 H 100 V 100 H 0 Z")
        #expect(path.description == "path(\"M 0,0 H 100 V 100 H 0 Z\")")
    }

    @Test func `path with fill rule renders correctly`() {
        let pathWithFillRule = BasicShape.path(
            fillRule: .evenodd,
            pathData: "M 0,0 H 100 V 100 H 0 Z"
        )
        #expect(pathWithFillRule.description == "path(evenodd, \"M 0,0 H 100 V 100 H 0 Z\")")
    }
}

// MARK: - ShapeRadius

@Suite
struct `BasicShape - ShapeRadius` {
    @Test(arguments: [
        (BasicShape.ShapeRadius.length(.px(50)), "50px"),
        (.percentage(75), "75%"),
        (.closestSide, "closest-side"),
        (.farthestSide, "farthest-side"),
    ])
    func `shape radius renders correctly`(radius: BasicShape.ShapeRadius, expected: String) {
        #expect(radius.description == expected)
    }
}

// MARK: - Protocol Conformance

@Suite
struct `BasicShape - FillRule Hashable` {
    @Test func `equal fill rules are equal`() {
        let nonzero1 = BasicShape.FillRule.nonzero
        let nonzero2 = BasicShape.FillRule.nonzero
        #expect(nonzero1 == nonzero2)
    }

    @Test func `different fill rules are not equal`() {
        let nonzero = BasicShape.FillRule.nonzero
        let evenodd = BasicShape.FillRule.evenodd
        #expect(nonzero != evenodd)
    }
}

@Suite
struct `BasicShape - PolygonPoint Hashable` {
    @Test func `equal polygon points are equal`() {
        let point1 = BasicShape.PolygonPoint(.percentage(50), .percentage(50))
        let point2 = BasicShape.PolygonPoint(.percentage(50), .percentage(50))
        #expect(point1 == point2)
    }

    @Test func `different polygon points are not equal`() {
        let point1 = BasicShape.PolygonPoint(.percentage(50), .percentage(50))
        let point2 = BasicShape.PolygonPoint(.percentage(25), .percentage(75))
        #expect(point1 != point2)
    }

    @Test func `polygon points with different types are not equal`() {
        let point1 = BasicShape.PolygonPoint(.percentage(50), .percentage(50))
        let point2 = BasicShape.PolygonPoint(.px(50), .percentage(50))
        #expect(point1 != point2)
    }
}

// MARK: - Edge Cases

@Suite
struct `BasicShape - Edge Cases` {
    @Test func `polygon with single point`() {
        let points = [BasicShape.PolygonPoint(.percentage(50), .percentage(50))]
        let polygon = BasicShape.polygon(points: points)
        #expect(polygon.description == "polygon(50% 50%)")
    }

    @Test func `circle with farthest-side radius`() {
        let circle = BasicShape.circle(radius: .farthestSide, at: .center)
        #expect(circle.description == "circle(farthest-side at center)")
    }

    @Test func `path with complex SVG data`() {
        let complexPath = "M10 10 L90 10 L90 90 L10 90 Z M20 20 L80 20 L80 80 L20 80 Z"
        let path = BasicShape.path(pathData: complexPath)
        #expect(path.description == "path(\"\(complexPath)\")")
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `BasicShape - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `circle creation 100K times`() {
            for i in 0..<100_000 {
                _ = BasicShape.circle(
                    radius: .length(.px(Double(i % 100))),
                    at: .center
                )
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `polygon creation 100K times`() {
            let points = [
                BasicShape.PolygonPoint(.percentage(50), .percentage(0)),
                BasicShape.PolygonPoint(.percentage(100), .percentage(50)),
                BasicShape.PolygonPoint(.percentage(0), .percentage(50)),
            ]
            for _ in 0..<100_000 {
                _ = BasicShape.polygon(points: points)
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `shape description generation 100K times`() {
            let shape = BasicShape.circle(radius: .length(.px(50)), at: .center)
            for _ in 0..<100_000 {
                _ = shape.description
            }
        }
    }
}
