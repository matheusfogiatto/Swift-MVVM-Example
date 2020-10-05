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
        self.selectionStyle = .none
        super.setSelected(selected, animated: animated)
    }
    
    override var isSelected: Bool {
        didSet {
            super.isSelected = isSelected
            self.typeSelectImage.image = isSelected ? UIImage(named: "radioOn") : UIImage(named: "radioOff")
        }
    }
    
    func configure(with pokemonType: PokemonType) {
        isSelected = false
        typeNameLabel.text = pokemonType.name.capitalizingFirstLetter()
        typeImageView.setImage(from: pokemonType.thumbnailImage, withActivityIndicator: false, withFade: true, fadeDuration: .Normal)
    }
    
}
