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
    var allPokemons: [Pokemon] = []
    
    var filter: String?
    var showldDisplaySearch: Bool = false
    
    // MARK: - Computed Attributes
    var pokemonList: [Pokemon] {
        
        if showldDisplaySearch {
            
            guard let filter = filter else { return [] }
            return allPokemons.filter({ $0.name.containsIgnoringCase(filter) })
        }
        else {
            
            return allPokemons
        }
    }
    
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
                self.allPokemons = result
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
    
    public func applySearch(withFilter filter: String) {
        self.filter = filter
        showldDisplaySearch = true
        delegate?.didLoadPokemonList()
    }
    
    public func cancelSearch() {
        filter = nil
        showldDisplaySearch = false
        delegate?.didLoadPokemonList()
    }
    
}
