//
//  NetworkDataService.swift
//  PokemonApp
//
//  Created by Anton Aliokhna on 1/25/23.
//

import Foundation

class NetworkDataService {

    typealias Parameters = [String: Any]

    var dataFetcher: DataFetcherType

    init(
        dataFetcher: DataFetcher = DataFetcher(
            service: AlamofireNetworkService()
        )
    ) {
        self.dataFetcher = dataFetcher
    }

    func searchCityWeather(url: String) async throws -> DetailPokemonModel {
        let stringUrl = url

        return try await self.dataFetcher.fetchGenericData(
            url: stringUrl,
            parameters: [:]
        )
    }
}
