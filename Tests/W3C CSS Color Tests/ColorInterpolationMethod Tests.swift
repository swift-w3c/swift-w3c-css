// ColorInterpolationMethod Tests.swift
// swift-w3c-css
//
// Tests for CSS ColorInterpolationMethod type

import Testing
import W3C_CSS_Values

@testable import W3C_CSS_Color

// MARK: - Rectangular Color Spaces

@Suite
struct `ColorInterpolationMethod - Rectangular Spaces` {
    @Test(arguments: [
        (ColorInterpolationMethod.RectangularColorSpace.srgb, "in srgb"),
        (.srgbLinear, "in srgb-linear"),
        (.displayP3, "in display-p3"),
        (.a98rgb, "in a98-rgb"),
        (.prophotoRgb, "in prophoto-rgb"),
        (.rec2020, "in rec2020"),
        (.lab, "in lab"),
        (.oklab, "in oklab"),
        (.xyz, "in xyz"),
        (.xyzD50, "in xyz-d50"),
        (.xyzD65, "in xyz-d65"),
    ])
    func `rectangular color spaces render correctly`(
        space: ColorInterpolationMethod.RectangularColorSpace,
        expected: String
    ) {
        #expect(ColorInterpolationMethod.rectangular(space).description == expected)
    }
}

// MARK: - Polar Color Spaces

@Suite
struct `ColorInterpolationMethod - Polar Spaces Without Hue` {
    @Test(arguments: [
        (ColorInterpolationMethod.PolarColorSpace.hsl, "in hsl"),
        (.hwb, "in hwb"),
        (.lch, "in lch"),
        (.oklch, "in oklch"),
    ])
    func `polar color spaces without hue method render correctly`(
        space: ColorInterpolationMethod.PolarColorSpace,
        expected: String
    ) {
        #expect(ColorInterpolationMethod.polar(space).description == expected)
    }
}

@Suite
struct `ColorInterpolationMethod - Polar Spaces With Hue` {
    @Test(arguments: [
        (
            ColorInterpolationMethod.PolarColorSpace.hsl,
            ColorInterpolationMethod.HueInterpolationMethod.shorter, "in hsl shorter hue"
        ),
        (.hwb, .longer, "in hwb longer hue"),
        (.lch, .increasing, "in lch increasing hue"),
        (.oklch, .decreasing, "in oklch decreasing hue"),
    ])
    func `polar color spaces with hue method render correctly`(
        space: ColorInterpolationMethod.PolarColorSpace,
        hueMethod: ColorInterpolationMethod.HueInterpolationMethod,
        expected: String
    ) {
        #expect(ColorInterpolationMethod.polar(space, hueMethod).description == expected)
    }
}

// MARK: - Custom Color Profile

@Suite
struct `ColorInterpolationMethod - Custom Profile` {
    @Test(arguments: [
        ("my-custom-profile", #"in "my-custom-profile""#),
        ("sRGB-IEC61966", #"in "sRGB-IEC61966""#),
        ("Adobe-RGB-1998", #"in "Adobe-RGB-1998""#),
    ])
    func `custom color profile renders correctly`(
        profileName: String,
        expected: String
    ) {
        #expect(ColorInterpolationMethod.custom(profileName).description == expected)
    }
}

// MARK: - Protocol Conformance

@Suite
struct `ColorInterpolationMethod - Hashable Conformance` {
    @Test func `equal rectangular spaces are equal`() {
        #expect(
            ColorInterpolationMethod.rectangular(.srgb)
                == ColorInterpolationMethod.rectangular(.srgb)
        )
    }

    @Test func `equal polar spaces are equal`() {
        #expect(
            ColorInterpolationMethod.polar(.hsl)
                == ColorInterpolationMethod.polar(.hsl)
        )
    }

    @Test func `equal polar spaces with hue are equal`() {
        #expect(
            ColorInterpolationMethod.polar(.hsl, .shorter)
                == ColorInterpolationMethod.polar(.hsl, .shorter)
        )
    }

