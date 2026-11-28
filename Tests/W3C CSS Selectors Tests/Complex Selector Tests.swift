import Testing
import W3C_CSS_Selectors
import W3C_CSS_Shared

@Suite struct `Complex Selector Tests` {
    typealias Selector = W3C.CSS.Selector

    enum Name: String {
        case row
        case menu
    }

    @Test func `a compound selector joins its simple selectors with nothing between them`() {
        #expect(Selector.type("nav").class("main").class(Name.menu).description == "nav.main.menu")
        #expect(Selector.class(Name.row).attribute("aria-current").description == ".row[aria-current]")
        #expect(Selector.universal.description == "*")
    }

    @Test func `each combinator serializes as the specification writes it`() {
        let row = Selector.class(Name.row)
        #expect(row.descendant(.type("svg")).description == ".row svg")
        #expect(row.child(.type("span")).description == ".row>span")
        #expect(row.next(row).description == ".row+.row")
        #expect(row.subsequent(row).description == ".row~.row")
    }

    @Test func `a simple selector added after a combinator lands on the last compound`() {
        let selector = Selector.class(Name.menu).child(.type("a")).pseudo(.hover)
        #expect(selector.description == ".menu>a:hover")
    }

    @Test func `functional pseudo-classes take selectors, not text`() {
        let open = Selector.pseudo(.init("popover-open"))
        #expect(Selector.class(Name.menu).has(.next(open)).description == ".menu:has(+:popover-open)")
        #expect(Selector.type("a").not(.class(Name.row)).description == "a:not(.row)")
        #expect(Selector.class(Name.menu).is(.pseudo(.hover), .pseudo(.focusVisible)).description == ".menu:is(:hover,:focus-visible)")
        #expect(Selector.type("span").pseudo(.nthChild(2)).description == "span:nth-child(2)")
        #expect(Selector.type("li").pseudo(.nthChild(.odd)).description == "li:nth-child(2n+1)")
    }

    @Test func `a selector list separates its selectors with commas`() {
        let list: Selector.List = [.type("h1"), .type("h2").pseudo(Selector.Pseudo.Element("before"))]
        #expect(list.description == "h1,h2::before")
    }
}
