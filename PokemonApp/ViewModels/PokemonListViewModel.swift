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
            .init(name: "first", url: URL(string: "https://pokeapi.co/api/v2/pokemon/10263/")!),
            .init(name: "second", url: URL(string: "https://pokeapi.co/api/v2/pokemon/10263/")!),
            .init(name: "test", url: URL(string: "https://pokeapi.co/api/v2/pokemon/10263/")!),
            .init(name: "test", url: URL(string: "https://pokeapi.co/api/v2/pokemon/10263/")!),
            .init(name: "test", url: URL(string: "https://pokeapi.co/api/v2/pokemon/10263/")!),
            .init(name: "test", url: URL(string: "https://pokeapi.co/api/v2/pokemon/10263/")!),
            .init(name: "test", url: URL(string: "https://pokeapi.co/api/v2/pokemon/10263/")!),
            .init(name: "last", url: URL(string: "https://pokeapi.co/api/v2/pokemon/10263/")!),
            .init(name: "first", url: URL(string: "https://pokeapi.co/api/v2/pokemon/10263/")!),
            .init(name: "second", url: URL(string: "https://pokeapi.co/api/v2/pokemon/10263/")!),
            .init(name: "test", url: URL(string: "https://pokeapi.co/api/v2/pokemon/10263/")!),
            .init(name: "test", url: URL(string: "https://pokeapi.co/api/v2/pokemon/10263/")!),
            .init(name: "test", url: URL(string: "https://pokeapi.co/api/v2/pokemon/10263/")!),
            .init(name: "test", url: URL(string: "https://pokeapi.co/api/v2/pokemon/10263/")!),
            .init(name: "test", url: URL(string: "https://pokeapi.co/api/v2/pokemon/10263/")!),
            .init(name: "last", url: URL(string: "https://pokeapi.co/api/v2/pokemon/10263/")!),
        ]
    }

}
