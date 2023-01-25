//
//  PokemonListViewModel.swift
//  PokemonApp
//
//  Created by Anton Aliokhna on 1/25/23.
//

import Foundation

class PokemonListViewModel: ObservableObject {

    @Published var pokemonModels: [PokemonPreviewListModel] = []

    init() {
        //empty init...
    }

    func loadPokemons() {
        pokemonModels = [
            .init(name: "first", url: "https://pokeapi.co/api/v2/pokemon/10263/"),
        ]
    }

}
