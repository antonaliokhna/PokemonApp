//
//  BackroundGradientView.swift
//  PokemonApp
//
//  Created by Anton Aliokhna on 1/26/23.
//

import SwiftUI

struct BackroundGradientView: View {
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    var body: some View {
        let cutomColorScheme =
            colorScheme == .dark
            ? ColorTheme.dark
            : ColorTheme.light

        let gradient = Gradient(colors: cutomColorScheme)
        let linearGradient = LinearGradient(
            gradient: gradient,
            startPoint: .top,
            endPoint: .bottom
        )

        let background = Rectangle()
            .fill(linearGradient)
            .edgesIgnoringSafeArea(.all)

        return background
    }
}

struct BackroundGradientView_Previews: PreviewProvider {
    static var previews: some View {
        BackroundGradientView()
    }
}
