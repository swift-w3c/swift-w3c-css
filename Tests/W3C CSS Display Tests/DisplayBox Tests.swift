import Testing

@testable import W3C_CSS_Display

@Suite
struct `DisplayBox - Initialization` {
    @Test(arguments: [
        (DisplayBox.none, "none"),
        (DisplayBox.contents, "contents"),
    ])
    func `displayBox initializes with correct raw value and description`(
        value: DisplayBox,
        expected: String
    ) {
        #expect(value.rawValue == expected)
        #expect(value.description == expected)
    }
}

@Suite
struct `DisplayBox - Raw Value Initialization` {
    @Test func `creates displayBox from valid raw values`() {
        #expect(DisplayBox(rawValue: "none") == DisplayBox.none)
        #expect(DisplayBox(rawValue: "contents") == DisplayBox.contents)
    }

    @Test func `returns nil for invalid raw values`() {
        #expect(DisplayBox(rawValue: "invalid") == nil)
        #expect(DisplayBox(rawValue: "") == nil)
        #expect(DisplayBox(rawValue: "block") == nil)
    }
}

@Suite
struct `DisplayBox - Hashable Conformance` {
    @Test func `equal values are equal`() {
        let display1 = DisplayBox.none
        let display2 = DisplayBox.none
        #expect(display1 == display2)
    }

    @Test func `different values are not equal`() {
        let display1 = DisplayBox.none
        let display2 = DisplayBox.contents
        #expect(display1 != display2)
    }

    @Test func `hashable allows use in sets`() {
        let set: Set<DisplayBox> = [.none, .contents, .none]
        #expect(set.count == 2)
        #expect(set.contains(.none))
        #expect(set.contains(.contents))
    }

    @Test func `hashable allows use as dictionary keys`() {
        let dict: [DisplayBox: String] = [
            .none: "hidden",
            .contents: "unwrapped",
        ]
        #expect(dict[.none] == "hidden")
        #expect(dict[.contents] == "unwrapped")
    }
}

@Suite
struct `DisplayBox - CSS Property Usage` {
    @Test func `renders correctly in display property`() {
        let displayNone = "display: \(DisplayBox.none)"
        #expect(displayNone == "display: none")

        let displayContents = "display: \(DisplayBox.contents)"
        #expect(displayContents == "display: contents")
    }

    @Test func `none removes element from rendering`() {

        #expect(DisplayBox.none.description == "none")
    }

    @Test func `contents unwraps element box`() {

        #expect(DisplayBox.contents.description == "contents")
    }
}

@Suite
struct `DisplayBox - CSS Specification` {
    @Test func `none matches CSS specification`() {

        #expect(DisplayBox.none.rawValue == "none")
        #expect(DisplayBox.none.description == "none")
    }

    @Test func `contents matches CSS specification`() {

        #expect(DisplayBox.contents.rawValue == "contents")
        #expect(DisplayBox.contents.description == "contents")
    }

    @Test func `all specification values are present`() {

        let allValues: Set<DisplayBox> = [.none, .contents]
        #expect(allValues.count == 2)
    }
}

@Suite
struct `DisplayBox - Edge Cases` {
    @Test func `case insensitive raw value lookup fails`() {

        #expect(DisplayBox(rawValue: "NONE") == nil)
        #expect(DisplayBox(rawValue: "None") == nil)
        #expect(DisplayBox(rawValue: "CONTENTS") == nil)
    }

    @Test func `whitespace in raw value fails`() {
        #expect(DisplayBox(rawValue: " none") == nil)
        #expect(DisplayBox(rawValue: "none ") == nil)
        #expect(DisplayBox(rawValue: " contents ") == nil)
    }

    @Test func `similar but incorrect values fail`() {
        #expect(DisplayBox(rawValue: "hidden") == nil)
        #expect(DisplayBox(rawValue: "content") == nil)
        #expect(DisplayBox(rawValue: "none;") == nil)
    }
}

extension `Performance Tests` {
    @Suite
    struct `DisplayBox - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `displayBox raw value lookup 100K times`() {
            for _ in 0..<100_000 {
                _ = DisplayBox(rawValue: "none")
                _ = DisplayBox(rawValue: "contents")
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `displayBox equality comparison 100K times`() {
            let none = DisplayBox.none
            let contents = DisplayBox.contents
            for _ in 0..<100_000 {
                _ = none == contents
                _ = none == none
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `displayBox description generation 100K times`() {
            let none = DisplayBox.none
            let contents = DisplayBox.contents
            for _ in 0..<100_000 {
                _ = none.description
                _ = contents.description
            }
        }
    }
}
