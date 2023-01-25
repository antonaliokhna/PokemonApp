//
//  CustomError.swift
//  PokemonApp
//
//  Created by Anton Aliokhna on 1/25/23.
//

import Foundation

enum CustomError: Error {
    case networkError(error: NetworkError)
    case codableError(error: CodableError)
}

extension CustomError: LocalizedError {
    var errorDescription: String? {
        let description: String?
        switch self {
        case .networkError(let error):
            description = error.errorDescription
        case .codableError(let error):
            description = error.errorDescription
        }

        return description
    }
}
