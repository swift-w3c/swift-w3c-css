import Testing
import W3C_CSS_Shared
import W3C_CSS_Variables
import W3C_CSS_Values
import W3C_CSS_Grid

@Suite struct `Track List Tests` {
    @Test func `a track is a calculation or a variable`() {
        #expect(GridAutoColumns.lengthPercentage(.calculation(.minimum([.length(640, .px), .percentage(86)]))).description == "min(640px, 86%)")
        #expect(GridTemplateColumns.tracks([.lengthPercentage(.length(.variable("side"))), .minMax(.px(0), .fr(1))]).description == "var(--side) minmax(0px, 1fr)")
    }

    @Test func `a repeat follows another track`() {
        #expect(GridTemplateColumns.tracks([.fr(1.5), .repeat(4, [.fr(1)])]).description == "1.5fr repeat(4, 1fr)")
    }

    @Test func `minmax takes a calculation`() {
        let least = MinMaxValue.lengthPercentage(.calculation(.minimum([.length(280, .px), .percentage(100)])))
        #expect(GridTemplateColumns.autoFill([.minMax(least, .fr(1))]).description == "repeat(auto-fill, minmax(min(280px, 100%), 1fr))")
    }
}
