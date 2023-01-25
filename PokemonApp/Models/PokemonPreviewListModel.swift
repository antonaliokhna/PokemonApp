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

    //MARK: PokemonPreviewListModel
    struct PokemonPreviewListModel: Codable {
        let name: String
        let url: String
    }
}

extension PokemonListModel.PokemonPreviewListModel: Identifiable {
    var id: String {
        return name
    }
}
