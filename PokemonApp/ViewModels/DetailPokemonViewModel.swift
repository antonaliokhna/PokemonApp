//
//  DetailPokemonViewModel.swift
//  PokemonApp
//
//  Created by Anton Aliokhna on 1/25/23.
//

import Foundation

class DetailPokemonViewModel: ObservableObject {

    @Published var name: String = "Pokemon1"
    @Published var type: String = "gross"
    @Published var weight: String = "15.4"
    @Published var height: String = "127.2"
    @Published var ability: String = "run-away, run-away"
    @Published var isDefault: String = "Yes"

    init() {
        //empty init...
    }

}


