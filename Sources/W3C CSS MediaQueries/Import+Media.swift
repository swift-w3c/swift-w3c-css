public import W3C_CSS_Syntax

extension Import {

    public func media(_ media: Media) -> Import {

        let mediaQueryString = String(media.rawValue.dropFirst(7))
        return self.media(mediaQueryString)
    }

    public func media(_ medias: [Media]) -> Import {
        let mediaQueryStrings = medias.map { String($0.rawValue.dropFirst(7)) }
        return self.media(mediaQueryStrings)
    }
}
