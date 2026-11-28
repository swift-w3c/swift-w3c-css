extension Declaration {
    /// The same declaration marked `!important` (CSS Cascading Level 4, section 6.4).
    public var important: Declaration {
        description.hasSuffix("!important") ? self : Declaration(description: description + "!important")
    }
}
