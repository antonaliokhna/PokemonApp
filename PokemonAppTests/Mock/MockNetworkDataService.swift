//
//  MockNetworkDataService.swift
//  PokemonAppTests
//
//  Created by Anton Aliokhna on 1/28/23.
//

import Foundation
@testable import PokemonApp

class MockNetworkDataService: NetworkDataServiceType {
    var fetchPreviewPokemonListByPageCalled: Bool = false
    var fetchDetailPokemonByUrlCalled: Bool = false

    func fetchPreviewPokemonListBy(page: Int) async throws -> PokemonListModel {
        fetchPreviewPokemonListByPageCalled = true

        return PokemonListModel(
            count: 5,
            results: [
                .init(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/"),
                .init(name: "ivysaur", url: "https://pokeapi.co/api/v2/pokemon/2/"),
                .init(name: "venusaur", url: "https://pokeapi.co/api/v2/pokemon/3/"),
                .init(name: "charmander", url: "https://pokeapi.co/api/v2/pokemon/4/"),
                .init(name: "charmeleon", url: "https://pokeapi.co/api/v2/pokemon/5/"),
            ]
        )
    }

    func fetchDetailPokemonBy(url: String) async throws -> DetailPokemonModel {
        fetchDetailPokemonByUrlCalled = true

        return DetailPokemonModel(
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
    }
}
