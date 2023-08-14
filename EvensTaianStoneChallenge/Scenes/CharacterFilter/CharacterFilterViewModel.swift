//
//  CharacterFilterViewModel.swift
//  EvensTaianStoneChallenge
//
//  Created by Evens Taian on 12/08/23.
//

import Foundation

protocol CharacterFilterViewModeling : AnyObject {
    var delegate: CharactersViewModelDelegate? { get set }
    func searchCharacter(name: String)
    func setupStatus(tagStatus: Int)
}

class CharacterFilterViewModel : CharacterFilterViewModeling {
    weak var delegate: CharactersViewModelDelegate?
    
    private var characterStatus = CharacterStatusType.alive
    
    let options = [
        1 : CharacterStatusType.alive,
        2 : CharacterStatusType.dead,
        3 : CharacterStatusType.unknown,
    ]
    
    private let service : CharactersServicing
    private let coordinator : CharacterFilterCoordinating
    
    init(service: CharactersServicing, coordinator: CharacterFilterCoordinating){
        self.service = service
        self.coordinator = coordinator
    }
    
    func setupStatus(tagStatus: Int){
        if let statusType = options[tagStatus] {
            print(statusType)
            characterStatus = statusType
        }
    }

    func searchCharacter(name: String){
        self.coordinator.returnToList()
        self.delegate?.searchCharacter(name: name, status: characterStatus.rawValue)
    }
    
}
