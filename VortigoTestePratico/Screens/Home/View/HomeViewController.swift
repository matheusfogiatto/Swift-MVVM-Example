//
//  HomeViewController.swift
//  VortigoTestePratico
//
//  Created by Matheus Fogiatto on 05/10/20.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Attributes
    let viewModel = HomeViewModel()
    
    // MARK: - Constants
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewModel()
    }
    
    // MARK: - Configuration
    private func setupViewModel() {
        viewModel.delegate = self
    }
    
}

extension HomeViewController: HomeViewModelDelegate {
    
}
