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
        NavigationView {
            VStack {
                List(viewModel.pokemonModel.results) { model in
                    NavigationLink {
                        DetailPokemonView(
                            viewModel: DetailPokemonViewModel(
                                name: model.name,
                                url: model.url
                            )
                        )
                    } label: {
                        //TODO: Presentation text
                        Text(model.name)
                    }
                    .font(.title2)
                }
                .listStyle(.inset)

                HStack {
                    Button {
                        viewModel.previousPage()
                    } label: {
                        Image(systemName: "arrowshape.turn.up.left.circle")
                    }
                    .disabled(viewModel.previousButtonDisable)

                    Button {
                        viewModel.nextPage()
                    } label: {
                        Image(systemName: "arrowshape.turn.up.right.circle")
                    }
                    .disabled(viewModel.nextButtonDisable)
                }
                .font(.largeTitle)
                //.foregroundColor(.green)

            }
            .navigationTitle("Pokemons")
        }
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
