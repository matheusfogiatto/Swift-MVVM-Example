//
//  RegisterViewModel.swift
//  VortigoTestePratico
//
//  Created by Matheus Fogiatto on 04/10/20.
//

import Foundation

protocol RegisterViewModelDelegate: class {
    func goToPokemonTypeScreen(trainerName: String)
}

class RegisterViewModel {
    
    // MARK: - Attributes
    weak var delegate: RegisterViewModelDelegate?
 
    func goToPokemonTypeScreen(trainerName: String) {
        delegate?.goToPokemonTypeScreen(trainerName: trainerName)
    }
}
