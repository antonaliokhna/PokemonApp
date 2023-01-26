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

//MARK: RequestStatuses: Equatable
extension RequestStatuses: Equatable {
    static func == (lhs: RequestStatuses, rhs: RequestStatuses) -> Bool {
        lhs.value == rhs.value
    }

    private var value: String? {
        return String(describing: self).components(separatedBy: "(").first
    }
}
