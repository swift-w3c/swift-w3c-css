// Resolution Tests.swift
// swift-w3c-css
//
// Tests for CSS Resolution type

import Testing

@testable import W3C_CSS_Values

// MARK: - Basic Functionality

@Suite
struct `Resolution - Unit Creation` {
    @Test(arguments: [
        (300.0, Resolution.Unit.dpi, "300dpi"),
        (120.0, .dpcm, "120dpcm"),
        (2.0, .dppx, "2dppx"),
        (3.0, .x, "3x"),
    ])
    func `resolution values render correctly`(
        value: Double,
        unit: Resolution.Unit,
        expected: String
    ) throws {
        let resolution = try Resolution(value, unit: unit)
        #expect(resolution.description == expected)
        #expect(resolution.value == value)
        #expect(resolution.unit == unit)
    }
}

@Suite
struct `Resolution - Factory Methods` {
    @Test func `dpi factory method creates correct resolution`() throws {
        let dpi = try Resolution.dpi(300)
        #expect(dpi.description == "300dpi")
        #expect(dpi.value == 300)
        #expect(dpi.unit == .dpi)
    }

    @Test func `dpcm factory method creates correct resolution`() throws {
        let dpcm = try Resolution.dpcm(120)
        #expect(dpcm.description == "120dpcm")
        #expect(dpcm.value == 120)
        #expect(dpcm.unit == .dpcm)
    }

    @Test func `dppx factory method creates correct resolution`() throws {
        let dppx = try Resolution.dppx(2)
        #expect(dppx.description == "2dppx")
        #expect(dppx.value == 2)
        #expect(dppx.unit == .dppx)
    }

    @Test func `x factory method creates correct resolution`() throws {
        let x = try Resolution.x(3)
        #expect(x.description == "3x")
        #expect(x.value == 3)
        #expect(x.unit == .x)
    }
}

@Suite
struct `Resolution - Fractional Values` {
    @Test(arguments: [
        (72.5, Resolution.Unit.dpi, "72.5dpi"),
        (28.452, .dpcm, "28.452dpcm"),
        (1.5, .dppx, "1.5dppx"),
    ])
    func `fractional resolution values render correctly`(
        value: Double,
        unit: Resolution.Unit,
        expected: String
    ) throws {
        let resolution = try Resolution(value, unit: unit)
        #expect(resolution.description == expected)
    }
}

// MARK: - Standard Resolution Constants

@Suite
struct `Resolution - Predefined Constants` {
    @Test func `standard resolution is 96 dpi`() {
        #expect(Resolution.standard.value == 96)
        #expect(Resolution.standard.unit == .dpi)
        #expect(Resolution.standard.description == "96dpi")
    }

    @Test func `retina resolution is 192 dpi`() {
        #expect(Resolution.retina.value == 192)
        #expect(Resolution.retina.unit == .dpi)
        #expect(Resolution.retina.description == "192dpi")
    }

    @Test func `print resolution is 300 dpi`() {
        #expect(Resolution.print.value == 300)
        #expect(Resolution.print.unit == .dpi)
        #expect(Resolution.print.description == "300dpi")
    }
}

// MARK: - Unit Conversion

@Suite
struct `Resolution - DPI Conversions` {
    @Test func `dpi to dpcm conversion`() throws {
        let dpi = try Resolution.dpi(96)
        let toDpcm = dpi.converted(to: .dpcm)

        #expect(toDpcm.unit == .dpcm)
        #expect(toDpcm.value.rounded() == 38)  // 96/2.54 ≈ 37.8
    }

    @Test func `dpi to dppx conversion`() throws {
        let dpi = try Resolution.dpi(96)
        let toDppx = dpi.converted(to: .dppx)

        #expect(toDppx.unit == .dppx)
        #expect(toDppx.value == 1)  // 96/96 = 1
    }

    @Test func `dpi to x conversion`() throws {
        let dpi = try Resolution.dpi(96)
        let toX = dpi.converted(to: .x)

        #expect(toX.unit == .x)
        #expect(toX.value == 1)  // 96/96 = 1
    }
}

@Suite
struct `Resolution - Other Unit Conversions` {
    @Test func `dppx to dpi conversion`() throws {
        let dppx = try Resolution.dppx(2)
        let toDpi = dppx.converted(to: .dpi)

        #expect(toDpi.unit == .dpi)
        #expect(toDpi.value == 192)  // 2*96 = 192
    }

