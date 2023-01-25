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

    private let types: [Types]
    private let ability: [Ability]

    var type: String {
        types.map{$0.type.name}.joined(separator: ", ")
    }
}

extension DetailPokemonModel {
    //MARK: Pokemon types struct
    struct Types {
        let type: Name
    }

    //MARK: Pokemon ability struct
    struct Ability {
        let ability: Name
    }

    //MARK: Name struct
    struct Name {
        let name: String
    }
}
