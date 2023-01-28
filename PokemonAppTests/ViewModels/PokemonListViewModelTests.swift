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

    override func setUpWithError() throws {
        try super.setUpWithError()

        sut = PokemonListViewModel()
    }

    override func tearDownWithError() throws {
        sut = nil

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

}
