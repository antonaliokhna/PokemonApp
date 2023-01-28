//
//  NetworkDataService.swift
//  PokemonApp
//
//  Created by Anton Aliokhna on 1/25/23.
//

import Foundation

final class NetworkDataService {

    private let dataFetcher: DataFetcherType

    init(
        dataFetcher: DataFetcher = DataFetcher(
            service: AlamofireNetworkService()
        )
    ) {
        self.dataFetcher = dataFetcher
    }
}

//MARK: NetworkDataServiceType
extension NetworkDataService: NetworkDataServiceType {
    func fetchPreviewPokemonListBy(page: Int) async throws -> PokemonListModel {
        let url = "https://pokeapi.co/api/v2/pokemon"

        let parameters: Parameters = [
            "offset": page * ApiDefaultSettings.step,
            "limit": ApiDefaultSettings.step,
        ]

        return try await dataFetcher.fetchGenericData(
            url: url,
            parameters: parameters
        )
    }

    func fetchDetailPokemonBy(url: String) async throws -> DetailPokemonModel {
        return try await self.dataFetcher.fetchGenericData(
            url: url,
            parameters: [:]
        )
    }
}