    @Test func `x to dpcm conversion`() throws {
        let x = try Resolution.x(3)
        let xToDpcm = x.converted(to: .dpcm)

        #expect(xToDpcm.unit == .dpcm)
        #expect(xToDpcm.value.rounded() == 113)  // 3*96/2.54 ≈ 113.4
    }
}

@Suite
struct `Resolution - Same Unit Conversion` {
    @Test func `converting to same unit returns same instance`() throws {
        let dpi = try Resolution.dpi(300)
        let toDpi = dpi.converted(to: .dpi)

        #expect(toDpi == dpi)
        #expect(toDpi.value == 300)
        #expect(toDpi.unit == .dpi)
    }
}

// MARK: - Protocol Conformance

@Suite
struct `Resolution - Unit Hashable` {
    @Test func `resolution units conform to hashable`() {
        #expect(Resolution.Unit.dpi == Resolution.Unit.dpi)
        #expect(Resolution.Unit.dpi != Resolution.Unit.dpcm)
        #expect(Resolution.Unit.dppx == Resolution.Unit.dppx)
        #expect(Resolution.Unit.x == Resolution.Unit.x)
        #expect(Resolution.Unit.dppx != Resolution.Unit.x)
    }
}

// MARK: - Usage in Context

@Suite
struct `Resolution - CSS Property Usage` {
    @Test func `resolution renders correctly in media query`() throws {
        let media = try "@media (min-resolution: \(Resolution.dpi(300)))"
        #expect(media == "@media (min-resolution: 300dpi)")
    }

    @Test func `dppx resolution renders correctly in media query`() throws {
        let media = try "@media (min-resolution: \(Resolution.dppx(2)))"
        #expect(media == "@media (min-resolution: 2dppx)")
    }

    @Test func `x resolution renders correctly in media query`() throws {
        let media = try "@media (min-resolution: \(Resolution.x(2)))"
        #expect(media == "@media (min-resolution: 2x)")
    }

    @Test func `predefined resolution renders correctly`() {
        let media = "@media (min-resolution: \(Resolution.retina))"
        #expect(media == "@media (min-resolution: 192dpi)")
    }
}

// MARK: - Edge Cases

@Suite
struct `Resolution - Edge Cases` {
    @Test func `zero resolution renders correctly`() throws {
        #expect(try Resolution.dpi(0).description == "0dpi")
        #expect(try Resolution.dpcm(0).description == "0dpcm")
        #expect(try Resolution.dppx(0).description == "0dppx")
    }

    @Test func `very small resolutions preserve precision`() throws {
        #expect(try Resolution.dpi(0.001).description == "0.001dpi")
        #expect(try Resolution.dppx(0.5).description == "0.5dppx")
    }

    @Test func `very large resolutions render correctly`() throws {
        #expect(try Resolution.dpi(999999).description == "999999dpi")
        #expect(try Resolution.dpcm(10000).description == "10000dpcm")
    }

    @Test func `whole number decimals render without fractional part`() throws {
        #expect(try Resolution.dpi(96.0).description == "96dpi")
        #expect(try Resolution.dppx(2.0).description == "2dppx")
    }

    @Test func `common display resolutions render correctly`() throws {
        #expect(try Resolution.dpi(72).description == "72dpi")
        #expect(try Resolution.dpi(96).description == "96dpi")
        #expect(try Resolution.dpi(144).description == "144dpi")
        #expect(try Resolution.dppx(1).description == "1dppx")
        #expect(try Resolution.dppx(2).description == "2dppx")
        #expect(try Resolution.dppx(3).description == "3dppx")
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `Resolution - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `resolution creation 100K times`() throws {
            for i in 0..<100_000 {
                _ = try Resolution.dpi(Double(i))
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `resolution comparison 100K times`() throws {
            let res1 = Resolution.standard
            for i in 0..<100_000 {
                _ = try Resolution.dpi(Double(i)) == res1
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `resolution unit conversion 100K times`() throws {
            for i in 0..<100_000 {
                let res = try Resolution.dpi(Double(i))
                _ = res.converted(to: .dppx)
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `resolution unit variations 100K times`() throws {
            for i in 0..<100_000 {
                let d = Double(i)
                _ = try Resolution.dpi(d)
                _ = try Resolution.dpcm(d)
                _ = try Resolution.dppx(d)
                _ = try Resolution.x(d)
            }
        }
    }
}
