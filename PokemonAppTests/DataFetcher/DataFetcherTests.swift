//
//  DataFetcherTests.swift
//  PokemonAppTests
//
//  Created by Anton Aliokhna on 1/29/23.
//

import XCTest
@testable import PokemonApp

final class DataFetcherTests: XCTestCase {
    private var sut: DataFetcher!
    private var mockService: MockDataFetcherService!

    override func setUpWithError() throws {
        try super.setUpWithError()

        mockService = MockDataFetcherService()
        sut = DataFetcher(service: mockService)
    }

    override func tearDownWithError() throws {
        sut = nil
        mockService = nil

        try super.tearDownWithError()
    }

    private func testFetchGenericDataMethodCalled() async {
        do {
            let _: PokemonListModel =
            try await sut.fetchGenericData(
                url: "foo",
                parameters: [:]
            )
        } catch {
            //Empty
        }

        XCTAssertTrue(
            mockService.fetchCalled,
            "Method fetch doesn't called when fetchGenericData executed"
        )
    }

    func testFetchGenericDataReturnDecodingDataFailedError() async {
        mockService.returnData = Data(count: 0)

        do {
            let _: Data =
            try await sut.fetchGenericData(
                url: "foo",
                parameters: [:]
            )
        } catch {
            guard case CustomError.codableError(
                error: .decodingDataFailed
            ) = error else {
                XCTFail("FetchGenericData returns another error")

                return
            }
        }
    }

    func testCorrectFetchPokemonListData() async throws {
        let pokemonList = PokemonListModel()
        guard let pokemonData =
                try? JSONEncoder().encode(pokemonList) else {
            XCTFail("Encode PokemonListData failed")

            return
        }
        mockService.returnData = pokemonData

        let resultPokemonList: PokemonListModel =
        try await sut.fetchGenericData(
            url: "foo",
            parameters: [:]
        )

        XCTAssert(
            pokemonList.count == resultPokemonList.count,
            "Incorrect data decoding (count)"
        )
        XCTAssert(
            pokemonList.results.count == resultPokemonList.results.count,
            "Incorrect data decoding (returl count)"
        )
    }

    func testCorrectFetchDefailPokemonListData() async throws {
        let detailPokemonModel = DetailPokemonModel(
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

        guard let detailPokemonData =
                try? JSONEncoder().encode(detailPokemonModel) else {
            XCTFail("Encode DetailPokemonModel failed")

            return
        }
        mockService.returnData = detailPokemonData

        let resultDetailPokemonModel: DetailPokemonModel =
        try await sut.fetchGenericData(
            url: "foo",
            parameters: [:]
        )

        XCTAssert(
            detailPokemonModel.name == resultDetailPokemonModel.name,
            "Name not equal \(detailPokemonModel.name) after decoding"
        )
        XCTAssert(
            detailPokemonModel.weight == resultDetailPokemonModel.weight,
            "Weight not equal \(detailPokemonModel.weight) after decoding"
        )
        XCTAssert(
            detailPokemonModel.height == resultDetailPokemonModel.height,
            "Height not equal \(detailPokemonModel.height) after decoding"
        )
        XCTAssert(
            detailPokemonModel.isDefault == resultDetailPokemonModel.isDefault,
            "'default' not equal \(detailPokemonModel.isDefault) after decoding"
        )
    }
}
