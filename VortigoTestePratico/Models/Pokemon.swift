//
//  Pokemon.swift
//  VortigoTestePratico
//
//  Created by Matheus Fogiatto on 05/10/20.
//

import Foundation

struct Pokemon: Decodable {
    
    let abilities: [String]
    let detailPageURL: String
    let weight: Double
    let weakness: [String]
    let number: String
    let height: Double
    let collectibles_slug: String
    let featured: String
    let slug: String
    let name: String
    let thumbnailAltText: String
    let thumbnailImage: String
    let id: Int
    let type: [String]
}

