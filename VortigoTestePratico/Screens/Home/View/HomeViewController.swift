//
//  HomeViewController.swift
//  VortigoTestePratico
//
//  Created by Matheus Fogiatto on 05/10/20.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - Attributes
    let viewModel = HomeViewModel()
    
    // MARK: - Constants
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewModel()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        tableView.delegate = self
        tableView.dataSource = self
        
        viewModel.fetchPokemonTypes()
        viewModel.fetchAllPokemons()
    }
    
    // MARK: - Configuration
    private func setupViewModel() {
        viewModel.delegate = self
    }
    
}

extension HomeViewController: HomeViewModelDelegate {
    func reloadFilterTablewView() {
        self.tableView.reloadData()
    }
    
    func didLoadPokemonList() {
        self.tableView.reloadData()
    }
    
    func didLoadPokemonTypes() {
        self.collectionView.reloadData()
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getPokemonListFiltred().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let pokemon = viewModel.getPokemonListFiltred()[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PokemonTableViewCell.identifier) as? PokemonTableViewCell else { return UITableViewCell() }
        
        cell.configure(with: pokemon)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.pokemonTypes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let pokemonType = viewModel.pokemonTypes[indexPath.row]
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonTypeCollectionViewCell.identifier, for: indexPath) as? PokemonTypeCollectionViewCell else { return UICollectionViewCell() }
        
        cell.configure(with: pokemonType)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let cell = collectionView.cellForItem(at: indexPath) as? PokemonTypeCollectionViewCell else { return }
        
        UserDefaultsAccess.updatePokemonTypeName(name: cell.pokemonTypeTitleLabel.text?.lowercased() ?? "")
        
        viewModel.reloadFilterTablewView()
    }
    
}
