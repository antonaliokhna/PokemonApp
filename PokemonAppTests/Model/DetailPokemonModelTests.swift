//
//  DetailPokemonModelTests.swift
//  PokemonAppTests
//
//  Created by Anton Aliokhna on 1/29/23.
//


import XCTest
@testable import PokemonApp

final class DetailPokemonModelTests: XCTestCase {
    var sut: DetailPokemonModel!

    override func setUpWithError() throws {
        try super.setUpWithError()

        sut = DetailPokemonModel(
            name: "charizard",
            height: 17,
            weight: 905,
            isDefault: true,
            sprites: .init(frontDefault: nil),
            types: [
                .init(type: .init(name: "fire")),
                .init(type: .init(name: "flying")),
            ],
            abilities: [
                .init(ability: .init(name: "blaze")),
                .init(ability: .init(name: "solar-power")),
              ]
        )
    }

    override func tearDownWithError() throws {
        sut = nil

        try super.tearDownWithError()
    }

    func testCorrectInstanse() {
        XCTAssert(sut.name == "charizard", "Incorrect name")
        XCTAssert(sut.height == 17, "Incorrect height")
        XCTAssert(sut.weight == 905, "Incorrect weight")
        XCTAssertTrue(sut.isDefault, "Incorrect 'default'")
        XCTAssertNil(sut.sprites.frontDefault, "Incorrect url")
        XCTAssert(sut.types.count == 2, "Incorrect count types")
        XCTAssert(sut.abilities.count == 2, "Incorrect count abilities")
    }
}
