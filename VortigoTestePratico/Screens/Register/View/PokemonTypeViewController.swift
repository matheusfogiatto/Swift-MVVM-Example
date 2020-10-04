//
//  PokemonTypeViewController.swift
//  VortigoTestePratico
//
//  Created by Matheus Fogiatto on 04/10/20.
//

import UIKit

class PokemonTypeViewController: UIViewController {
    
    // MARK: - Attributes
    let viewModel = PokemonTypeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self

        // Do any additional setup after loading the view.
    }
}

extension PokemonTypeViewController: PokemonTypeViewModelDelegate {
    
}
