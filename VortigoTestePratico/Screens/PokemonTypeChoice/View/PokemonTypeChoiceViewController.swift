//
//  PokemonTypeChoiceViewController.swift
//  VortigoTestePratico
//
//  Created by Matheus Fogiatto on 04/10/20.
//

import UIKit

class PokemonTypeChoiceViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    
    
    // MARK: - Attributes
    let viewModel = PokemonTypeChoiceViewModel()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        
        viewModel.fetchPokemonTypes()
    }
    
    // MARK: - Outlets Methods
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        // dismiss
    }
    
    @IBAction func confirmButtonTapped(_ sender: UIButton) {
        // save
        // dismiss
    }
    
}

extension PokemonTypeChoiceViewController: PokemonTypeChoiceViewModelDelegate {
    func didLoadPokemonTypes() {
        tableView.reloadData()
    }
}

extension PokemonTypeChoiceViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.pokemonTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let pokemonType = viewModel.pokemonTypes[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PokemonTypeTableViewCell.identifier) as? PokemonTypeTableViewCell else { return UITableViewCell() }
        
        cell.configure(with: pokemonType)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}
