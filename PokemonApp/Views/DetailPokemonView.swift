//
//  DetailPokemonView.swift
//  PokemonApp
//
//  Created by Anton Aliokhna on 1/25/23.
//

import SwiftUI

struct DetailPokemonView: View {

    @StateObject var viewModel: DetailPokemonViewModel

    var body: some View {
        ZStack {
            switch viewModel.status {

            case .loading:
                Text("Loading")

            case .sucsess:
                Color.yellow.ignoresSafeArea()
                VStack {
                    Text("Characterictics of \n\(Text(viewModel.name).bold())")
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)

                    HStack() {
                        VStack(alignment: .leading) {
                            Text("Pokemon type: \(Text(viewModel.type).bold())")
                            Text("Weight (kg): \(Text(viewModel.weight).bold())")
                            Text("Height (cm): \(Text(viewModel.height).bold())")
                            Text("Default: \(Text(viewModel.isDefault).bold())")
                            Text("Ability's: \(Text(viewModel.ability).bold())")
                        }
                        .padding(.trailing)

                        Spacer()

                        Image(systemName: "xmark")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 96, height: 96)
                    }
                    .padding()
                }
                .frame(maxWidth: .infinity)
                .background(.green)
                .cornerRadius(16)
                .padding()

            case .failed(let error):
                Text("error")
                Text(error.localizedDescription)
            }
        }
        .task {
            await viewModel.loadPokemon()
        }
    }
}

struct DetailPokemonView_Previews: PreviewProvider {
    static var previews: some View {
        DetailPokemonView(
            viewModel: DetailPokemonViewModel(
                url: URL(string: "https://pokeapi.co/api/v2/pokemon/10263/")!
            )
        )
    }
}
