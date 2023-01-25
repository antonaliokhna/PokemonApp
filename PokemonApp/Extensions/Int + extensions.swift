//
//  Int + extensions.swift
//  PokemonApp
//
//  Created by Anton Aliokhna on 1/25/23.
//

import Foundation

extension Int {
    mutating func increment(step: Int = 1) {
        self += step
    }

    mutating func decrement(step: Int = 1) {
        self -= step
    }
}
