//
//  RequestStatuses.swift
//  PokemonApp
//
//  Created by Anton Aliokhna on 1/25/23.
//

import Foundation

enum RequestStatuses {
    case failed(error: CustomError)
    case sucsess
    case loading
}
