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
    @IBOutlet weak var pokemonTypeLabel: UILabel!
    
    // MARK: - Attributes
    let viewModel = PokemonTypeViewModel()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        
        trainerNameLabel.text = "Hello, \(viewModel.trainerName)!"
        
        let tapGesture = UITapGestureRecognizer(target: self, action:  #selector (self.didTapTypeChoice (_:)))
        chosePokemonTypeView.addGestureRecognizer(tapGesture)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateLabel), name: NSNotification.Name(rawValue: "DoUpdateLabel"), object: nil)
        
    }
    
    // MARK: - Outlet Methods
    @objc func didTapTypeChoice(_ sender:UITapGestureRecognizer){
        viewModel.didTapTypeChoice()
    }
    
    @objc func updateLabel() {
        pokemonTypeLabel.text = UserDefaultsAccess.getPokemonTypeName()
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        guard let typeName = pokemonTypeLabel.text else { return }
        
        if typeName == "" {
            alert(message: "You need to set a favorite Pokemon Type!")
        } else {
            UserDefaultsAccess.updateTrainerName(name: viewModel.trainerName)
            viewModel.goToHomeScreen()
        }
    }
    
}

extension PokemonTypeViewController: PokemonTypeViewModelDelegate {
    func goToHomeScreen() {
        goToStoryboard(storyboardReference: "Home")
    }
    
    func presentPokemonTypeChoice() {
        presentModallyViewController(storyboardReference: "PokemonTypeChoice", atViewController: "PokemonTypeChoice")
    }
    
}
