//
//  PokemonTypeViewController.swift
//  VortigoTestePratico
//
//  Created by Matheus Fogiatto on 04/10/20.
//

import UIKit

class PokemonTypeViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var trainerNameLabel: UILabel!
    @IBOutlet weak var chosePokemonTypeView: UIStackView!
    
    // MARK: - Attributes
    let viewModel = PokemonTypeViewModel()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        
        trainerNameLabel.text = "Hello, \(viewModel.trainerName)!"
        
        let tapGesture = UITapGestureRecognizer(target: self, action:  #selector (self.didTapTypeChoice (_:)))
        chosePokemonTypeView.addGestureRecognizer(tapGesture)

    }
    
    // MARK: - Outlet Methods
    @objc func didTapTypeChoice(_ sender:UITapGestureRecognizer){
        viewModel.didTapTypeChoice()
    }
}

extension PokemonTypeViewController: PokemonTypeViewModelDelegate {
    func presentPokemonTypeChoice() {
        presentModallyViewController(storyboardReference: "PokemonTypeChoice", atViewController: "PokemonTypeChoice")
    }
    
}
