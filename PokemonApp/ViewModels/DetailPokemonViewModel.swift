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

extension DetailPokemonViewModel {
    func loadPokemon() async {
        do {
            let model = try await newtork.searchCityWeather(
                url: "https://pokeapi.co/api/v2/pokemon/10263/"
            )

            await MainActor.run { [weak self] in
                guard let self = self else { return }
                self.status = .sucsess

                self.name = model.name
                self.type = model.type
                self.weight = model.weight.description
                self.height = model.height.description
            }

        } catch let error as CustomError {
            status = .failed(error: error)
        } catch {
            status = .failed(error: .localError(error: .unknownError))
        }
    }
}
