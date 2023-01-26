//
//  DetailPokemonModel.swift
//  PokemonApp
//
//  Created by Anton Aliokhna on 1/25/23.
//

import Foundation

struct DetailPokemonModel: Codable {
    let name: String
    let height: Double
    let weight: Double
    let isDefault: Bool

    let sprites: Sprites
    let types: [Types]
    let abilities: [Ability]
}

//MARK: DetailPokemonModel structures
extension DetailPokemonModel {
    struct Types: Codable {
        let type: Name
    }

    struct Ability: Codable {
        let ability: Name
    }

    struct Name: Codable {
        let name: String
    }

    struct Sprites: Codable {
        let frontDefault: URL
    }
}
