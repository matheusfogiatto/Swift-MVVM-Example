//
//  UIImageView+Extensions.swift
//  VortigoTestePratico
//
//  Created by Matheus Fogiatto on 05/10/20.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    
    static var placeholder: UIImage? {
        return UIImage(ciImage: .gray)
    }
    
    func setImage(
        from urlString: String,
        placeholder: UIImage? = UIImageView.placeholder,
        withActivityIndicator: Bool = false,
        withFade: Bool = true,
        fadeDuration: FadeDuration = .Normal ) {
        
        
        let url = URL(string: urlString)
        self.kf.indicatorType = withActivityIndicator ? .activity : .none
        self.kf.setImage(with: url, placeholder: placeholder, options: [.transition(.fade(fadeDuration.time))])
    }
    
    enum FadeDuration {
        
        case None
        case Fast
        case Normal
        case Slow
        
        var time: Double {
            switch self {
            case .None: return 0
            case .Fast: return 0.1
            case .Normal: return 0.2
            case .Slow: return 0.8
            }
        }
    }
}
