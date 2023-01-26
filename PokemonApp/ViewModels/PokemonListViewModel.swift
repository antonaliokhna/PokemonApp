//
//  PokemonListViewModel.swift
//  PokemonApp
//
//  Created by Anton Aliokhna on 1/25/23.
//

import Foundation

final class PokemonListViewModel: ObservableObject {

    var networkService: NetworkDataService = NetworkDataService()

    @Published private(set) var currentPage: Int = 1
    @Published private(set) var countPages: Int = 0
    @Published var pokemonModel: PokemonListModel = PokemonListModel()
    @Published var status: RequestStatuses = .loading

    var previousButtonDisable: Bool {
        return currentPage <= 1
    }

    var nextButtonDisable: Bool {
        return currentPage >= countPages || pokemonModel.count == 0
    }
}

//MARK: PokemonListViewModel internal functions
extension PokemonListViewModel {
    @MainActor
    func loadPokemonsData() async {
        do {
            let model =
                try await self.networkService.fetchPreviewPokemonListBy(
                    page: currentPage
                )

            self.pokemonModel = model

            let countPage = model.count / ApiDefaultSettings.step
            self.countPages = Int(exactly: countPage) ?? 0

            self.status = .sucsess

        } catch {
            self.pokemonModel.count = 0

            guard let error = error as? CustomError else {
                self.status = .failed(error: .localError(error: .unknownError))

                return
            }
            self.status = .failed(error: error)
        }
    }

    func switchPage(side: DirectionSide) {
        status = .loading

        switch side {
        case .left:
            currentPage.decrement()
        case .right:
            currentPage.increment()
        }

        Task {
            await loadPokemonsData()
        }
    }
}

//MARK: ReloableDataType
extension PokemonListViewModel: ReloableDataType {
    func reloadData() {
        status = .loading

        Task {
            //Sleep 0.5 sec for the animation to appear on the screen
            try? await Task.sleep(for: .seconds(0.5))
            await loadPokemonsData()
        }
    }
}
