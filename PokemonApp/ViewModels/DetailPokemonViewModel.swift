//
//  DetailPokemonViewModel.swift
//  PokemonApp
//
//  Created by Anton Aliokhna on 1/25/23.
//

import Foundation

final class DetailPokemonViewModel: ObservableObject {

    private var newtork = NetworkDataService()

    @Published var status: RequestStatuses = .loading

    //TODO: We have pokemon name on list view model
    @Published var name: String = ""
    @Published var type: String = ""
    @Published var weight: String = ""
    @Published var height: String = ""
    @Published var ability: String = ""
    @Published var isDefault: String = ""

    private let url: URL

    init(url: URL) {
        self.url = url
    }
}


//
extension DetailPokemonViewModel {
    @MainActor
    func loadPokemonData() async {
        do {
            let model = try await newtork.searchCityWeather(
                url: "https://pokeapi.co/api/v2/pokemon/10263/"
            )

            self.status = .sucsess
            self.name = model.name
            self.type = model.type
            self.weight = model.weight.description
            self.height = model.height.description

        } catch {
            guard let error = error as? CustomError else {
                status = .failed(error: .localError(error: .unknownError))

                return
            }

            self.status = .failed(error: error)
        }
    }

    func reloadPokemonData() {
        status = .loading
        Task {
            await loadPokemon()
        }
    }
}
