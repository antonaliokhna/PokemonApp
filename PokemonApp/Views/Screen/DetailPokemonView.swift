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
                .shadow(color: .teal.opacity(0.5), radius: 5)
        }
    }

    private var aboutBlock: some View {
        VStack(spacing: 16) {
            Text("Sooo... About me 😀")
                .font(.title)
                .fontWeight(.thin)
                .multilineTextAlignment(.center)

            textAboutBlockCharacteristics
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
                .shadow(color: .cyan.opacity(0.3), radius: 5)
        }
        .padding(.horizontal)
        .modifier(CustomDetailBlockViewModifier())
    }

    private var textAboutBlockCharacteristics: some View {
        VStack(alignment: .center, spacing: 12) {
            getCustomNeonTextBy(
                title: "Type:",
                text: viewModel.type
            )
            getCustomNeonTextBy(
                title: "Weight:",
                text: viewModel.weight,
                closerText: "kg"
            )
            getCustomNeonTextBy(
                title: "Height:",
                text: viewModel.height,
                closerText: "cm"
            )
            getCustomNeonTextBy(
                title: "Default:",
                text: viewModel.isDefault
            )
            getCustomNeonTextBy(
                title: "Ability's:",
                text: viewModel.ability
            )
        }
        .font(.body)
        .fontWeight(.light)
        .multilineTextAlignment(.center)
    }
}

//MARK: Helpful DetailPokemonView private functions
extension DetailPokemonView {
    private func getCustomNeonTextBy(
        title: String,
        text: String,
        closerText: String = ""
    ) -> some View {
        return HStack {
            Text(title)

            Text(text)
                .bold()
                .shadow(color: .cyan.opacity(0.3), radius: 5)

            Text(closerText)
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
