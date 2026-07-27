//// Types Tests.swift
//// swift-w3c-css
////
//// Tests for CSS Types integration and interoperability
//
// import Testing
// @testable import W3C_CSS_Shared
// @testable import W3C_CSS_Values
// @testable import W3C_CSS_Transforms
//
//// MARK: - Type Integration
//
// @Suite
// struct `CSS Types - Integration` {
//    @Test func `types can be combined in transform properties`() {
//        // Test that transform functions work with length and angle values
//        let transform = "transform: \(TransformFunction.translate(.px(100), .px(50))) \(TransformFunction.rotate(.deg(45))) \(TransformFunction.scale(sx: 1.5))"
//        #expect(transform == "transform: translate(100px, 50px) rotate(45deg) scale(1.5)")
//    }
//
//    @Test func `types can be combined in transition properties`() {
//        // Test that time values work in transitions
//        let transition = "transition: all \(Time.s(0.3)) \(Time.ms(100))"
//        #expect(transition == "transition: all 0.3s 100ms")
//    }
//
//    @Test func `types can be combined in animation properties`() {
//        // Test that animation works with time and percentage values
//        let animation = "animation: fadeIn \(Time.s(1)) \(TimePercentage.percentage(50))"
//        #expect(animation == "animation: fadeIn 1s 50%")
//    }
//
//    @Test func `url type works in background properties`() {
//        // Test that URL values work correctly
//        let backgroundImage = "background-image: \(Url("image.jpg"))"
//        #expect(backgroundImage == "background-image: url('image.jpg')")
//    }
// }
//
//// MARK: - Length Type Integration
//
// @Suite
// struct `CSS Types - Length Integration` {
//    @Test(arguments: [
//        (Length.px(100), "100px"),
//        (.em(1.5), "1.5em"),
//        (.rem(2), "2rem"),
//        (.vw(50), "50vw")
//    ])
//    func `length values render correctly in context`(length: Length, expected: String) {
//        let property = "width: \(length)"
//        #expect(property == "width: \(expected)")
//    }
//
//    @Test func `length types work in calc expressions`() {
//        // Document that lengths can be used in calculations
//        let width = Length.px(100)
//        #expect(width.description == "100px")
//    }
// }
//
//// MARK: - Percentage Type Integration
//
// @Suite
// struct `CSS Types - Percentage Integration` {
//    @Test(arguments: [
//        (Percentage(50), "50%"),
//        (.init(100), "100%"),
//        (.init(0), "0%"),
//        (.init(33.333), "33.333%")
//    ])
//    func `percentage values render correctly in context`(percentage: Percentage, expected: String) {
//        let property = "width: \(percentage)"
//        #expect(property == "width: \(expected)")
//    }
// }
//
//// MARK: - LengthPercentage Type Integration
//
// @Suite
// struct `CSS Types - LengthPercentage Integration` {
//    @Test func `length percentage accepts length values`() {
//        let lengthPct: LengthPercentage = .px(100)
//        #expect(lengthPct.description == "100px")
//    }
//
//    @Test func `length percentage accepts percentage values`() {
//        let lengthPct: LengthPercentage = .percentage(50)
//        #expect(lengthPct.description == "50%")
//    }
//
//    @Test(arguments: [
//        (LengthPercentage.px(100), "width: 100px"),
//        (.em(1.5), "width: 1.5em"),
//        (.percentage(50), "width: 50%")
//    ])
//    func `length percentage renders correctly in properties`(
//        value: LengthPercentage,
//        expected: String
//    ) {
//        let property = "width: \(value)"
//        #expect(property == expected)
//    }
// }
//
//// MARK: - Time Type Integration
//
// @Suite
// struct `CSS Types - Time Integration` {
//    @Test(arguments: [
//        (Time.s(1), "1s"),
//        (.s(0.3), "0.3s"),
//        (.ms(100), "100ms"),
//        (.ms(500), "500ms")
//    ])
//    func `time values render correctly in context`(time: Time, expected: String) {
//        let property = "transition-duration: \(time)"
//        #expect(property == "transition-duration: \(expected)")
//    }
// }
//
//// MARK: - Angle Type Integration
//
// @Suite
// struct `CSS Types - Angle Integration` {
//    @Test(arguments: [
//        (Angle.deg(45), "45deg"),
//        (.rad(1.57), "1.57rad"),
//        (.grad(50), "50grad"),
//        (.turn(0.5), "0.5turn")
//    ])
//    func `angle values render correctly in context`(angle: Angle, expected: String) {
//        let property = "rotate: \(angle)"
//        #expect(property == "rotate: \(expected)")
//    }
// }
//
//// MARK: - Number Type Integration
//
// @Suite
// struct `CSS Types - Number Integration` {
//    @Test(arguments: [
//        (Number(1.5), "1.5"),
//        (.init(0), "0"),
//        (.init(2.5), "2.5"),
//        (.init(100), "100")
//    ])
//    func `number values render correctly in context`(number: Number, expected: String) {
//        let property = "opacity: \(number)"
//        #expect(property == "opacity: \(expected)")
//    }
// }
//
//// MARK: - Integer Type Integration
//
// @Suite
// struct `CSS Types - Integer Integration` {
//    @Test(arguments: [
//        (Integer(1), "1"),
//        (.init(100), "100"),
//        (.init(-5), "-5"),
//        (.init(0), "0")
//    ])
//    func `integer values render correctly in context`(integer: Integer, expected: String) {
//        let property = "z-index: \(integer)"
//        #expect(property == "z-index: \(expected)")
//    }
// }
//
//// MARK: - Cross-Module Type Usage
//
// @Suite
// struct `CSS Types - Cross-Module Usage` {
//    @Test func `shared types work across modules`() {
//        // Url is in Shared module but used in many contexts
//        let url = Url("image.jpg")
//        let backgroundImage = "background-image: \(url)"
//        let listStyleImage = "list-style-image: \(url)"
//
//        #expect(backgroundImage == "background-image: url('image.jpg')")
//        #expect(listStyleImage == "list-style-image: url('image.jpg')")
//    }
//
//    @Test func `length percentage works in multiple contexts`() {
//        let lengthPct: LengthPercentage = .px(100)
//
//        // Can be used in width, margin, padding, etc.
//        let width = "width: \(lengthPct)"
//        let margin = "margin: \(lengthPct)"
//        let padding = "padding: \(lengthPct)"
//
//        #expect(width == "width: 100px")
//        #expect(margin == "margin: 100px")
//        #expect(padding == "padding: 100px")
//    }
// }
//
//// MARK: - Type Safety
//
// @Suite
// struct `CSS Types - Type Safety` {
//    @Test func `length cannot be used where angle is required`() {
//        // This test documents type safety - these types are distinct
//        let length = Length.px(100)
//        let angle = Angle.deg(45)
//
//        // Length and Angle have different descriptions
//        #expect(length.description.contains("px"))
//        #expect(angle.description.contains("deg"))
//        #expect(length.description != angle.description)
//    }
//
//    @Test func `time cannot be used where length is required`() {
//        // Time and Length are distinct types
//        let time = Time.s(1)
//        let length = Length.px(100)
//
//        #expect(time.description.contains("s"))
//        #expect(length.description.contains("px"))
//        #expect(time.description != length.description)
//    }
// }
//
//// MARK: - Complex Property Values
//
// @Suite
// struct `CSS Types - Complex Properties` {
//    @Test func `multiple transform functions combined`() {
//        let transform = "transform: \(TransformFunction.translate(.px(100), .px(50))) \(TransformFunction.rotate(.deg(45))) \(TransformFunction.scale(sx: 1.5)) \(TransformFunction.skew(.deg(10), .deg(5)))"
//
//        #expect(transform.contains("translate(100px, 50px)"))
//        #expect(transform.contains("rotate(45deg)"))
//        #expect(transform.contains("scale(1.5)"))
//        #expect(transform.contains("skew(10deg, 5deg)"))
//    }
//
//    @Test func `transition with multiple values`() {
//        let transition = "transition: width \(Time.s(0.3)) ease-in \(Time.ms(100))"
//        #expect(transition.contains("0.3s"))
//        #expect(transition.contains("100ms"))
//    }
//
//    @Test func `animation with timing and iteration`() {
//        let animation = "animation: fadeIn \(Time.s(2)) ease-in-out \(Time.s(0.5)) infinite"
//        #expect(animation.contains("2s"))
//        #expect(animation.contains("0.5s"))
//    }
// }
//
//// MARK: - Edge Cases
//
// @Suite
// struct `CSS Types - Edge Cases` {
//    @Test func `zero values across different types`() {
//        let zeroLength = Length.px(0)
//        let zeroPercentage = Percentage(0)
//        let zeroTime = Time.s(0)
//        let zeroAngle = Angle.deg(0)
//        let zeroNumber = Number(0)
//        let zeroInteger = Integer(0)
//
//        #expect(zeroLength.description == "0px")
//        #expect(zeroPercentage.description == "0%")
//        #expect(zeroTime.description == "0s")
//        #expect(zeroAngle.description == "0deg")
//        #expect(zeroNumber.description == "0")
//        #expect(zeroInteger.description == "0")
//    }
//
//    @Test func `negative values where applicable`() {
//        let negativeLength = Length.px(-100)
//        let negativeInteger = Integer(-5)
//        let negativeAngle = Angle.deg(-45)
//
//        #expect(negativeLength.description == "-100px")
//        #expect(negativeInteger.description == "-5")
//        #expect(negativeAngle.description == "-45deg")
//    }
//
//    @Test func `very large values`() {
//        let largeLength = Length.px(999999)
//        let largePercentage = Percentage(1000)
//        let largeTime = Time.s(3600)
//
//        #expect(largeLength.description == "999999px")
//        #expect(largePercentage.description == "1000%")
//        #expect(largeTime.description == "3600s")
//    }
//
//    @Test func `very small decimal values`() {
//        let smallNumber = Number(0.001)
//        let smallTime = Time.s(0.001)
//
//        #expect(smallNumber.description == "0.001")
//        #expect(smallTime.description == "0.001s")
//    }
// }
//
//// MARK: - Performance
//
// extension `Performance Tests` {
//    @Suite
//    struct `CSS Types - Performance` {
//        @Test(.timeLimit(.minutes(1)))
//        func `mixed type property generation 100K times`() {
//            for i in 0..<100_000 {
//                let length = Length.px(Double(i % 1000))
//                let time = Time.s(Double(i % 10) * 0.1)
//                _ = "transition: width \(time) ease"
//                _ = "width: \(length)"
//            }
//        }
//
//        @Test(.timeLimit(.minutes(1)))
//        func `transform function generation 100K times`() {
//            for i in 0..<100_000 {
//                let x = Double(i % 100)
//                let angle = Double(i % 360)
//                _ = TransformFunction.translate(.px(x), .px(x))
//                _ = TransformFunction.rotate(.deg(angle))
//            }
//        }
//
//        @Test(.timeLimit(.minutes(1)))
//        func `url generation 100K times`() {
//            for i in 0..<100_000 {
//                _ = Url("image\(i % 100).jpg")
//            }
//        }
//    }
// }
