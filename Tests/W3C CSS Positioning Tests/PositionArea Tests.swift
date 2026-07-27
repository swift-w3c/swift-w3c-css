// PositionArea Tests.swift
// swift-w3c-css
//
// Tests for CSS PositionArea type

import Testing

@testable import W3C_CSS_Positioning

// MARK: - None Value

@Suite
struct `PositionArea - None` {
    @Test func `none value renders correctly`() {
        #expect(PositionArea.none.description == "none")
    }
}

// MARK: - Single Keyword Values

@Suite
struct `PositionArea - Single Keywords` {
    @Test(arguments: [
        (PositionArea.single(.center), "center"),
        (PositionArea.single(.top), "top"),
        (PositionArea.single(.bottom), "bottom"),
        (PositionArea.single(.left), "left"),
        (PositionArea.single(.right), "right"),
        (PositionArea.single(.spanAll), "span-all"),
        (PositionArea.single(.start), "start"),
        (PositionArea.single(.end), "end"),
        (PositionArea.single(.blockStart), "block-start"),
        (PositionArea.single(.blockEnd), "block-end"),
        (PositionArea.single(.inlineStart), "inline-start"),
        (PositionArea.single(.inlineEnd), "inline-end"),
    ])
    func `single keyword values render correctly`(
        area: PositionArea,
        expected: String
    ) {
        #expect(area.description == expected)
    }
}

// MARK: - Physical Position Pairs

@Suite
struct `PositionArea - Physical Pairs` {
    @Test(arguments: [
        (PositionArea.physical(.top, .left), "top left"),
        (PositionArea.physical(.top, .center), "top center"),
        (PositionArea.physical(.top, .right), "top right"),
        (PositionArea.physical(.bottom, .left), "bottom left"),
        (PositionArea.physical(.bottom, .right), "bottom right"),
        (PositionArea.physical(.center, .center), "center center"),
        (PositionArea.physical(.top, .spanAll), "top span-all"),
        (PositionArea.physical(.spanAll, .left), "span-all left"),
        (PositionArea.physical(.spanTop, .spanLeft), "span-top span-left"),
    ])
    func `physical pairs render correctly`(
        area: PositionArea,
        expected: String
    ) {
        #expect(area.description == expected)
    }
}

@Suite
struct `PositionArea - Physical X/Y Coordinates` {
    @Test(arguments: [
        (PositionArea.physical(.yStart, .xStart), "y-start x-start"),
        (PositionArea.physical(.yEnd, .xEnd), "y-end x-end"),
        (PositionArea.physical(.yStart, .xEnd), "y-start x-end"),
        (PositionArea.physical(.center, .xStart), "center x-start"),
        (PositionArea.physical(.yStart, .center), "y-start center"),
        (PositionArea.physical(.spanYStart, .spanXStart), "span-y-start span-x-start"),
    ])
    func `physical coordinate pairs render correctly`(
        area: PositionArea,
        expected: String
    ) {
        #expect(area.description == expected)
    }
}

@Suite
struct `PositionArea - Physical Self Coordinates` {
    @Test(arguments: [
        (PositionArea.physical(.ySelfStart, .xSelfStart), "y-self-start x-self-start"),
        (PositionArea.physical(.ySelfEnd, .xSelfEnd), "y-self-end x-self-end"),
        (
            PositionArea.physical(.spanYSelfStart, .spanXSelfStart),
            "span-y-self-start span-x-self-start"
        ),
    ])
    func `physical self coordinate pairs render correctly`(
        area: PositionArea,
        expected: String
    ) {
        #expect(area.description == expected)
    }
}

// MARK: - Logical Position Pairs

@Suite
struct `PositionArea - Logical Pairs` {
    @Test(arguments: [
        (PositionArea.logical(.blockStart, .inlineStart), "block-start inline-start"),
        (PositionArea.logical(.blockStart, .inlineEnd), "block-start inline-end"),
        (PositionArea.logical(.blockEnd, .inlineStart), "block-end inline-start"),
        (PositionArea.logical(.blockEnd, .inlineEnd), "block-end inline-end"),
        (PositionArea.logical(.center, .center), "center center"),
        (PositionArea.logical(.blockStart, .spanAll), "block-start span-all"),
        (
            PositionArea.logical(.spanBlockStart, .spanInlineStart),
            "span-block-start span-inline-start"
        ),
    ])
    func `logical pairs render correctly`(
        area: PositionArea,
        expected: String
    ) {
        #expect(area.description == expected)
    }
}

// MARK: - Self-Logical Position Pairs

