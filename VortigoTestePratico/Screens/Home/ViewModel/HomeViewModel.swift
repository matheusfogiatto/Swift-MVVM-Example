//
//  HomeViewModel.swift
//  VortigoTestePratico
//
//  Created by Matheus Fogiatto on 05/10/20.
//

import Foundation

protocol HomeViewModelDelegate: class {
    func didLoadPokemonTypes()
    func didLoadPokemonList()
    func reloadFilterTablewView()
}

class HomeViewModel {
    
    // MARK: - Attributes
    weak var delegate: HomeViewModelDelegate?
    private let service = Service<PokemonVortigoApi>()
    var pokemonTypes: [PokemonType] = []
    var pokemonList: [Pokemon] = []
    
    // MARK: - Public Methods
    public func fetchPokemonTypes() {
        
        service.request(.getAllPokemonTypes) {
            (result: Result<PokemonResults<PokemonType>,Error>) in
            
            switch result {
            
            case .failure(let error):
                print(error.localizedDescription)
                
            case.success(let result):
                self.pokemonTypes = result.results
                self.delegate?.didLoadPokemonTypes()
            }
        }
    }
    
    public func fetchAllPokemons() {
        service.request(.getAllPokemons) {
            (result: Result<[Pokemon],Error>) in
            switch result {
            
            case .failure(let error):
                print(error.localizedDescription)
                
            case.success(let result):
                self.pokemonList = result
                self.delegate?.didLoadPokemonList()
            }
        }
    }
    
    public func getPokemonListFiltred() -> [Pokemon] {
        return pokemonList.filter { $0.type.contains(UserDefaultsAccess.getPokemonTypeName()) }
    }
    
    public func reloadFilterTablewView() {
        delegate?.reloadFilterTablewView()
    }
    
}
