//
//  CharactersViewModel.swift
//  EvensTaianStoneChallenge
//
//  Created by Evens Taian on 10/08/23.
//

import Foundation

// To respect SOLID (Dependency Injection specifically) i created
// a protocol to not implementing directly this viewModel
protocol CharactersViewmodeling : AnyObject {
    var delegate: CharactersViewModelDelegate? { get set }
    func viewDidLoad()
    func getCharactersData()
    func goToDetails(character: Characters)
    func goToFilter()
}

class CharactersViewModel : CharactersViewmodeling {
    
    // Here im using weak to avoid retain cycle
    weak var delegate: CharactersViewModelDelegate?
    
    private let service : CharactersServicing
    // Creating coordinator abstraction
    private let coordinator : CharactersCoordinating
    
    init(service: CharactersServicing, coordinator: CharactersCoordinating){
        self.service = service
        self.coordinator = coordinator
    }
    
    func viewDidLoad(){
        // Inform assign controller to coordinator getting by delegate
        if let controller = delegate as? CharactersViewController {
            coordinator.controller = controller
        }
        
        getCharactersData()
    }
    
    func getCharactersData(){
        service.getCharacters(page: nil) { [weak self] result in
            switch result {
            case .success(let characters):
                self?.delegate?.updateCharacterData(characters: characters)
                break
            default:
                break
            }
        }
    }
    
    func goToDetails(character: Characters){
        coordinator.goToDetails(character: character)
    }
    
    func goToFilter() {
        coordinator.goToFilter(listDelegate: delegate)
    }
}
