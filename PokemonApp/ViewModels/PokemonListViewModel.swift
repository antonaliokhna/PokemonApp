//
//  PokemonListViewModel.swift
//  PokemonApp
//
//  Created by Anton Aliokhna on 1/25/23.
//

import Foundation

final class PokemonListViewModel: ObservableObject {

    private var newtork = NetworkDataService()
    private var currentPage: Int = 0

    @Published var status: RequestStatuses = .loading
    @Published var pokemonModel: PokemonListModel = PokemonListModel()

    var previousButtonDisable: Bool {
        return self.currentPage < 1
    }

    var nextButtonDisable: Bool {
        let value = self.currentPage *
            ApiDefaultSettings.step +
            ApiDefaultSettings.step

        return pokemonModel.count < value
    }

    init() {
        //empty init...
    }
    
}

extension PokemonListViewModel {
    @MainActor
    func loadPokemonsData() async {
        status = .loading
        do {
            let model =
                try await newtork.fetchPreviewPokemonListBy(page: currentPage)

            self.pokemonModel = model
            self.status = .sucsess

        } catch {
            guard let error = error as? CustomError else {
                self.status = .failed(error: .localError(error: .unknownError))

                return
            }
            self.status = .failed(error: error)
        }
    }

    func nextPage() {
        self.currentPage += 1

        Task {
            await loadPokemonsData()
        }
    }

    func previousPage() {
        self.currentPage -= 1

        Task {
            await loadPokemonsData()
        }
    }
}
