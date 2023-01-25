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

                        AsyncImage(url: viewModel.imageUrl) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 128, height: 128)

                        } placeholder: {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .yellow))
                                .scaleEffect(3)
                        }
                    }
                    .padding()
                }
                .frame(maxWidth: .infinity)
                .background(.green)
                .cornerRadius(16)
                .padding()

            case .failed(let error):
                VStack(spacing: 32) {
                    Image(systemName: error.errorImagePath)
                        .font(.system(size: 80))
                    Text(error.localizedDescription)
                        .font(.title2)
                        .multilineTextAlignment(.center)

                    Button() {
                        viewModel.reloadPokemonData()
                    } label: {
                        Label {
                            Text("Reload")
                        } icon: {
                            Image(systemName: "restart.circle")
                        }
                    }
                    .font(.title2)
                    .buttonStyle(.bordered)
                }
                .padding()
            }
        }
        .task {
            await viewModel.loadPokemonData()
        }
    }
}

struct DetailPokemonView_Previews: PreviewProvider {
    static var previews: some View {
        DetailPokemonView(
            viewModel: DetailPokemonViewModel(
                service: NetworkDataService(),
                name: "Pokemon",
                url: "https://pokeapi.co/api/v2/pokemon/10263"
            )
        )
    }
}
