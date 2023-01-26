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
                    case .sucsess:
                        secsessList
                    case .loading:
                        LoadingAnimationView()
                    case .failed(let error):
                        ErrorView(error: error, viewModel: viewModel)
                    }
                }
            }
            .navigationTitle("Pokemons")
            .preferredColorScheme(.dark)
            .animation(.default, value: viewModel.status)
            .toolbar {
                ToolbarItemGroup(placement: .status) {
                    toolbarStack
                }
            }
            .task {
                await viewModel.loadPokemonsData()
            }
        }
    }

    private var toolbarStack: some View {
        HStack(spacing: 24) {
            Button {
                viewModel.switchPage(side: .left)
            } label: {
                Image(systemName: "arrowshape.turn.up.left.circle")
                    .foregroundColor(
                        viewModel.previousButtonDisable
                        ? .gray
                        : .cyan.opacity(0.8)
                    )

            }
            .disabled(viewModel.previousButtonDisable)

            Button {
                viewModel.switchPage(side: .right)
            } label: {
                Image(systemName: "arrowshape.turn.up.right.circle")
                    .foregroundColor(
                        viewModel.nextButtonDisable
                        ? .gray
                        : .cyan.opacity(0.8)
                    )
            }
            .disabled(viewModel.nextButtonDisable)
        }
        .font(.largeTitle)
        .offset(y: 8)
    }

    private var secsessList: some View {
        List(viewModel.pokemonModel.results) { model in
            NavigationLink {
                DetailPokemonView(
                    viewModel: DetailPokemonViewModel(
                        service: viewModel.networkService,
                        name: model.capitalizedName,
                        url: model.url
                    )
                )
            } label: {
                Text(model.capitalizedName)
            }
            .font(.title2)
            .listRowBackground(Color.cyan.opacity(0.2))
        }
        .scrollContentBackground(.hidden)
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
