import Testing

@testable import W3C_CSS_Shared

@Suite
struct `Webkit Tests` {
    enum Sample: Property {
        case on
        case global(Global)

        static let property = "sample"

        var description: String {
            switch self {
            case .on: "on"
            case .global(let global): global.description
            }
        }
    }

    @Test
    func `the prefix goes before the property's name, the value stays`() {
        #expect(Webkit<Sample>.property == "-webkit-sample")
        #expect(Webkit(Sample.on).declaration.description == "-webkit-sample:on")
        #expect(Webkit<Sample>.inherit.description == "inherit")
    }
}
