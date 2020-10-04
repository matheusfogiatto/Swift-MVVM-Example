//
//  ViewController.swift
//  VortigoTestePratico
//
//  Created by Matheus Fogiatto on 04/10/20.
//


import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var startButton: UIButton!
    
    // MARK: - Attributes
    let viewModel = MainViewModel()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewModel()
        setDesignForButton()
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Configuration
    private func setupViewModel() {
        viewModel.delegate = self
    }
    
    // MARK: - Layout Configuration
    func setDesignForButton(){
        startButton.layer.cornerRadius = 10
    }
    
    // MARK: - Outlet Methods
    @IBAction func startButtonTouched(_ sender: UIButton) {
        viewModel.startButtonPressed()
    }
    
    
}

extension MainViewController: MainViewModelDelegate {
    func goToRegisterScreen() {
        goToStoryboard(storyboardReference: "Register")
    }
}
