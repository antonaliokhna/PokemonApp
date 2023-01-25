//
//  PokemonPreviewListModel.swift
//  PokemonApp
//
//  Created by Anton Aliokhna on 1/25/23.
//

import Foundation

struct PokemonPreviewListModel: Identifiable {
    let id = UUID()

    let name: String
    let url: String
}
