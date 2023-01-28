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
    
    func testChangeRequestStatusWhenReloadPokemonData() {
        let resultRequestStatus = RequestStatuses.loading
        
        sut.reloadData()
        
        XCTAssert(
            sut.status == resultRequestStatus,
            "Request status has not changed to 'loading'"
        )
    }
    
    func testLoadPokemonDataFromMockNetworkService() async {
        let resultStatus = RequestStatuses.sucsess
        
        await sut.loadPokemonData()
        
        XCTAssert(
            mockNetworkService.fetchDetailPokemonByUrlCalled,
            "The mock download method has not been executed"
        )
        XCTAssert(
            sut.status == resultStatus,
            "The method of loading pokemon ended in an error"
        )
    }
    
    func testShowImageBlockReturnFalseWhenImageLinkEqualNil() {
        let result = false
        
        let sutResult = sut.showImageBlock
        
        XCTAssert(
            sutResult == result,
            "Show image block variable returns true when image link is nil"
        )
    }
    
    func testDetailPokemonVariablesNotEmptyWhenDataLoaded() async {
        await sut.loadPokemonData()
        
        XCTAssert(
            sut.status == .sucsess,
            "Load pokemon data returns error."
        )
        XCTAssert(!sut.name.isEmpty, "Name variable is empty")
        XCTAssert(!sut.weight.isEmpty, "Weight variable is empty")
        XCTAssert(!sut.height.isEmpty, "Height variable is empty")
        XCTAssert(!sut.isDefault.isEmpty, "Default variable is empty")
        XCTAssert(!sut.type.isEmpty, "Type variable is empty")
        XCTAssert(!sut.ability.isEmpty, "Ability variable is empty")
    }
    
}


