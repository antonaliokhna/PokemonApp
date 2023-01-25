//
//  DetailPokemonViewModel.swift
//  PokemonApp
//
//  Created by Anton Aliokhna on 1/25/23.
//

import Foundation

class DetailPokemonViewModel: ObservableObject {

    //TODO: We have pokemon name on list view model
    @Published var name: String = ""
    @Published var type: String = ""
    @Published var weight: String = ""
    @Published var height: String = ""
    @Published var ability: String = ""
    @Published var isDefault: String = ""

    private let url: URL

    init(url: URL) {
        self.url = url

        self.loadPokemon()
    }
}


extension DetailPokemonViewModel {
    func loadPokemon() {
        name = "Pokemon1"
        type = "gross"
        weight = "15.4"
        height = "127.2"
        ability = "run-away, run-away"
        isDefault = "Yes"
    }
}
