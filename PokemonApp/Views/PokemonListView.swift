//
//  PokemonListView.swift
//  PokemonApp
//
//  Created by Anton Aliokhna on 1/25/23.
//

import SwiftUI

struct PokemonListView: View {

    @StateObject private var viewModel = PokemonListViewModel()

    var body: some View {
        ZStack {
            switch viewModel.status {
            case .sucsess:
                NavigationView {
                    VStack {
                        List(viewModel.pokemonModel.results) { model in
                            NavigationLink {
                                DetailPokemonView(
                                    viewModel: DetailPokemonViewModel(
                                        service: viewModel.networkService,
                                        name: model.name,
                                        url: model.url
                                    )
                                )
                            } label: {
                                Text(model.name)
                            }
                            .font(.title2)
                        }
                        .listStyle(.inset)

                        HStack {
                            Button {
                                viewModel.switchPage(side: .left)
                            } label: {
                                Image(systemName: "arrowshape.turn.up.left.circle")
                            }
                            .disabled(viewModel.previousButtonDisable)

                            Button {
                                viewModel.switchPage(side: .right)
                            } label: {
                                Image(systemName: "arrowshape.turn.up.right.circle")
                            }
                            .disabled(viewModel.nextButtonDisable)
                        }
                        .font(.largeTitle)
                    }
                    .navigationTitle("Pokemons")
                }
                .animation(.none, value: viewModel.status)

            case .failed(let error):
                VStack {

                }
            case .loading:
                VStack {
                    Text("Loading...")
                    Text("Loading...")
                    Text("Loading...")
                    Text("Loading...")
                }
            }

        }
        .animation(.default, value: viewModel.status)
        .task {
            await viewModel.loadPokemonsData()
        }

    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
