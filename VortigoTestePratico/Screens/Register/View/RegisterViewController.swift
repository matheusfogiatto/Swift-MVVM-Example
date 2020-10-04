//
//  RegisterViewController.swift
//  VortigoTestePratico
//
//  Created by Matheus Fogiatto on 04/10/20.
//

import UIKit

class RegisterViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var userNameTextField: UITextField!
    
    // MARK: - Attributes
    let viewModel = RegisterViewModel()
    
    // MARK: - Constants
    private let SEGUE_REGISTER2_ID = "goToNextRegister"
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewModel()
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))

        view.addGestureRecognizer(tap)
        
        userNameTextField.delegate = self
    }
    
    // MARK: - Configuration
    private func setupViewModel() {
        viewModel.delegate = self
    }
    
    // MARK: - Outlet Methods
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        guard let trainerName = userNameTextField.text else { return }
        
        if trainerName == "" {
            alert(message: "You need to set a Name!")
        } else {
            viewModel.goToPokemonTypeScreen(trainerName: trainerName)
        }
        
    }
    
}

extension RegisterViewController: RegisterViewModelDelegate {
    func goToPokemonTypeScreen(trainerName: String) {
        performSegue(withIdentifier: SEGUE_REGISTER2_ID, sender: trainerName)
    }
}

// MARK: - Navigation
extension RegisterViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let pokemonTypeViewController = segue.destination as? PokemonTypeViewController else { return }
        let trainerName = sender as? String
        pokemonTypeViewController.viewModel.trainerName = trainerName ?? ""
        
    }
    
}

extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}
