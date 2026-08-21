import IEEE_754
import RFC_4648

public struct HexColor: Sendable, Hashable {

    public let value: String

    public init(_ value: String) {
        if value.hasPrefix("#") {
            self.value = value
        } else {
            self.value = "#" + value
        }
    }

}

extension HexColor {

    public static func rgb(_ red: Int, _ green: Int, _ blue: Int) -> HexColor {
        let bytes: [Byte] = [
            Byte(UInt8(min(max(0, red), 255))),
            Byte(UInt8(min(max(0, green), 255))),
            Byte(UInt8(min(max(0, blue), 255))),
        ]
        let hexBytes: [ASCII.Code] = RFC_4648.Base16.encode(bytes, uppercase: true)
        let hexString = "#" + String(decoding: hexBytes, as: UTF8.self)
        return HexColor(hexString)
    }

    public static func rgba(_ red: Int, _ green: Int, _ blue: Int, _ alpha: Double) -> HexColor {

        let alphaInt = Int(
            (min(max(0.0, alpha), 1.0) * 255).rounded()
        )

        let bytes: [Byte] = [
            Byte(UInt8(min(max(0, red), 255))),
            Byte(UInt8(min(max(0, green), 255))),
            Byte(UInt8(min(max(0, blue), 255))),
            Byte(UInt8(alphaInt)),
        ]
        let hexBytes: [ASCII.Code] = RFC_4648.Base16.encode(bytes, uppercase: true)
        let hexString = "#" + String(decoding: hexBytes, as: UTF8.self)
        return HexColor(hexString)
    }

    public var isValid: Bool {
        guard value.hasPrefix("#") else { return false }
        let hex = value.dropFirst()

        guard [3, 4, 6, 8].contains(hex.count) else { return false }

        return hex.allSatisfy { char in
            (char >= "0" && char <= "9") || (char >= "A" && char <= "F")
                || (char >= "a" && char <= "f")
        }
    }
}

extension HexColor: CustomStringConvertible {

    public var description: String {
        return value
    }
}
