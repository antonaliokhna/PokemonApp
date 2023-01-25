//
//  DetailPokemonView.swift
//  PokemonApp
//
//  Created by Anton Aliokhna on 1/25/23.
//

import SwiftUI

struct DetailPokemonView: View {
    @State private var name = "Pokemon1"
    @State private var image = Image(systemName: "xmark")
    @State private var type = "gross"
    @State private var weight = "15.4"
    @State private var height = "127.2"
    @State private var ability = "run-away, run-away"
    @State private var isDefault = false

    var body: some View {
        ZStack {
            Color.yellow.ignoresSafeArea()

            VStack {
                Text("Characterictics of \n\(Text(name).bold())")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)

                HStack() {
                    VStack(alignment: .leading) {
                        Text("Pokemon type: \(Text(type).bold())")
                        Text("Weight (kg): \(Text(weight.description).bold())")
                        Text("Height (cm): \(Text(height.description).bold())")
                        Text("Default: \(Text(isDefault ? "yes": "no").bold())")
                        Text("Ability's: \(Text(ability).bold())")
                    }
                    .padding(.trailing)

                    Spacer()

                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 96, height: 96)
                }
                .padding(.horizontal)
            }
            .frame(maxWidth: .infinity)
            .background(.green)
            .cornerRadius(16)
            .padding()
        }
    }
}

struct DetailPokemonView_Previews: PreviewProvider {
    static var previews: some View {
        DetailPokemonView()
    }
}
