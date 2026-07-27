// FrequencyPercentage Tests.swift
// swift-w3c-css
//
// Tests for CSS FrequencyPercentage type

import Testing

@testable import W3C_CSS_Values

// MARK: - Basic Functionality

@Suite
struct `FrequencyPercentage - Frequency Values` {
    @Test(arguments: [
        (440, "Hz", "440Hz"),
        (2.5, "kHz", "2.5kHz"),
        (100, "Hz", "100Hz"),
        (1, "kHz", "1kHz"),
    ])
    func `frequency value renders correctly`(
        value: Number,
        unit: String,
        expected: String
    ) {
        let frequency: FrequencyPercentage
        if unit == "Hz" {
            frequency = FrequencyPercentage.hz(value)
        } else {
            frequency = FrequencyPercentage.khz(value)
        }
        #expect(frequency.description == expected)
    }

    @Test func `frequency case renders correctly`() {
        let customFreq = FrequencyPercentage.frequency(.hz(100))
        #expect(customFreq.description == "100Hz")
    }
}

@Suite
struct `FrequencyPercentage - Percentage Values` {
    @Test(arguments: [
        (75, "75%"),
        (100, "100%"),
        (0, "0%"),
        (33.3, "33.3%"),
        (50, "50%"),
    ])
    func `percentage value renders correctly`(
        value: Percentage,
        expected: String
    ) {
        let percentage = FrequencyPercentage.percentage(value)
        #expect(percentage.description == expected)
    }

    @Test func `percentage case renders correctly`() {
        let customPercentage = FrequencyPercentage.percentage(33.3)
        #expect(customPercentage.description == "33.3%")
    }
}

// MARK: - Factory Methods

@Suite
struct `FrequencyPercentage - Integer and Double Constructors` {
    @Test func `hz factory with int equals hz factory with double`() {
        let intHz = FrequencyPercentage.hz(440)
        let doubleHz = FrequencyPercentage.hz(440.0)
        #expect(intHz == doubleHz)
    }

    @Test func `khz factory with int equals khz factory with double`() {
        let intKhz = FrequencyPercentage.khz(2)
        let doubleKhz = FrequencyPercentage.khz(2.0)
        #expect(intKhz == doubleKhz)
    }

    @Test func `percentage factory with int equals percentage factory with double`() {
        let intPercent = FrequencyPercentage.percentage(50)
        let doublePercent = FrequencyPercentage.percentage(50.0)
        #expect(intPercent == doublePercent)
    }
}

// MARK: - Protocol Conformance

@Suite
struct `FrequencyPercentage - Hashable Conformance` {
    @Test func `equal frequency values are equal`() {
        let freq1 = FrequencyPercentage.hz(440)
        let freq2 = FrequencyPercentage.hz(440)
        #expect(freq1 == freq2)
    }

    @Test func `different frequency values are not equal`() {
        let freq1 = FrequencyPercentage.hz(440)
        let freq3 = FrequencyPercentage.hz(880)
        #expect(freq1 != freq3)
    }

    @Test func `equal percentage values are equal`() {
        let percent1 = FrequencyPercentage.percentage(75)
        let percent2 = FrequencyPercentage.percentage(75)
        #expect(percent1 == percent2)
    }

    @Test func `different percentage values are not equal`() {
        let percent1 = FrequencyPercentage.percentage(75)
        let percent3 = FrequencyPercentage.percentage(50)
        #expect(percent1 != percent3)
    }

    @Test func `frequency and percentage are not equal`() {
        let freq1 = FrequencyPercentage.hz(440)
        let percent1 = FrequencyPercentage.percentage(75)
        #expect(freq1 != percent1)
    }
}

// MARK: - Floating Point Values

@Suite
struct `FrequencyPercentage - Floating Point Rendering` {
    @Test func `floating point hz renders correctly`() {
        let floatHz = FrequencyPercentage.hz(440.5)
        #expect(floatHz.description == "440.5Hz")
    }

    @Test func `round hz truncates trailing zeros`() {
        let roundHz = FrequencyPercentage.hz(440.0)
        #expect(roundHz.description == "440Hz")
    }

    @Test func `floating point percentage renders correctly`() {
        let floatPercent = FrequencyPercentage.percentage(75.5)
        #expect(floatPercent.description == "75.5%")
    }

    @Test func `round percentage truncates trailing zeros`() {
        let roundPercent = FrequencyPercentage.percentage(75.0)
        #expect(roundPercent.description == "75%")
    }
}

// MARK: - Usage in Context

@Suite
struct `FrequencyPercentage - CSS Property Usage` {
    @Test func `hz renders correctly in audio property`() {
        let audio = "pitch: \(FrequencyPercentage.hz(440))"
        #expect(audio == "pitch: 440Hz")
    }

    @Test func `khz renders correctly in audio property`() {
        let audio = "pitch: \(FrequencyPercentage.khz(2.5))"
        #expect(audio == "pitch: 2.5kHz")
    }

    @Test func `percentage renders correctly in audio property`() {
        let audio = "pitch: \(FrequencyPercentage.percentage(75))"
        #expect(audio == "pitch: 75%")
    }
}

// MARK: - Edge Cases

@Suite
struct `FrequencyPercentage - Edge Cases` {
    @Test func `zero values render correctly`() {
        #expect(FrequencyPercentage.hz(0).description == "0Hz")
        #expect(FrequencyPercentage.khz(0).description == "0kHz")
        #expect(FrequencyPercentage.percentage(0).description == "0%")
    }

    @Test func `negative values render correctly`() {
        #expect(FrequencyPercentage.hz(-440).description == "-440Hz")
        #expect(FrequencyPercentage.percentage(-25).description == "-25%")
    }

    @Test func `very small values preserve precision`() {
        #expect(FrequencyPercentage.hz(0.001).description == "0.001Hz")
        #expect(FrequencyPercentage.percentage(0.1).description == "0.1%")
    }

    @Test func `very large values render correctly`() {
        #expect(FrequencyPercentage.hz(999999).description == "999999Hz")
        #expect(FrequencyPercentage.khz(999).description == "999kHz")
    }

    @Test func `decimal precision is maintained`() {
        #expect(FrequencyPercentage.hz(440.123456).description == "440.123456Hz")
        #expect(FrequencyPercentage.percentage(33.333333).description == "33.333333%")
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `FrequencyPercentage - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `frequency percentage creation 100K times`() {
            for i in 0..<100_000 {
                _ = FrequencyPercentage.hz(Number(i))
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `percentage creation 100K times`() {
            for i in 0..<100_000 {
                _ = FrequencyPercentage.percentage(Percentage(i))
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `frequency percentage comparison 100K times`() {
            let fp1 = FrequencyPercentage.hz(440)
            for i in 0..<100_000 {
                _ = FrequencyPercentage.hz(Number(i)) == fp1
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `factory method 100K times`() {
            for i in 0..<100_000 {
                _ = FrequencyPercentage.khz(Number(i))
            }
        }
    }
}
