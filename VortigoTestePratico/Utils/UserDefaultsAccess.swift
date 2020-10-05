//
//  UserDefaultsAccess.swift
//  VortigoTestePratico
//
//  Created by Matheus Fogiatto on 05/10/20.
//

import Foundation

class UserDefaultsAccess {

    // MARK: Constants
    private static let TRAINERNAME = "trainername"
    private static let POKEMONTYPE = "pokemontype"
    
    
    //  MARK:- Trainer Name
    static func getTrainerName() -> String {
        return UserDefaults.standard.value(forKey: TRAINERNAME) as? String ?? ""
    }
    
    static func updateTrainerName(name: String){
        UserDefaults.standard.set(name, forKey: TRAINERNAME)
    }
    
    //  MARK:- Pokemon Type
    static func getPokemonTypeName() -> String {
        return UserDefaults.standard.value(forKey: POKEMONTYPE) as? String ?? ""
    }
    
    static func updatePokemonTypeName(name: String){
        UserDefaults.standard.set(name, forKey: POKEMONTYPE)
    }


}
