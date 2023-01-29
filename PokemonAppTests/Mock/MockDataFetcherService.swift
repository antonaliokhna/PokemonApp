//
//  MockDataFetcherService.swift
//  PokemonAppTests
//
//  Created by Anton Aliokhna on 1/29/23.
//

import Foundation
@testable import PokemonApp

final class MockDataFetcherService: DataFetcherServiceType {
    var fetchCalled: Bool = false
    var returnData: Data = Data(count: 0)

    func fetch(
        from url: String,
        parameters: PokemonApp.Parameters
    ) async throws -> Data {
        fetchCalled = true
        return returnData
    }
}
