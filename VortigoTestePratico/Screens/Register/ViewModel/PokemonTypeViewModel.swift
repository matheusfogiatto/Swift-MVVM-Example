//
//  PokemonTypeViewModel.swift
//  VortigoTestePratico
//
//  Created by Matheus Fogiatto on 04/10/20.
//

import Foundation

protocol PokemonTypeViewModelDelegate: class {
    
}

class PokemonTypeViewModel {
    
    // MARK: - Attributes
    weak var delegate: PokemonTypeViewModelDelegate?
    var trainerName: String = ""
    let service = Service<PokemonVortigoApi>()
    var pokemonTypes: [PokemonType] = []
    
    // MARK: - Public Methods
    public func fetchPokemonTypes() {
        
        service.request(.getAllPokemonTypes) {
            (result: Result<PokemonResults<PokemonType>,Error>) in
            
            switch result {
            
            case .failure(let error):
                print(error.localizedDescription)
                
            case.success(let result):
                print(result.results)
            }
        }
    }
    
}
