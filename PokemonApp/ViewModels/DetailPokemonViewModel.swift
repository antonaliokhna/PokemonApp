//
//  DetailPokemonViewModel.swift
//  PokemonApp
//
//  Created by Anton Aliokhna on 1/25/23.
//

import Foundation

final class DetailPokemonViewModel: ObservableObject {

    private let networkService: NetworkDataService
    private let url: String

    @Published var status: RequestStatuses = .loading
    @Published var name: String = ""
    @Published var type: String = ""
    @Published var weight: String = ""
    @Published var height: String = ""
    @Published var ability: String = ""
    @Published var isDefault: String = ""
    @Published var imageUrl: URL?

    init(
        service: NetworkDataService,
        name: String,
        url: String
    ) {
        self.networkService = service
        self.name = name
        self.url = url
    }
}

//MARK: DetailPokemonViewModel internal functions
extension DetailPokemonViewModel {
    @MainActor
    func loadPokemonData() async {
        do {
            let model = try await networkService.fetchDetailPokemonBy(url: url)

            self.type = model.type
            self.weight = model.weight.description
            self.height = model.height.description
            self.ability = model.abilitiesString
            self.imageUrl = model.image
            self.isDefault = model.isDefault ? "Yes" : "No"

            self.status = .sucsess

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
            await loadPokemonData()
        }
    }
}
