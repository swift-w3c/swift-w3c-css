// Media Tests.swift
// swift-w3c-css
//
// Tests for CSS Media type

import Testing
import W3C_CSS_Values

@testable import W3C_CSS_MediaQueries

// MARK: - Basic Functionality

@Suite
struct `Media - Initialization` {
    @Test func `media type initialization creates correct raw values`() {
        let mediaScreen = Media(.screen)
        #expect(mediaScreen.rawValue == "@media screen")

        let mediaPrint = Media(.print)
        #expect(mediaPrint.rawValue == "@media print")

        let mediaAll = Media(.all)
        #expect(mediaAll.rawValue == "@media all")
    }

    @Test func `static media type properties create correct raw values`() {
        #expect(Media.screen.rawValue == "@media screen")
        #expect(Media.print.rawValue == "@media print")
        #expect(Media.all.rawValue == "@media all")
    }

    @Test func `raw value initialization`() {
        let custom = Media(rawValue: "@media custom")
        #expect(custom.rawValue == "@media custom")
    }
}

@Suite
struct `Media - Feature Queries` {
    @Test(arguments: [
        (Media.width(.px(100)), "@media (width: 100px)"),
        (Media.minWidth(.em(1.5)), "@media (min-width: 1.5em)"),
        (Media.maxWidth(.percentage(80)), "@media (max-width: 80%)"),
    ])
    func `width feature methods create correct media queries`(
        media: Media,
        expected: String
    ) {
        #expect(media.rawValue == expected)
    }

    @Test(arguments: [
        (Media.height(.px(100)), "@media (height: 100px)"),
        (Media.minHeight(.em(1.5)), "@media (min-height: 1.5em)"),
        (Media.maxHeight(.percentage(80)), "@media (max-height: 80%)"),
    ])
    func `height feature methods create correct media queries`(
        media: Media,
        expected: String
    ) {
        #expect(media.rawValue == expected)
    }

    @Test(arguments: [
        (Media.aspectRatio(16, 9), "@media (aspect-ratio: 16/9)"),
        (Media.minAspectRatio(1, 1), "@media (min-aspect-ratio: 1/1)"),
        (Media.maxAspectRatio(21, 9), "@media (max-aspect-ratio: 21/9)"),
    ])
    func `aspect ratio feature methods create correct media queries`(
        media: Media,
        expected: String
    ) {
        #expect(media.rawValue == expected)
    }

    @Test(arguments: [
        (Media.orientation(.portrait), "@media (orientation: portrait)"),
        (Media.orientation(.landscape), "@media (orientation: landscape)"),
    ])
    func `orientation feature methods create correct media queries`(
        media: Media,
        expected: String
    ) {
        #expect(media.rawValue == expected)
    }
}

@Suite
struct `Media - User Preference Queries` {
    @Test(arguments: [
        (Media.prefersColorScheme(.dark), "@media (prefers-color-scheme: dark)"),
        (Media.prefersColorScheme(.light), "@media (prefers-color-scheme: light)"),
    ])
    func `color scheme preference queries`(
        media: Media,
        expected: String
    ) {
        #expect(media.rawValue == expected)
    }

    @Test func `reduced motion preference queries`() {
        #expect(Media.prefersReducedMotion().rawValue == "@media (prefers-reduced-motion: reduce)")
        #expect(
            Media.prefersReducedMotion(.noPreference).rawValue
                == "@media (prefers-reduced-motion: no-preference)"
        )
    }

    @Test(arguments: [
        (Media.prefersContrast(.more), "@media (prefers-contrast: more)"),
        (Media.prefersContrast(.less), "@media (prefers-contrast: less)"),
    ])
    func `contrast preference queries`(
        media: Media,
        expected: String
    ) {
        #expect(media.rawValue == expected)
    }
}

@Suite
struct `Media - Resolution Queries` {
    @Test func `resolution feature methods create correct media queries`() throws {
        #expect(Media.resolution(try Resolution.dpi(300)).rawValue == "@media (resolution: 300dpi)")
        #expect(
            Media.minResolution(try Resolution.dppx(2)).rawValue == "@media (min-resolution: 2dppx)"
        )
    }
}

