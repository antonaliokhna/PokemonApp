//
//  PokemonPreviewListModel.swift
//  PokemonApp
//
//  Created by Anton Aliokhna on 1/25/23.
//

import Foundation

struct PokemonListModel: Codable {
    var count: Int = 0
    var results: [PokemonPreviewListModel] = []
}

//MARK: PokemonListModel structures
extension PokemonListModel {
    struct PokemonPreviewListModel: Codable {
        let name: String
        let url: String

        var capitalizedName: String {
            return name.capitalized
        }
    }
}

//MARK: PokemonPreviewListModel Identifiable
extension PokemonListModel.PokemonPreviewListModel: Identifiable {
    var id: String {
        return name
    }
}
