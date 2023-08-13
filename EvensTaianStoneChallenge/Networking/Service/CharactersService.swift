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
    case unkown = "unknown"
}

protocol CharactersServicing : AnyObject {
    func getCharacters(page: String?, completion: @escaping (Result<[Characters], Error>) -> Void)
    func getCharacter(name: String, status: String, completion: @escaping (Result<[Characters], Error>) -> Void)
}

class CharactersService : CharactersServicing {
    
    func getCharacters(page: String? = "1", completion: @escaping (Result<[Characters], Error>) -> Void){
        ApiRequests().getCharacters(page: page, name: nil, status: nil) { result in
            DispatchQueue.main.async{
                completion(result)
            }
        }
    }
    
    func getCharacter(name: String, status: String, completion: @escaping (Result<[Characters], Error>) -> Void) {
        ApiRequests().getCharacters(page: nil, name:name, status: status) { result in
            print(result)
            DispatchQueue.main.async{
                completion(result)
            }
        }
    }
}