// MARK: - Logical Operators

@Suite
struct `Media - AND Operator` {
    @Test func `combines media query with feature correctly`() {
        let media = Media.screen.and(Media.maxWidth(.px(500)))
        #expect(media.rawValue == "@media screen and (max-width: 500px)")
    }

    @Test func `chains multiple conditions`() {
        let complexMedia = Media.screen
            .and(Media.minWidth(.px(300)))
            .and(Media.maxWidth(.px(800)))
            .and(Media.orientation(.landscape))

        #expect(
            complexMedia.rawValue
                == "@media screen and (min-width: 300px) and (max-width: 800px) and (orientation: landscape)"
        )
    }

    @Test func `works with predefined queries`() {
        let media = Media.desktop.and(Media.prefersColorScheme(.dark))
        #expect(
            media.rawValue
                == "@media only screen and (min-width: 832px) and (prefers-color-scheme: dark)"
        )
    }

    @Test func `works with only keyword queries`() {
        let onlyScreen = Media.screen.only()
        let media = onlyScreen.and(Media.maxWidth(.px(500)))
        #expect(media.rawValue == "@media only screen and (max-width: 500px)")
    }
}

@Suite
struct `Media - NOT Operator` {
    @Test func `negates media query correctly`() {
        let media = Media.print.not()
        #expect(media.rawValue == "@media not print")
    }

    @Test func `negates complex media query`() {
        let complexMedia = Media.screen
            .and(Media.maxWidth(.px(500)))
            .not()

        #expect(complexMedia.rawValue == "@media not screen and (max-width: 500px)")
    }
}

@Suite
struct `Media - ONLY Operator` {
    @Test func `applies only to media query`() {
        let media = Media.screen.only()
        #expect(media.rawValue == "@media only screen")
    }
}

@Suite
struct `Media - OR Operator` {
    @Test func `combines media queries with comma`() {
        let media = Media.screen.or(Media.print)
        #expect(media.rawValue == "@media screen, print")
    }

    @Test func `combines complex queries`() {
        let complexMedia = Media.screen
            .and(Media.maxWidth(.px(500)))
            .or(Media.print)

        #expect(complexMedia.rawValue == "@media screen and (max-width: 500px), print")
    }
}

@Suite
struct `Media - Operator Overloads` {
    @Test func `ampersand combines with and`() {
        let media = Media.screen && Media.maxWidth(.px(500))
        #expect(media.rawValue == "@media screen and (max-width: 500px)")
    }

    @Test func `pipe combines with or`() {
        let media = Media.screen || Media.print
        #expect(media.rawValue == "@media screen, print")
    }

    @Test func `exclamation negates`() {
        let media = !Media.print
        #expect(media.rawValue == "@media not print")
    }
}

// MARK: - Complex Combinations

@Suite
struct `Media - Complex Queries` {
    @Test func `complex queries with functions`() {
        let complexQuery = Media.screen
            .and(Media.minWidth(.px(768)))
            .and(Media.maxWidth(.px(1200)))
            .and(Media.orientation(.landscape))
            .and(Media.prefersReducedMotion())

        #expect(
            complexQuery.rawValue
                == "@media screen and (min-width: 768px) and (max-width: 1200px) and (orientation: landscape) and (prefers-reduced-motion: reduce)"
        )
    }

    @Test func `complex queries with operators`() {
        let complexQueryWithOperators =
            Media.screen
            && Media.minWidth(.px(768))
            && Media.maxWidth(.px(1200))
            && Media.orientation(.landscape)
            && Media.prefersReducedMotion()

        #expect(
            complexQueryWithOperators.rawValue
                == "@media screen and (min-width: 768px) and (max-width: 1200px) and (orientation: landscape) and (prefers-reduced-motion: reduce)"
        )
    }

    @Test func `combined or and and operators`() {
        let combinedQuery =
            (Media.screen && Media.minWidth(.px(992)))
            || (Media.print && Media.orientation(.portrait))

        #expect(
            combinedQuery.rawValue
                == "@media screen and (min-width: 992px), print and (orientation: portrait)"
        )
    }

    @Test func `combined not and and operators`() {
        let negatedQuery = !(Media.screen && Media.maxWidth(.px(600)))

        #expect(negatedQuery.rawValue == "@media not screen and (max-width: 600px)")
    }

    @Test func `chained mixed queries`() {
        let result = Media.desktop
            .and(Media.prefersColorScheme(.dark))
            .and(Media.prefersReducedMotion())

        #expect(
            result.rawValue
                == "@media only screen and (min-width: 832px) and (prefers-color-scheme: dark) and (prefers-reduced-motion: reduce)"
        )
    }
}

