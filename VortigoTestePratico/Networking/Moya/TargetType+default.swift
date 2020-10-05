//
//  TargetType+default.swift
//  VortigoTestePratico
//
//  Created by Matheus Fogiatto on 04/10/20.
//

import Foundation
import Moya

extension TargetType {

    var sampleData: Data { Data() }

    var headers: [String : String]? {
        ["Content-type":"application/json"]
    }
    
    func makeParamsDictionary(_ params: [String: Any?]) -> [String: Any] {
        
        var adjustedParams: [String: Any] = [:]
        
        for key in Array(params.keys) {
            if let content = params[key] {
                adjustedParams[key] = content
            }
        }
        
        return adjustedParams
    }
}

