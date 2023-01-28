//
//  DetailPokemonViewModelTests.swift
//  PokemonAppTests
//
//  Created by Anton Aliokhna on 1/28/23.
//

import Foundation

import XCTest
@testable import PokemonApp

final class DetailPokemonViewModelTests: XCTestCase {
    var sut: DetailPokemonViewModel!
    var mockNetworkService: MockNetworkDataService!

    override func setUpWithError() throws {
        try super.setUpWithError()

        mockNetworkService = MockNetworkDataService()
        sut = DetailPokemonViewModel(
            service: mockNetworkService,
            name: "Foo",
            url: "bar"
        )
    }

    override func tearDownWithError() throws {
        sut = nil
        mockNetworkService = nil

        try super.tearDownWithError()
    }

    

}
