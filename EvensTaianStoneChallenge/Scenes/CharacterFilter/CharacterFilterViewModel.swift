//
//  CharacterFilterViewModel.swift
//  EvensTaianStoneChallenge
//
//  Created by Evens Taian on 12/08/23.
//

import Foundation

protocol CharacterFilterViewModeling : AnyObject {
    var delegate: CharactersViewModelDelegate? { get set }
    func searchCharacter(name: String, status: String)
}

class CharacterFilterViewModel : CharacterFilterViewModeling {
    weak var delegate: CharactersViewModelDelegate?
    
    private let service : CharactersServicing
    private let coordinator : CharacterFilterCoordinating
    
    init(service: CharactersServicing, coordinator: CharacterFilterCoordinating){
        self.service = service
        self.coordinator = coordinator
    }

    func searchCharacter(name: String, status: String){
        self.coordinator.returnToList()
        service.getCharacter(name: name, status: status) { result in
            switch result {
            case .success(let characters):
                self.delegate?.updateCharacterData(characters: characters)
            case .failure(_):
                break
            }
        }
    }
    
}
