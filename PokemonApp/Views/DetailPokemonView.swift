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
            BackroundGradientView()
                .opacity(0.5)

            switch viewModel.status {
            case .sucsess:
                VStack {
                    VStack {
                        Text("Hi👋, i'am")
                            .font(.largeTitle)

                        Text(viewModel.name)
                            .font(.system(size: 42))
                            .bold()
                            .multilineTextAlignment(.center)
                    }

                    VStack {
                        Text("Sooo... About me 😀")
                            .font(.title)
                            .multilineTextAlignment(.center)
                            .padding(.top)

                        VStack(alignment: .center, spacing: 12) {
                            Text("Type: \(Text(viewModel.type).bold())")
                            Text("Weight: \(Text(viewModel.weight).bold()) kg")
                            Text("Height: \(Text(viewModel.height).bold()) cm")
                            Text("Default: \(Text(viewModel.isDefault).bold())")
                            Text("Ability's: \(Text(viewModel.ability).bold())")
                        }
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .padding()
                    }
                    .frame(maxWidth: .infinity)
                    .background(.bar)
                    .cornerRadius(16)
                    .padding()
                    .shadow(radius: 20)

                    VStack {
                        Text("My photo 😇")
                            .font(.title)

                        AsyncImage(url: viewModel.imageUrl) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 128, height: 128)

                        } placeholder: {
                            LoadingAnimationView()
                        }

                        Text("I'am pretty?... 👉👈")
                            .font(.subheadline)
                    }
                    .padding(.horizontal)
                    .padding()
                    .background(.bar)
                    .cornerRadius(16)
                    .shadow(radius: 20)
                }

            case .loading:
                LoadingAnimationView()

            case .failed(let error):
                //TODO: change view
                ErrorView(error: error, viewModel: PokemonListViewModel())
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
                name: "bulbasaur",
                url: "https://pokeapi.co/api/v2/pokemon/1/"
            )
        )
    }
}
