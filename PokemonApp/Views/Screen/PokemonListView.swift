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
            .navigationTitle("Pokemon's")
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
        .shadow(color: .cyan.opacity(0.5), radius: 5)
    }

    private var toolbarStack: some View {
        HStack(spacing: 24) {
            toolbarLeftButton

            pageManagerStack
                .shadow(color: .cyan.opacity(0.3), radius: 5)

            toolbarRightButton
        }
        .font(.largeTitle)
        .offset(y: 8)
    }

    private var toolbarLeftButton: some View {
        Button {
            viewModel.switchPage(side: .left)
        } label: {
            Image(systemName: "chevron.left.circle")
                .modifier(CustomNeonViewModifier(
                    logicValue: viewModel.previousButtonDisable)
                )
        }
        .disabled(viewModel.previousButtonDisable)
    }

    private var toolbarRightButton: some View {
        Button {
            viewModel.switchPage(side: .right)
        } label: {
            Image(systemName: "chevron.right.circle")
                .modifier(CustomNeonViewModifier(
                    logicValue: viewModel.nextButtonDisable)
                )
        }
        .disabled(viewModel.nextButtonDisable)
    }

    private var pageManagerStack: some View {
        HStack {
            Text(viewModel.currentPage.formatted())
                .frame(width: 38)

            Text("/")
            Text(viewModel.countPages.formatted())
                .frame(width: 38)
        }
        .font(.title)
        .frame(width: 104)
        .shadow(color: .cyan.opacity(0.3), radius: 5)
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
