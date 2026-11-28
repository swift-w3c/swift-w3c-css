extension Declaration {
    /// The same declaration marked `!important` (CSS Cascading Level 4, section 6.4).
    public var important: Declaration {
        Declaration(property: property, value: value, isImportant: true)
    }
}
