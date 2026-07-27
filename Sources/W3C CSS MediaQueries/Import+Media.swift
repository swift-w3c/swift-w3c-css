public import W3C_CSS_Syntax

/// Type-safe extensions for Import to work with Media queries
extension Import {
    /// Sets the media query condition using a Media type.
    ///
    /// - Parameter media: The Media query to apply.
    /// - Returns: An updated Import instance.
    public func media(_ media: Media) -> Import {
        // Extract just the media query part (without "@media ")
        let mediaQueryString = String(media.rawValue.dropFirst(7))
        return self.media(mediaQueryString)
    }

    /// Sets the media query conditions using multiple Media queries.
    ///
    /// - Parameter medias: An array of Media queries to apply.
    /// - Returns: An updated Import instance.
    public func media(_ medias: [Media]) -> Import {
        let mediaQueryStrings = medias.map { String($0.rawValue.dropFirst(7)) }
        return self.media(mediaQueryStrings)
    }
}
