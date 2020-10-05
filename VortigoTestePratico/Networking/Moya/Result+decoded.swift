//
//  Result+decoded.swift
//  VortigoTestePratico
//
//  Created by Matheus Fogiatto on 04/10/20.
//

import Foundation
import Moya

extension Response {
    func decode<T: Decodable>(_ type: T.Type) -> Result<T, Error> {
        do {
            let decoded = try map(T.self, using: JSONDecoder.decoder)
            return .success(decoded)
        } catch {
            return .failure(error)
        }
    }
}
