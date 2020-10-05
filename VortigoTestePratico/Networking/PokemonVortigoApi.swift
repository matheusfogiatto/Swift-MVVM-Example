//
//  PokemonVortigoApi.swift
//  VortigoTestePratico
//
//  Created by Matheus Fogiatto on 04/10/20.
//

import Foundation
import Moya

enum PokemonVortigoApi {
    case getAllPokemonTypes
    case getAllPokemons
}

extension PokemonVortigoApi: TargetType {
    
    var baseURL: URL {
        return URL(string: "https://vortigo.blob.core.windows.net/files/pokemon/data")!
    }

    var path: String {
        switch self {
        case .getAllPokemonTypes: return "/types.json"
        case .getAllPokemons: return "/pokemons.json"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getAllPokemonTypes: return .get
        case .getAllPokemons: return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getAllPokemonTypes: return .requestPlain
        case .getAllPokemons: return .requestPlain
        }
    }
}

