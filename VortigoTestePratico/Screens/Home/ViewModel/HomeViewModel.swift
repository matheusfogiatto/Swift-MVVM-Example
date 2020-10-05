//
//  HomeViewModel.swift
//  VortigoTestePratico
//
//  Created by Matheus Fogiatto on 05/10/20.
//

import Foundation

protocol HomeViewModelDelegate: class {

}

class HomeViewModel {
    
    // MARK: - Attributes
    weak var delegate: HomeViewModelDelegate?

}
