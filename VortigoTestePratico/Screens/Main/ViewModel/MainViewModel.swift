//
//  MainViewModel.swift
//  VortigoTestePratico
//
//  Created by Matheus Fogiatto on 04/10/20.
//

import Foundation

protocol MainViewModelDelegate: class {
    func goToRegisterScreen()
}

class MainViewModel {
    
    // MARK: - Attributes
    weak var delegate: MainViewModelDelegate?
    
    func startButtonPressed() {
        delegate?.goToRegisterScreen()
    }
    
}

