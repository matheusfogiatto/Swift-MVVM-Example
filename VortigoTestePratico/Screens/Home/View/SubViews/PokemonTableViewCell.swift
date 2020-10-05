//
//  PokemonTableViewCell.swift
//  VortigoTestePratico
//
//  Created by Matheus Fogiatto on 05/10/20.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {
    
    // MARK: - Constants
    public static let identifier: String = "PokemonTableViewCell"
    
    // MARK: - Outlets
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        self.selectionStyle = .none
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with pokemonType: Pokemon) {
        isSelected = false
        pokemonNameLabel.text = pokemonType.name.capitalizingFirstLetter()
        pokemonImageView.setImage(from: pokemonType.thumbnailImage, withActivityIndicator: false, withFade: true, fadeDuration: .Normal)
    }

}
