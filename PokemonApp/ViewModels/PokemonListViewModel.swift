//
//  PokemonListViewModel.swift
//  PokemonApp
//
//  Created by Anton Aliokhna on 1/25/23.
//

import Foundation

final class PokemonListViewModel: ObservableObject {

    private var newtork = NetworkDataService()

    @Published var status: RequestStatuses = .loading
    @Published var pokemonModels: [PokemonListModel.PokemonPreviewListModel] = []

    init() {
        //empty init...
    }
}

extension PokemonListViewModel {
    @MainActor
    func loadPokemonsData() async {
        do {
            let models = try await newtork.fetchPreviewPokemonListBy(page: 0)

            self.status = .sucsess
            self.pokemonModels = models.results

        } catch {
            guard let error = error as? CustomError else {
                self.status = .failed(error: .localError(error: .unknownError))

                return
            }
            self.status = .failed(error: error)
        }
    }
}
