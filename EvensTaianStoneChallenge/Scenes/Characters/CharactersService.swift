//
//  CharactersService.swift
//  EvensTaianStoneChallenge
//
//  Created by Evens Taian on 12/08/23.
//

import Foundation

enum CharacterStatusType: String {
    case alive = "alive"
    case dead = "dead"
    case unknown = "unknown"
}

protocol CharactersServicing : AnyObject {
    func getCharacters(page: String?, name: String?, status: String?, completion: @escaping (Result<[Characters], Error>) -> Void)
}

class CharactersService : CharactersServicing {
    
    func getCharacters(page: String? = "1", name: String?, status: String?, completion: @escaping (Result<[Characters], Error>) -> Void){
        ApiRequests().getCharacters(page: page, name: name, status: status) { result in
            DispatchQueue.main.async{
                completion(result)
            }
        }
    }
}
