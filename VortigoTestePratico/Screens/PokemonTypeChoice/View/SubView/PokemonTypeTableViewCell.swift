//
//  PokemonTypeTableViewCell.swift
//  VortigoTestePratico
//
//  Created by Matheus Fogiatto on 04/10/20.
//

import UIKit

class PokemonTypeTableViewCell: UITableViewCell {
    
    // MARK: - Constants
    public static let identifier: String = "PokemonTypeTableViewCell"
    
    // MARK: Outlets
    @IBOutlet weak var typeImageView: UIImageView!
    @IBOutlet weak var typeNameLabel: UILabel!
    @IBOutlet weak var typeSelectImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configure(with pokemonType: PokemonType) {
        typeNameLabel.text = pokemonType.name
    }
    
}
