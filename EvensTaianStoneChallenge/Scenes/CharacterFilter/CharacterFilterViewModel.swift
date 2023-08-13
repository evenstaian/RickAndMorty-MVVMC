//
//  CharacterFilterViewModel.swift
//  EvensTaianStoneChallenge
//
//  Created by Evens Taian on 12/08/23.
//

import Foundation

protocol CharacterFilterViewModeling : AnyObject {
    var delegate: CharactersViewModelDelegate? { get set }
    func viewDidLoad()
    func searchCharacter(name: String, status: String)
}

class CharacterFilterViewModel : CharacterFilterViewModeling {
    weak var delegate: CharactersViewModelDelegate?
    
    private let coordinator : CharacterFilterCoordinating
    
    init(coordinator: CharacterFilterCoordinating){
        self.coordinator = coordinator
    }
    
    func viewDidLoad(){
        // Inform assign controller to coordinator getting by delegate
        if let _ = coordinator.controller {

        }
    }
    
    func searchCharacter(name: String, status: String){
        delegate?.searchCharacter(name: name, status: status)
        coordinator.returnToList()
    }
    
}