@Suite
struct `PositionArea - Self-Logical Pairs` {
    @Test(arguments: [
        (
            PositionArea.selfLogical(.selfBlockStart, .selfInlineStart),
            "self-block-start self-inline-start"
        ),
        (
            PositionArea.selfLogical(.selfBlockStart, .selfInlineEnd),
            "self-block-start self-inline-end"
        ),
        (
            PositionArea.selfLogical(.selfBlockEnd, .selfInlineStart),
            "self-block-end self-inline-start"
        ),
        (PositionArea.selfLogical(.selfBlockEnd, .selfInlineEnd), "self-block-end self-inline-end"),
        (PositionArea.selfLogical(.center, .center), "center center"),
        (PositionArea.selfLogical(.selfBlockStart, .spanAll), "self-block-start span-all"),
    ])
    func `self-logical pairs render correctly`(
        area: PositionArea,
        expected: String
    ) {
        #expect(area.description == expected)
    }
}

// MARK: - Start/End Position Pairs

@Suite
struct `PositionArea - StartEnd Pairs` {
    @Test(arguments: [
        (PositionArea.startEnd(.start, .start), "start start"),
        (PositionArea.startEnd(.start, .end), "start end"),
        (PositionArea.startEnd(.end, .start), "end start"),
        (PositionArea.startEnd(.end, .end), "end end"),
        (PositionArea.startEnd(.center, .center), "center center"),
        (PositionArea.startEnd(.start, .spanAll), "start span-all"),
        (PositionArea.startEnd(.spanStart, .spanEnd), "span-start span-end"),
    ])
    func `start-end pairs render correctly`(
        area: PositionArea,
        expected: String
    ) {
        #expect(area.description == expected)
    }
}

// MARK: - Self-Start/End Position Pairs

@Suite
struct `PositionArea - SelfStartEnd Pairs` {
    @Test(arguments: [
        (PositionArea.selfStartEnd(.selfStart, .selfStart), "self-start self-start"),
        (PositionArea.selfStartEnd(.selfStart, .selfEnd), "self-start self-end"),
        (PositionArea.selfStartEnd(.selfEnd, .selfStart), "self-end self-start"),
        (PositionArea.selfStartEnd(.selfEnd, .selfEnd), "self-end self-end"),
        (PositionArea.selfStartEnd(.center, .center), "center center"),
        (PositionArea.selfStartEnd(.selfStart, .spanAll), "self-start span-all"),
    ])
    func `self-start-end pairs render correctly`(
        area: PositionArea,
        expected: String
    ) {
        #expect(area.description == expected)
    }
}

// MARK: - Vertical/Horizontal Convenience Method

@Suite
struct `PositionArea - Vertical and Horizontal` {
    @Test(arguments: [
        (PositionArea.vertical(.top, .left), "top left"),
        (PositionArea.vertical(.top, .right), "top right"),
        (PositionArea.vertical(.bottom, .left), "bottom left"),
        (PositionArea.vertical(.bottom, .right), "bottom right"),
        (PositionArea.vertical(.center, .center), "center center"),
        (PositionArea.vertical(.top, .spanAll), "top span-all"),
        (PositionArea.vertical(.spanTop, .spanLeft), "span-top span-left"),
        (PositionArea.vertical(.yStart, .xStart), "y-start x-start"),
        (PositionArea.vertical(.yEnd, .xEnd), "y-end x-end"),
    ])
    func `vertical and horizontal convenience method renders correctly`(
        area: PositionArea,
        expected: String
    ) {
        #expect(area.description == expected)
    }
}

// MARK: - Enum Raw Values

@Suite
struct `PositionArea - Physical Enum Raw Values` {
    @Test(arguments: [
        (PositionArea.Physical.top, "top"),
        (PositionArea.Physical.center, "center"),
        (PositionArea.Physical.bottom, "bottom"),
        (PositionArea.Physical.left, "left"),
        (PositionArea.Physical.right, "right"),
        (PositionArea.Physical.spanLeft, "span-left"),
        (PositionArea.Physical.spanRight, "span-right"),
        (PositionArea.Physical.spanTop, "span-top"),
        (PositionArea.Physical.spanBottom, "span-bottom"),
        (PositionArea.Physical.spanAll, "span-all"),
        (PositionArea.Physical.xStart, "x-start"),
        (PositionArea.Physical.xEnd, "x-end"),
        (PositionArea.Physical.yStart, "y-start"),
        (PositionArea.Physical.yEnd, "y-end"),
        (PositionArea.Physical.spanXStart, "span-x-start"),
        (PositionArea.Physical.spanXEnd, "span-x-end"),
        (PositionArea.Physical.spanYStart, "span-y-start"),
        (PositionArea.Physical.spanYEnd, "span-y-end"),
        (PositionArea.Physical.xSelfStart, "x-self-start"),
        (PositionArea.Physical.xSelfEnd, "x-self-end"),
        (PositionArea.Physical.ySelfStart, "y-self-start"),
        (PositionArea.Physical.ySelfEnd, "y-self-end"),
        (PositionArea.Physical.spanXSelfStart, "span-x-self-start"),
        (PositionArea.Physical.spanXSelfEnd, "span-x-self-end"),
        (PositionArea.Physical.spanYSelfStart, "span-y-self-start"),
        (PositionArea.Physical.spanYSelfEnd, "span-y-self-end"),
    ])
    func `physical enum values have correct raw values`(
        value: PositionArea.Physical,
        expected: String
    ) {
        #expect(value.rawValue == expected)
    }
}

