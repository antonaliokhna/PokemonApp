//
//  PokemonListViewModelTests.swift
//  PokemonAppTests
//
//  Created by Anton Aliokhna on 1/28/23.
//

import XCTest
@testable import PokemonApp

final class PokemonListViewModelTests: XCTestCase {
    var sut: PokemonListViewModel!
    var mockNetworkService: MockNetworkDataService!

    override func setUpWithError() throws {
        try super.setUpWithError()

        mockNetworkService = MockNetworkDataService()
        sut = PokemonListViewModel(networkService: mockNetworkService)
    }

    override func tearDownWithError() throws {
        sut = nil
        mockNetworkService = nil

        try super.tearDownWithError()
    }

    func testSwitchRightPageByEnumValue() throws {
        let currentPage = sut.currentPage
        let result = currentPage + 1

        sut.switchPage(side: .right)

        XCTAssert(sut.currentPage == result, "The page was not switched to the right!")
    }


    func testSwitchLeftPageByEnumValue() throws {
        let currentPage = sut.currentPage
        let result = currentPage + -1

        sut.switchPage(side: .left)

        XCTAssert(sut.currentPage == result, "The page was not switched to the left!")
    }

    func testLoadPokemonsDataFromMockNetworkService() async throws {
        let resultCount = 5
        let resultStatus = RequestStatuses.sucsess

        await sut.loadPokemonsData()

        XCTAssert(
            mockNetworkService.fetchPreviewPokemonListByPageCalled,
                  "The mock download method has not been executed"
        )
        XCTAssert(sut.status == resultStatus,
                  "The method of loading pokemon ended in an error"
        )
        XCTAssert(
            sut.pokemonModel.count == resultCount,
            "The number of pokemon obtained is not equal to 5"
        )
    }

}
