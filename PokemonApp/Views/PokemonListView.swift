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
                List(viewModel.pokemonModels) { model in
                    NavigationLink {
                        //TODO: For test
                        DetailPokemonView(
                            viewModel: DetailPokemonViewModel(url: model.url)
                        )
                    } label: {
                        Text(model.name)
                    }
                    .font(.title2)
                }
                .listStyle(.inset)

                HStack {
                    Button {
                        //back
                    } label: {
                        Image(systemName: "arrowshape.turn.up.left.circle")
                    }

                    Button {
                        //next
                    } label: {
                        Image(systemName: "arrowshape.turn.up.right.circle")
                    }
                }
                .font(.largeTitle)
                .foregroundColor(.green)

            }
            .navigationTitle("Pokemons")
        }
        .onAppear {
            viewModel.loadPokemons()
        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
