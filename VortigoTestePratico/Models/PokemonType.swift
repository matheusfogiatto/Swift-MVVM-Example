//
//  PokemonType.swift
//  VortigoTestePratico
//
//  Created by Matheus Fogiatto on 04/10/20.
//

import Foundation

struct PokemonResults<T: Decodable>: Decodable {
    let results: [T]
}

struct PokemonType: Decodable {
    
    let thumbnailImage: String
    let name: String
}
