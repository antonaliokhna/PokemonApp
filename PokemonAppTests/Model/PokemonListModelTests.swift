//
//  PokemonListModelTests.swift
//  PokemonAppTests
//
//  Created by Anton Aliokhna on 1/29/23.
//

import XCTest
@testable import PokemonApp

final class PokemonListModelTests: XCTestCase {
    var sut: PokemonListModel!

    override func setUpWithError() throws {
        try super.setUpWithError()

        sut = PokemonListModel()
    }

    override func tearDownWithError() throws {
        sut = nil

        try super.tearDownWithError()
    }

    func testCorrectEmptyInstanse() {
        XCTAssertNotNil(
            sut,
            "Error initialization PokemonListModel"
        )
        XCTAssert(
            sut.count == 0,
            "Variable count, after an empty initialization is not equal to zero"
        )
        XCTAssertTrue(
            sut.results.isEmpty,
            "PokemonListModel results, after an empty initialization not empty"
        )
    }

    func testCorrectInstanseWithParameters() {
        sut = PokemonListModel(
            count: 5,
            results: [
                .init(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/"),
                .init(name: "ivysaur", url: "https://pokeapi.co/api/v2/pokemon/2/"),
                .init(name: "venusaur", url: "https://pokeapi.co/api/v2/pokemon/3/"),
                .init(name: "charmander", url: "https://pokeapi.co/api/v2/pokemon/4/"),
                .init(name: "charmeleon", url: "https://pokeapi.co/api/v2/pokemon/5/"),
            ]
        )

        XCTAssert(
            sut.count == 5 && sut.results.count == 5,
            "Incorrect values after initialization with parameters"
        )
    }
}
