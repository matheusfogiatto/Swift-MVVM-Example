//
//  ApiError.swift
//  VortigoTestePratico
//
//  Created by Matheus Fogiatto on 04/10/20.
//

import Foundation

struct ApiError: LocalizedError, Decodable {
    
    let message: String
    
    init(status: Int, message: String) {
        self.message = message
    }
    
    public var errorDescription: String? {
        return message
    }
    
}
