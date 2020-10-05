//
//  String+Extensions.swift
//  VortigoTestePratico
//
//  Created by Matheus Fogiatto on 05/10/20.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
