// CSSOM.swift
// swift-w3c-css
//
// Re-exports CSSOM types for backward compatibility

// Re-export all CSSOM types (Url, CSSString, CustomIdent, DashedIdent, Ident)
// This allows existing code to continue using `import W3C_CSS_Shared` while
// the types actually come from the W3C_CSSOM package.
@_exported import W3C_CSSOM
