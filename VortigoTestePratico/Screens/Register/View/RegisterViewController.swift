//
//  RegisterViewController.swift
//  VortigoTestePratico
//
//  Created by Matheus Fogiatto on 04/10/20.
//

import UIKit

class RegisterViewController: UIViewController {
    
    // MARK: - Attributes
    let viewModel = RegisterViewModel()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Configuration
    private func setupViewModel() {
        viewModel.delegate = self
    }
    
}

extension RegisterViewController: RegisterViewModelDelegate {
    
}
