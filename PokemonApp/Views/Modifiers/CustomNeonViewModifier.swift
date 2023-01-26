//
//  CustomNeonViewModifier.swift
//  PokemonApp
//
//  Created by Anton Aliokhna on 1/26/23.
//

import Foundation
import SwiftUI

struct CustomNeonViewModifier: ViewModifier {

    let logicValue: Bool

    func body(content: Content) -> some View {
        content
            .foregroundColor(
                logicValue
                ? .gray.opacity(0.8)
                : .cyan.opacity(0.8)
            )
            .shadow(
                color: logicValue
                ? .gray.opacity(0.8)
                : .cyan.opacity(0.8),
                radius: 5
            )
    }
}
