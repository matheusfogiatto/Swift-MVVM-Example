//
//  PokemonTypeViewModel.swift
//  VortigoTestePratico
//
//  Created by Matheus Fogiatto on 04/10/20.
//

import Foundation

protocol PokemonTypeViewModelDelegate: class {
    func presentPokemonTypeChoice()
}

class PokemonTypeViewModel {
    
    // MARK: - Attributes
    weak var delegate: PokemonTypeViewModelDelegate?
    var trainerName: String = ""
    
    func didTapTypeChoice() {
        delegate?.presentPokemonTypeChoice()
    }
    
}
