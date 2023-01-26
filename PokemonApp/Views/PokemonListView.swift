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
        NavigationStack {
            ZStack {
                BackroundGradientView()
                    .opacity(0.5)

                VStack {
                    switch viewModel.status {
                    case .failed(let error):
                        ErrorView(error: error, viewModel: viewModel)
                    case .sucsess:
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
                            .listRowBackground(Color.cyan.opacity(0.2))
                        }
                        .scrollContentBackground(.hidden)

                    case .loading:
                        Text("Loading...")
                    }
                }
            }
            .animation(.default, value: viewModel.status)
            .preferredColorScheme(.dark)
            .navigationTitle("Pokemons")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        Button {
                            viewModel.switchPage(side: .left)
                        } label: {
                            Image(systemName: "arrowshape.turn.up.left.circle")
                                .foregroundColor(
                                    viewModel.previousButtonDisable ? .gray : .cyan
                                        .opacity(0.8))

                        }
                        .disabled(viewModel.previousButtonDisable)

                        Button {
                            viewModel.switchPage(side: .right)
                        } label: {
                            Image(systemName: "arrowshape.turn.up.right.circle")
                                .foregroundColor(viewModel.nextButtonDisable ? .gray : .cyan.opacity(0.8))
                        }
                        .disabled(viewModel.nextButtonDisable)
                    }
                    .font(.largeTitle)
                }
            }
            .task {
                await viewModel.loadPokemonsData()
            }
        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
