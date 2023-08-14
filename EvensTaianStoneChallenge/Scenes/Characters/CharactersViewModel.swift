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
    func setupFilterCase(isFilter : Bool)
    func getCharactersData(paginate: Bool, name: String?, status: String?)
    func goToDetails(character: Characters)
    func goToFilter()
}

class CharactersViewModel : CharactersViewmodeling {
    
    // Here im using weak to avoid retain cycle
    weak var delegate: CharactersViewModelDelegate?
    
    private let service : CharactersServicing
    // Creating coordinator abstraction
    private let coordinator : CharactersCoordinating
    
    private var page = 1
    private var isFilter : Bool = false
    private var characterName : String? = nil
    private var characterStatus : String? = nil
    private var allowNewPage = true
    private var characters : [Characters] = []
    
    init(service: CharactersServicing, coordinator: CharactersCoordinating){
        self.service = service
        self.coordinator = coordinator
    }
    
    func viewDidLoad(){
        // Inform assign controller to coordinator getting by delegate
        if let controller = delegate as? CharactersViewController {
            coordinator.controller = controller
        }
        
        setupFilterCase(isFilter: false)
        getCharactersData(paginate: false)
    }
    
    func setupFilterCase(isFilter: Bool) {
        self.isFilter = isFilter
    }
    
    func getCharactersData(paginate: Bool = true, name: String? = nil, status: String? = nil){        
        if self.isFilter {
            if name != nil {
                characterName = name
            }
            
            if status != nil {
                characterStatus = status
            }
        } else {
            characterName = name
            characterStatus = status
        }
        
        if paginate {
            page += 1
        } else {
            allowNewPage = true
            page = 1
            characters = []
        }

        if allowNewPage {
            allowNewPage = false
            service.getCharacters(page: "\(self.page)", name: characterName, status: characterStatus) { [weak self] result in
                switch result {
                case .success(let characters):
                    self?.allowNewPage = true
                    self?.characters.append(contentsOf: characters)
                    if let charactersObj = self?.characters {
                        self?.delegate?.updateCharacterData(characters: charactersObj)
                    }
                    break
                default:
                    self?.allowNewPage = false
                    self?.delegate?.updateFooterMessage(message: "Personagens encontrados ✅")
                    break
                }
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