    @Test func `different rectangular spaces are not equal`() {
        #expect(
            ColorInterpolationMethod.rectangular(.srgb)
                != ColorInterpolationMethod.rectangular(.lab)
        )
    }

    @Test func `different polar spaces are not equal`() {
        #expect(
            ColorInterpolationMethod.polar(.hsl)
                != ColorInterpolationMethod.polar(.hwb)
        )
    }

    @Test func `polar spaces with different hue methods are not equal`() {
        #expect(
            ColorInterpolationMethod.polar(.hsl, .shorter)
                != ColorInterpolationMethod.polar(.hsl, .longer)
        )
    }

    @Test func `rectangular and polar types are not equal`() {
        #expect(
            ColorInterpolationMethod.rectangular(.srgb)
                != ColorInterpolationMethod.polar(.hsl)
        )
    }

    @Test func `custom profiles with same value are equal`() {
        let profile1 = "profile1"
        #expect(
            ColorInterpolationMethod.custom(profile1)
                == ColorInterpolationMethod.custom(profile1)
        )
    }

    @Test func `custom profiles with different values are not equal`() {
        let profile1 = "profile1"
        let profile2 = "profile2"
        #expect(
            ColorInterpolationMethod.custom(profile1)
                != ColorInterpolationMethod.custom(profile2)
        )
    }
}

// MARK: - Edge Cases

@Suite
struct `ColorInterpolationMethod - Edge Cases` {
    @Test func `all rectangular color spaces are distinct`() {
        let spaces: [ColorInterpolationMethod.RectangularColorSpace] = [
            .srgb, .srgbLinear, .displayP3, .a98rgb,
            .prophotoRgb, .rec2020, .lab, .oklab,
            .xyz, .xyzD50, .xyzD65,
        ]

        let methods = spaces.map { ColorInterpolationMethod.rectangular($0) }
        let uniqueMethods = Set(methods)
        #expect(methods.count == uniqueMethods.count)
    }

    @Test func `all polar color spaces are distinct`() {
        let spaces: [ColorInterpolationMethod.PolarColorSpace] = [.hsl, .hwb, .lch, .oklch]

        let methods = spaces.map { ColorInterpolationMethod.polar($0) }
        let uniqueMethods = Set(methods)
        #expect(methods.count == uniqueMethods.count)
    }

    @Test func `all hue interpolation methods are distinct`() {
        let hueMethods: [ColorInterpolationMethod.HueInterpolationMethod] = [
            .shorter, .longer, .increasing, .decreasing,
        ]

        let methods = hueMethods.map { ColorInterpolationMethod.polar(.hsl, $0) }
        let uniqueMethods = Set(methods)
        #expect(methods.count == uniqueMethods.count)
    }

    @Test func `custom profile with empty string`() {
        let emptyProfile = ""
        let method = ColorInterpolationMethod.custom(emptyProfile)
        #expect(method.description == #"in """#)
    }

    @Test func `custom profile with special characters`() {
        let specialProfile = "my-profile-2.0"
        let method = ColorInterpolationMethod.custom(specialProfile)
        #expect(method.description == #"in "my-profile-2.0""#)
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `ColorInterpolationMethod - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `rectangular color space creation 100K times`() {
            let spaces: [ColorInterpolationMethod.RectangularColorSpace] = [
                .srgb, .srgbLinear, .displayP3, .a98rgb,
                .prophotoRgb, .rec2020, .lab, .oklab,
                .xyz, .xyzD50, .xyzD65,
            ]

            for i in 0..<100_000 {
                let space = spaces[i % spaces.count]
                _ = ColorInterpolationMethod.rectangular(space)
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `polar color space creation 100K times`() {
            let spaces: [ColorInterpolationMethod.PolarColorSpace] = [.hsl, .hwb, .lch, .oklch]

            for i in 0..<100_000 {
                let space = spaces[i % spaces.count]
                _ = ColorInterpolationMethod.polar(space)
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `polar color space with hue method creation 100K times`() {
            let spaces: [ColorInterpolationMethod.PolarColorSpace] = [.hsl, .hwb, .lch, .oklch]
            let hueMethods: [ColorInterpolationMethod.HueInterpolationMethod] = [
                .shorter, .longer, .increasing, .decreasing,
            ]

            for i in 0..<100_000 {
                let space = spaces[i % spaces.count]
                let hueMethod = hueMethods[i % hueMethods.count]
                _ = ColorInterpolationMethod.polar(space, hueMethod)
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `custom color profile creation 100K times`() {
            for i in 0..<100_000 {
                let profile = "profile-\(i % 10)"
                _ = ColorInterpolationMethod.custom(profile)
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `color interpolation method comparison 100K times`() {
            let method1 = ColorInterpolationMethod.rectangular(.srgb)
            let method2 = ColorInterpolationMethod.polar(.hsl, .shorter)

            for _ in 0..<100_000 {
                _ = method1 == method2
            }
        }
    }
}
