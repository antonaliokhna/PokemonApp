//
//  ErrorView.swift
//  PokemonApp
//
//  Created by Anton Aliokhna on 1/26/23.
//

import SwiftUI

struct ErrorView: View {
    let error: CustomError
    let viewModel: PokemonListViewModel

    var body: some View {
        VStack(spacing: 32) {
            Image(systemName: error.errorImagePath)
                .font(.system(size: 80))
                .foregroundColor(.accentColor)

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
            .font(.title)
            .buttonStyle(.bordered)
        }
        .padding()
    }
}
struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
//        ErrorView(
//            error: .networkError(error: .invalidURL),
//            viewModel: PokemonListViewModel()
//        )
    }
}
