//
//  NetworkDataServiceType.swift
//  PokemonApp
//
//  Created by Anton Aliokhna on 1/28/23.
//

import Foundation

protocol NetworkDataServiceType {
    func fetchPreviewPokemonListBy(page: Int) async throws -> PokemonListModel
    func fetchDetailPokemonBy(url: String) async throws -> DetailPokemonModel
}