@Suite
struct `PositionArea - Logical Enum Raw Values` {
    @Test(arguments: [
        (PositionArea.Logical.blockStart, "block-start"),
        (PositionArea.Logical.center, "center"),
        (PositionArea.Logical.blockEnd, "block-end"),
        (PositionArea.Logical.spanBlockStart, "span-block-start"),
        (PositionArea.Logical.spanBlockEnd, "span-block-end"),
        (PositionArea.Logical.inlineStart, "inline-start"),
        (PositionArea.Logical.inlineEnd, "inline-end"),
        (PositionArea.Logical.spanInlineStart, "span-inline-start"),
        (PositionArea.Logical.spanInlineEnd, "span-inline-end"),
        (PositionArea.Logical.spanAll, "span-all"),
    ])
    func `logical enum values have correct raw values`(
        value: PositionArea.Logical,
        expected: String
    ) {
        #expect(value.rawValue == expected)
    }
}

@Suite
struct `PositionArea - SelfLogical Enum Raw Values` {
    @Test(arguments: [
        (PositionArea.SelfLogical.selfBlockStart, "self-block-start"),
        (PositionArea.SelfLogical.center, "center"),
        (PositionArea.SelfLogical.selfBlockEnd, "self-block-end"),
        (PositionArea.SelfLogical.spanSelfBlockStart, "span-self-block-start"),
        (PositionArea.SelfLogical.spanSelfBlockEnd, "span-self-block-end"),
        (PositionArea.SelfLogical.selfInlineStart, "self-inline-start"),
        (PositionArea.SelfLogical.selfInlineEnd, "self-inline-end"),
        (PositionArea.SelfLogical.spanSelfInlineStart, "span-self-inline-start"),
        (PositionArea.SelfLogical.spanSelfInlineEnd, "span-self-inline-end"),
        (PositionArea.SelfLogical.spanAll, "span-all"),
    ])
    func `self-logical enum values have correct raw values`(
        value: PositionArea.SelfLogical,
        expected: String
    ) {
        #expect(value.rawValue == expected)
    }
}

@Suite
struct `PositionArea - StartEnd Enum Raw Values` {
    @Test(arguments: [
        (PositionArea.StartEnd.start, "start"),
        (PositionArea.StartEnd.center, "center"),
        (PositionArea.StartEnd.end, "end"),
        (PositionArea.StartEnd.spanStart, "span-start"),
        (PositionArea.StartEnd.spanEnd, "span-end"),
        (PositionArea.StartEnd.spanAll, "span-all"),
    ])
    func `start-end enum values have correct raw values`(
        value: PositionArea.StartEnd,
        expected: String
    ) {
        #expect(value.rawValue == expected)
    }
}

@Suite
struct `PositionArea - SelfStartEnd Enum Raw Values` {
    @Test(arguments: [
        (PositionArea.SelfStartEnd.selfStart, "self-start"),
        (PositionArea.SelfStartEnd.center, "center"),
        (PositionArea.SelfStartEnd.selfEnd, "self-end"),
        (PositionArea.SelfStartEnd.spanSelfStart, "span-self-start"),
        (PositionArea.SelfStartEnd.spanSelfEnd, "span-self-end"),
        (PositionArea.SelfStartEnd.spanAll, "span-all"),
    ])
    func `self-start-end enum values have correct raw values`(
        value: PositionArea.SelfStartEnd,
        expected: String
    ) {
        #expect(value.rawValue == expected)
    }
}

@Suite
struct `PositionArea - AreaKeyword Enum Raw Values` {
    @Test(arguments: [
        (PositionArea.AreaKeyword.top, "top"),
        (PositionArea.AreaKeyword.bottom, "bottom"),
        (PositionArea.AreaKeyword.left, "left"),
        (PositionArea.AreaKeyword.right, "right"),
        (PositionArea.AreaKeyword.blockStart, "block-start"),
        (PositionArea.AreaKeyword.blockEnd, "block-end"),
        (PositionArea.AreaKeyword.inlineStart, "inline-start"),
        (PositionArea.AreaKeyword.inlineEnd, "inline-end"),
        (PositionArea.AreaKeyword.selfBlockStart, "self-block-start"),
        (PositionArea.AreaKeyword.selfBlockEnd, "self-block-end"),
        (PositionArea.AreaKeyword.selfInlineStart, "self-inline-start"),
        (PositionArea.AreaKeyword.selfInlineEnd, "self-inline-end"),
        (PositionArea.AreaKeyword.start, "start"),
        (PositionArea.AreaKeyword.end, "end"),
        (PositionArea.AreaKeyword.selfStart, "self-start"),
        (PositionArea.AreaKeyword.selfEnd, "self-end"),
        (PositionArea.AreaKeyword.center, "center"),
        (PositionArea.AreaKeyword.spanAll, "span-all"),
    ])
    func `area keyword enum values have correct raw values`(
        value: PositionArea.AreaKeyword,
        expected: String
    ) {
        #expect(value.rawValue == expected)
    }
}

