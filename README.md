# swift-w3c-css

Use this package when you want to write CSS from Swift with typed values instead of strings: one type per CSS property, such as `Display`, `FontFamily` or `W3C_CSS_Color.Color`, built from value types such as `Length`, `Percentage`, `Angle` and `W3C_CSS_Values.Color`. Import one module per CSS specification, or `W3C CSS` for all of them. For a single facade over these types with CSSOM serialization, use swift-css-standard. To apply them to HTML views, use swift-css-html-render.

## Laws

- A property's `declaration` prints as the property name, a colon and the value, with no space and no semicolon, as in `animation-play-state:running`.
- Every property accepts the global keywords and prints them as CSS spells them, so `revertLayer` prints as `revert-layer`.
- Numbers print in plain decimal with no exponent and no trailing zeros. 90.0 degrees prints as `90deg`, and 0.0001 keeps all its digits.
- A bare number literal means pixels for `Length` and `LengthPercentage`, degrees for `Angle`, seconds for `Time`, and a plain number for `Hue`.
- `Length`, `Angle` and `Frequency` compare by value and unit, so 1 turn is not equal to 360 degrees. `Time` compares by duration, so 1 second equals 1000 milliseconds, and adding two times keeps the left-hand unit.
- Adding, subtracting or multiplying two `Length` values in the same unit computes the result. Any other combination, including mixed units and keywords, produces the expression as `calc()` text.
- `CalcSum` wraps its expression in `calc()` unless the expression already starts with `calc(`, `min(`, `max(` or `clamp(` and ends with a closing parenthesis.
- A `Percentage` holds percent, so 50 means 50%. The saturation, lightness, whiteness and blackness of `W3C_CSS_Values.Color` are in percent too.
- `W3C_CSS_Values.Color` prints its components as given and never clamps them. `W3C_CSS_Color.Color.Safe` clamps red, green and blue to 0 to 255, alpha to 0 to 1, and the HSL and HWB percentages to 0 to 100.
- `HexColor` adds a missing # but does not check the digits; use `HexColor.isValid` for that. Two hex colors compare as text, so `#ff0000` and `#FF0000` differ. `HexColor.rgb(_:_:_:)` clamps each channel and writes uppercase digits.
- A `Hue` prints as given. `Hue.normalizedDegrees()` converts grads, radians and turns to degrees and wraps the result into 0 up to 360.
- `TypeSelector` lowercases the element name. `ClassSelector` and `IDSelector` drop one leading . or # from their input, so both spellings give the same selector. `AttributeSelector` puts its value in double quotes and adds the i flag when asked.
- A font family name is quoted when it contains a space, a hyphen or a dot, and written bare otherwise.
- `Ratio` refuses a negative width or height, orders ratios by their quotient, and prints a height of 1 as the width alone. `Resolution` refuses a negative value.
- The `css` contexts on circles, ellipses and rectangles give nil for a negative radius or size. A path's arcs are written as straight lines to their end points.