// MARK: - Predefined Media Queries

@Suite
struct `Media - Predefined Queries` {
    @Test func `predefined viewport queries`() {
        #expect(Media.desktop.rawValue == "@media only screen and (min-width: 832px)")
        #expect(Media.mobile.rawValue == "@media only screen and (max-width: 831px)")
        #expect(
            Media.tablet.rawValue
                == "@media only screen and (min-width: 768px) and (max-width: 1024px)"
        )
    }

    @Test func `predefined orientation queries`() {
        #expect(Media.landscape.rawValue == "@media (orientation: landscape)")
        #expect(Media.portrait.rawValue == "@media (orientation: portrait)")
    }

    @Test func `predefined feature queries`() {
        #expect(Media.dark.rawValue == "@media (prefers-color-scheme: dark)")
        #expect(Media.hover.rawValue == "@media (hover: hover)")
        #expect(Media.reducedMotion.rawValue == "@media (prefers-reduced-motion: reduce)")
    }

    @Test func `predefined device queries`() {
        #expect(
            Media.retina.rawValue
                == "@media (-webkit-min-device-pixel-ratio: 2), (min-resolution: 192dpi)"
        )
        #expect(Media.smallMobile.rawValue == "@media only screen and (max-width: 320px)")
        #expect(
            Media.largeMobile.rawValue
                == "@media only screen and (min-width: 321px) and (max-width: 767px)"
        )
        #expect(Media.largeDesktop.rawValue == "@media only screen and (min-width: 1200px)")
    }
}

// MARK: - Edge Cases

@Suite
struct `Media - Edge Cases` {
    @Test func `empty raw value initialization`() {
        let empty = Media(rawValue: "")
        #expect(empty.rawValue.isEmpty)
    }

    @Test func `malformed raw value preserved`() {
        let malformed = Media(rawValue: "not a valid media query")
        #expect(malformed.rawValue == "not a valid media query")
    }

    @Test func `extreme dimension values`() {
        let extreme = Media.minWidth(.px(999999))
        #expect(extreme.rawValue == "@media (min-width: 999999px)")
    }

    @Test func `zero dimension values`() {
        let zero = Media.minWidth(.px(0))
        #expect(zero.rawValue == "@media (min-width: 0px)")
    }
}

// MARK: - Protocol Conformance

@Suite
struct `Media - Hashable Conformance` {
    @Test func `equal media queries are equal`() {
        let media1 = Media.screen
        let media2 = Media.screen
        #expect(media1 == media2)
    }

    @Test func `different media queries are not equal`() {
        let media1 = Media.screen
        let media2 = Media.print
        #expect(media1 != media2)
    }

    @Test func `media can be used in set`() {
        let set: Set<Media> = [.screen, .print, .screen]
        #expect(set.count == 2)
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `Media - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `media creation 100K times`() {
            for _ in 0..<100_000 {
                _ = Media.screen
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `media feature query creation 100K times`() {
            for i in 0..<100_000 {
                _ = Media.minWidth(.px(i))
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `media combination 100K times`() {
            for _ in 0..<100_000 {
                _ = Media.screen && Media.minWidth(.px(768))
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `complex media query building 10K times`() {
            for _ in 0..<10_000 {
                _ =
                    Media.screen
                    && Media.minWidth(.px(768))
                    && Media.maxWidth(.px(1200))
                    && Media.prefersColorScheme(.dark)
            }
        }
    }
}
