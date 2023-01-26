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
            let model = try await self.networkService.fetchDetailPokemonBy(url: url)

            self.name = model.name.capitalized
            self.weight = model.weight.formatted(.number)
            self.height = model.height.formatted(.number)
            self.imageUrl = model.sprites.frontDefault
            self.isDefault = model.isDefault ? "Yes" : "No"
            self.type = model.types
                .map { $0.type.name }
                .joined(separator: ", ")

            self.ability = model.abilities
                .map { $0.ability.name }
                .joined(separator: ", ")

            self.status = .sucsess

        } catch {
            guard let error = error as? CustomError else {
                self.status = .failed(error: .localError(error: .unknownError))

                return
            }
            self.status = .failed(error: error)
        }
    }
}


//MARK: ReloableDataType
extension DetailPokemonViewModel: ReloableDataType {
    func reloadData() {
        status = .loading

        Task {
            //Sleep 0.5 sec for the animation to appear on the screen
            try? await Task.sleep(for: .seconds(0.5))
            await loadPokemonData()
        }
    }
}
