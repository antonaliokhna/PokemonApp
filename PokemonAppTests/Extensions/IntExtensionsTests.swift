import XCTest
@testable import PokemonApp

final class IntExtensionsTests: XCTestCase {
    private var sut: Int!

    override func setUpWithError() throws {
        try super.setUpWithError()

        sut = Int(1)
    }

    override func tearDownWithError() throws {
        sut = nil

        try super.tearDownWithError()
    }

    func testInctement() {
        let result = 2

        sut.increment()

        XCTAssert(
            sut == result,
            "Increment extension function doesnt work"
        )
    }

    func tesDecrement() {
        let result = 0

        sut.decrement()

        XCTAssert(
            sut == result,
            "Decrement extension function doesnt work"
        )
    }
}
