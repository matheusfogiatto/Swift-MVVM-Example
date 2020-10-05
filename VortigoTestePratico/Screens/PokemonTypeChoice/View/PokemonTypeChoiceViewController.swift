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
    var pokemonTypeSelected = ""
    
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
        viewModel.dissmissWithoutSave()
    }
    
    @IBAction func confirmButtonTapped(_ sender: UIButton) {
        viewModel.savePokemonType()
    }
    
}

extension PokemonTypeChoiceViewController: PokemonTypeChoiceViewModelDelegate {
    func savePokemonType() {
        UserDefaultsAccess.updatePokemonTypeName(name: pokemonTypeSelected.lowercased())
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "DoUpdateLabel"), object: nil, userInfo: nil)
        dissmissScreen()
    }
    
    func dissmissScreen() {
        self.dismiss(animated: true, completion: nil)
    }
    
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let cell = tableView.cellForRow(at: indexPath) as? PokemonTypeTableViewCell else { return }
        
        pokemonTypeSelected = cell.typeNameLabel.text ?? ""
        
        cell.isSelected = true
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? PokemonTypeTableViewCell else { return }
        
        cell.isSelected = false
    }
    
}
