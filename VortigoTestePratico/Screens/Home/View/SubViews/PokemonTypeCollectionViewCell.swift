//
//  PokemonTypeCollectionViewCell.swift
//  VortigoTestePratico
//
//  Created by Matheus Fogiatto on 05/10/20.
//

import UIKit

class PokemonTypeCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Constants
    public static let identifier: String = "PokemonTypeCollectionViewCell"
    
    // MARK: Outlets
    @IBOutlet weak var pokemonTypeImageView: UIImageView!
    @IBOutlet weak var pokemonTypeTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with pokemonType: PokemonType) {
        pokemonTypeImageView.image = UIImage()
        pokemonTypeTitleLabel.text = ""
        pokemonTypeTitleLabel.text = pokemonType.name.capitalizingFirstLetter()
        pokemonTypeImageView.setImage(from: pokemonType.thumbnailImage, withActivityIndicator: false, withFade: true, fadeDuration: .Normal)
    }
    
}
