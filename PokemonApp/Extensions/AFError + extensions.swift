//
//  AFError + extensions.swift
//  PokemonApp
//
//  Created by Anton Aliokhna on 1/25/23.
//

import Foundation
import Alamofire

extension AFError {
    var convertToNetworkError: NetworkError {
        let networkError: NetworkError
        switch self {
        case .invalidURL:
            networkError = .invalidURL
        case .sessionTaskFailed(URLError.notConnectedToInternet):
            networkError = .internetConnectionFailed
        case .sessionTaskFailed(URLError.networkConnectionLost):
            networkError = .internetConnectionFailed
        case .sessionTaskFailed(URLError.cannotConnectToHost):
           networkError = .internetConnectionFailed
        case .sessionTaskFailed(URLError.timedOut):
            networkError = .requestTimeOut
        default:
            networkError = .requestFailed(statusCode: self.responseCode)
        }

        return networkError
    }
}
