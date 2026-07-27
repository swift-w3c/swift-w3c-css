// Frequency Tests.swift
// swift-w3c-css
//
// Tests for CSS Frequency type

import Testing

@testable import W3C_CSS_Values

// MARK: - Basic Functionality

@Suite
struct `Frequency - Hertz Values` {
    @Test(arguments: [
        (440.0, "440Hz"),
        (0.0, "0Hz"),
        (1000.0, "1000Hz"),
        (123.5, "123.5Hz"),
        (123.0, "123Hz"),
    ])
    func `hertz frequency values render correctly`(
        value: Number,
        expected: String
    ) {
        let frequency = Frequency.hz(value)
        #expect(frequency.description == expected)
    }
}

@Suite
struct `Frequency - Kilohertz Values` {
    @Test(arguments: [
        (2.5, "2.5kHz"),
        (0.0, "0kHz"),
        (5.0, "5kHz"),
        (1.75, "1.75kHz"),
        (3.0, "3kHz"),
    ])
    func `kilohertz frequency values render correctly`(
        value: Number,
        expected: String
    ) {
        let frequency = Frequency.khz(value)
        #expect(frequency.description == expected)
    }
}

// MARK: - Integer Constructor Convenience

@Suite
struct `Frequency - Integer Constructors` {
    @Test func `integer hz constructor works correctly`() {
        let intHz = Frequency.hz(440)
        let doubleHz = Frequency.hz(440.0)
        #expect(intHz == doubleHz)
        #expect(intHz.description == doubleHz.description)
    }

    @Test func `integer khz constructor works correctly`() {
        let intKhz = Frequency.khz(5)
        let doubleKhz = Frequency.khz(5.0)
        #expect(intKhz == doubleKhz)
        #expect(intKhz.description == doubleKhz.description)
    }
}

// MARK: - Protocol Conformance

@Suite
struct `Frequency - Hashable Conformance` {
    @Test func `equal values are equal`() {
        let freq1 = Frequency.hz(440)
        let freq2 = Frequency.hz(440)
        #expect(freq1 == freq2)
    }

    @Test func `different values are not equal`() {
        let freq1 = Frequency.hz(440)
        let freq3 = Frequency.hz(880)
        #expect(freq1 != freq3)
    }

    @Test func `different units are not equal even if equivalent`() {
        let hzFreq = Frequency.hz(1000)
        let khzFreq = Frequency.khz(1)
        #expect(hzFreq != khzFreq)
    }
}

// MARK: - Usage in Context

@Suite
struct `Frequency - CSS Property Usage` {
    @Test func `frequency renders correctly in audio properties`() {
        let pitch = "pitch: \(Frequency.hz(440))"
        #expect(pitch == "pitch: 440Hz")
    }

    @Test func `kilohertz frequency renders correctly`() {
        let freq = "frequency: \(Frequency.khz(2.5))"
        #expect(freq == "frequency: 2.5kHz")
    }

    @Test func `frequency renders correctly in media queries`() {
        let media = "@media (min-frequency: \(Frequency.hz(500)))"
        #expect(media == "@media (min-frequency: 500Hz)")
    }
}

// MARK: - Edge Cases

@Suite
struct `Frequency - Edge Cases` {
    @Test func `zero frequency renders correctly`() {
        #expect(Frequency.hz(0).description == "0Hz")
        #expect(Frequency.khz(0).description == "0kHz")
    }

    @Test func `very small frequencies preserve precision`() {
        #expect(Frequency.hz(0.001).description == "0.001Hz")
        #expect(Frequency.khz(0.0001).description == "0.0001kHz")
    }

    @Test func `very large frequencies render correctly`() {
        #expect(Frequency.hz(999999).description == "999999Hz")
        #expect(Frequency.khz(100).description == "100kHz")
    }

    @Test func `whole number decimals render without fractional part`() {
        #expect(Frequency.hz(440.0).description == "440Hz")
        #expect(Frequency.khz(5.0).description == "5kHz")
    }

    @Test func `common audio frequencies render correctly`() {
        #expect(Frequency.hz(20).description == "20Hz")
        #expect(Frequency.hz(440).description == "440Hz")
        #expect(Frequency.hz(880).description == "880Hz")
        #expect(Frequency.khz(20).description == "20kHz")
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `Frequency - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `frequency creation 100K times`() {
            for i in 0..<100_000 {
                _ = Frequency.hz(Number(i))
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `frequency comparison 100K times`() {
            let freq1 = Frequency.hz(440)
            for i in 0..<100_000 {
                _ = Frequency.hz(Number(i)) == freq1
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `frequency unit variations 100K times`() {
            for i in 0..<100_000 {
                let d = Number(i)
                _ = Frequency.hz(d)
                _ = Frequency.khz(d / 1000)
            }
        }
    }
}
