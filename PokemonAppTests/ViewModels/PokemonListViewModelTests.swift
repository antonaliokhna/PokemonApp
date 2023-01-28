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

    func testIncrementPageWhenSwitchRightPageByEnumValue() {
        let currentPage = sut.currentPage
        let result = currentPage + 1

        sut.switchPage(side: .right)

        XCTAssert(
            sut.currentPage == result,
            "The page was not switched to the right!"
        )
    }


    func testDecrementPageWhenSwitchLeftPageByEnumValue() {
        let currentPage = sut.currentPage
        let result = currentPage + -1

        sut.switchPage(side: .left)

        XCTAssert(
            sut.currentPage == result,
            "The page was not switched to the left!"
        )
    }

    func testLoadPokemonsDataFromMockNetworkService() async {
        let resultCount = 5
        let resultStatus = RequestStatuses.sucsess

        await sut.loadPokemonsData()

        XCTAssert(
            mockNetworkService.fetchPreviewPokemonListByPageCalled,
            "The mock download method has not been executed"
        )
        XCTAssert(
            sut.status == resultStatus,
            "The method of loading pokemon ended in an error"
        )
        XCTAssert(
            sut.pokemonModel.count == resultCount,
            "The number of pokemon obtained is not equal to 5"
        )
    }

    func testChangeRequestStatusWhenReloadPokemonsData() {
        let resultRequestStatus = RequestStatuses.loading

        sut.reloadData()

        XCTAssert(
            sut.status == resultRequestStatus,
            "Request status has not changed to 'loading'"
        )
    }

    func testPreviousButtonDisableReturnTrueWhenCurrentPageEqualsOne() {
        let resultDisabledButton = true

        let sutResult = sut.previousButtonDisable

        XCTAssert(
            sutResult == resultDisabledButton,
            "Previous button does not disabled"
        )
    }

    func testNextButtonDisableReturnTrueWhenCurrentPageIsGreaterThanOrEqualOne() {
        let resultDisabledButton = true

        let sutResult = sut.nextButtonDisable

        XCTAssert(
            sutResult == resultDisabledButton,
            "Next button does not disabled"
        )
    }

}