// MARK: - Protocol Conformance

@Suite
struct `PositionArea - Hashable Conformance` {
    @Test func `equal position areas are equal`() {
        #expect(PositionArea.single(.center) == PositionArea.single(.center))
        #expect(PositionArea.physical(.top, .left) == PositionArea.physical(.top, .left))
        #expect(PositionArea.none == PositionArea.none)
    }

    @Test func `equal physical position areas are equal`() {
        #expect(PositionArea.physical(.top, .left) == PositionArea.physical(.top, .left))
        #expect(PositionArea.physical(.bottom, .right) == PositionArea.physical(.bottom, .right))
    }

    @Test func `different position areas are not equal`() {
        #expect(PositionArea.single(.top) != PositionArea.single(.bottom))
        #expect(PositionArea.physical(.top, .left) != PositionArea.physical(.top, .right))
        #expect(PositionArea.none != PositionArea.single(.center))
    }
}

// MARK: - Usage in Context

@Suite
struct `PositionArea - CSS Property Usage` {
    @Test func `position area renders correctly in position-area property`() {
        let positionArea = "position-area: \(PositionArea.single(.center))"
        #expect(positionArea == "position-area: center")
    }

    @Test func `position area renders correctly with physical pair`() {
        let positionAreaTopRight = "position-area: \(PositionArea.physical(.top, .right))"
        #expect(positionAreaTopRight == "position-area: top right")
    }

    @Test func `position area renders correctly with logical value`() {
        let positionAreaLogical =
            "position-area: \(PositionArea.logical(.blockStart, .inlineStart))"
        #expect(positionAreaLogical == "position-area: block-start inline-start")
    }

    @Test func `position area renders correctly with vertical and horizontal`() {
        let positionAreaVertical = "position-area: \(PositionArea.vertical(.top, .left))"
        #expect(positionAreaVertical == "position-area: top left")
    }
}

// MARK: - Edge Cases

@Suite
struct `PositionArea - Edge Cases` {
    @Test func `span values render correctly`() {
        #expect(PositionArea.single(.spanAll).description == "span-all")
        #expect(PositionArea.physical(.spanTop, .spanAll).description == "span-top span-all")
        #expect(
            PositionArea.physical(.spanYStart, .spanXStart).description
                == "span-y-start span-x-start"
        )
    }

    @Test func `self values render correctly`() {
        #expect(PositionArea.single(.selfStart).description == "self-start")
        #expect(PositionArea.single(.selfEnd).description == "self-end")
        #expect(
            PositionArea.selfLogical(.selfBlockStart, .selfInlineStart).description
                == "self-block-start self-inline-start"
        )
        #expect(
            PositionArea.physical(.xSelfStart, .ySelfStart).description
                == "x-self-start y-self-start"
        )
    }

    @Test func `mixed coordinate pairs`() {
        #expect(PositionArea.physical(.xStart, .yEnd).description == "x-start y-end")
        #expect(PositionArea.physical(.center, .spanYStart).description == "center span-y-start")
    }

    @Test func `center can appear in different contexts`() {
        #expect(PositionArea.single(.center).description == "center")
        #expect(PositionArea.physical(.center, .center).description == "center center")
        #expect(PositionArea.logical(.center, .center).description == "center center")
        #expect(PositionArea.selfLogical(.center, .center).description == "center center")
        #expect(PositionArea.startEnd(.center, .center).description == "center center")
        #expect(PositionArea.selfStartEnd(.center, .center).description == "center center")
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `PositionArea - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `position area physical creation 100K times`() {
            for _ in 0..<100_000 {
                _ = PositionArea.physical(.center, .center)
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `position area logical creation 100K times`() {
            for _ in 0..<100_000 {
                _ = PositionArea.logical(.blockStart, .inlineStart)
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `position area single keyword creation 100K times`() {
            for _ in 0..<100_000 {
                _ = PositionArea.single(.center)
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `position area comparison 100K times`() {
            let area1 = PositionArea.single(.center)
            for _ in 0..<100_000 {
                _ = PositionArea.physical(.top, .left) == area1
            }
        }
    }
}
