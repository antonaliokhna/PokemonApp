//
//  NetworkDataService.swift
//  PokemonApp
//
//  Created by Anton Aliokhna on 1/25/23.
//

import Foundation

class NetworkDataService {

    var dataFetcher: DataFetcherType

    init(
        dataFetcher: DataFetcher = DataFetcher(
            service: AlamofireNetworkService()
        )
    ) {
        self.dataFetcher = dataFetcher
    }

    func fetchDetailPokemonBy(url: String) async throws -> DetailPokemonModel {
        return try await self.dataFetcher.fetchGenericData(
            url: url,
            parameters: [:]
        )
    }
}
