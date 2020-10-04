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
    
}
