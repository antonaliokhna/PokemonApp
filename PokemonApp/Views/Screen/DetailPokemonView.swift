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

            switch viewModel.status {
            case .sucsess:
                VStack(spacing: 24) {
                    headerBlock
                    aboutBlock
                    imageBlock

                    Spacer()
                }
                .padding()

            case .loading:
                LoadingAnimationView()

            case .failed(let error):
                ErrorView(error: error, viewModel: viewModel)
            }
        }
        .task {
            await viewModel.loadPokemonData()
        }
    }

    private var headerBlock: some View {
        VStack {
            Text("Hi👋, i'am")
                .font(.largeTitle)
                .fontWeight(.thin)

            Text(viewModel.name)
                .font(.system(size: 42))
                .fontWeight(.regular)
                .multilineTextAlignment(.center)
        }
    }

    private var aboutBlock: some View {
        VStack(spacing: 16) {
            Text("Sooo... About me 😀")
                .font(.title)
                .fontWeight(.thin)
                .multilineTextAlignment(.center)

            VStack(alignment: .center, spacing: 12) {
                Text("Type: \(Text(viewModel.type).bold())")
                Text("Weight: \(Text(viewModel.weight).bold()) kg")
                Text("Height: \(Text(viewModel.height).bold()) cm")
                Text("Default: \(Text(viewModel.isDefault).bold())")
                Text("Ability's: \(Text(viewModel.ability).bold())")
            }
            .font(.body)
            .fontWeight(.light)
            .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .modifier(CustomDetailBlockViewModifier())
    }

    private var imageBlock: some View {
        VStack {
            Text("My photo 😇")
                .font(.title)
                .fontWeight(.thin)

            AsyncImage(url: viewModel.imageUrl) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)

            } placeholder: {
                LoadingAnimationView()
            }
            .frame(width: 128, height: 128)

            Text("I'am pretty?... 👉👈")
                .font(.subheadline)
                .italic()
        }
        .padding(.horizontal)
        .modifier(CustomDetailBlockViewModifier())
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
