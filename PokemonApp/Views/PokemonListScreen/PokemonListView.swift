//
//  PokemonListView.swift
//  PokemonApp
//
//  Created by Anton Aliokhna on 1/25/23.
//

import SwiftUI

struct PokemonListView: View {

    //MARK: For test...
    let models: [PokemonPreviewListModel] = [
        .init(name: "first", url: URL(string: "https://pokeapi.co/api/v2/pokemon/10263/")!),
        .init(name: "second", url: URL(string: "https://pokeapi.co/api/v2/pokemon/10263/")!),
        .init(name: "test", url: URL(string: "https://pokeapi.co/api/v2/pokemon/10263/")!),
        .init(name: "test", url: URL(string: "https://pokeapi.co/api/v2/pokemon/10263/")!),
        .init(name: "test", url: URL(string: "https://pokeapi.co/api/v2/pokemon/10263/")!),
        .init(name: "test", url: URL(string: "https://pokeapi.co/api/v2/pokemon/10263/")!),
        .init(name: "test", url: URL(string: "https://pokeapi.co/api/v2/pokemon/10263/")!),
        .init(name: "last", url: URL(string: "https://pokeapi.co/api/v2/pokemon/10263/")!),
        .init(name: "first", url: URL(string: "https://pokeapi.co/api/v2/pokemon/10263/")!),
        .init(name: "second", url: URL(string: "https://pokeapi.co/api/v2/pokemon/10263/")!),
        .init(name: "test", url: URL(string: "https://pokeapi.co/api/v2/pokemon/10263/")!),
        .init(name: "test", url: URL(string: "https://pokeapi.co/api/v2/pokemon/10263/")!),
        .init(name: "test", url: URL(string: "https://pokeapi.co/api/v2/pokemon/10263/")!),
        .init(name: "test", url: URL(string: "https://pokeapi.co/api/v2/pokemon/10263/")!),
        .init(name: "test", url: URL(string: "https://pokeapi.co/api/v2/pokemon/10263/")!),
        .init(name: "last", url: URL(string: "https://pokeapi.co/api/v2/pokemon/10263/")!),
    ]

    var body: some View {
        NavigationView {
            VStack {
                List(models) { model in
                    NavigationLink {
                        //TODO: For test
                        PokemonListView()
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
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
