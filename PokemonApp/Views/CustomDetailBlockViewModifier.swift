//
//  CustomDetailViewBlock.swift
//  PokemonApp
//
//  Created by Anton Aliokhna on 1/26/23.
//

import SwiftUI

struct CustomDetailBlockViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.bar)
            .cornerRadius(16)
            .shadow(radius: 20)
    }
}
