//
//  JSONDecoder+Extensions.swift
//  VortigoTestePratico
//
//  Created by Matheus Fogiatto on 04/10/20.
//

import Foundation

extension JSONDecoder {
    
    static var decoder: JSONDecoder {
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .millisecondsSince1970
        return decoder
    }
}
