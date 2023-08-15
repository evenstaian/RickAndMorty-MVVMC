//
//  CharacterDetailsViewModel.swift
//  EvensTaianStoneChallenge
//
//  Created by Evens Taian on 11/08/23.
//

import Foundation

class CharacterDetailsViewModel {
    
    // Here im using weak to avoid retain cycle
    weak var delegate: CharacterDetailsViewModelDelegate?
    
    private let service : CharacterDetailsServicing
    private let character : Characters
    
    init(service: CharacterDetailsServicing, character: Characters){
        self.service = service
        self.character = character
        setupDetailsInfos()
    }
    
    func setupDetailsInfos() {
        if let imageUrl = URL(string: character.image) {
            service.getImage(for: imageUrl) { [weak self] image in
                if let character = self?.character {
                    DispatchQueue.main.async {
                        self?.delegate?.updateData(image: image, character: character)
                    }
                }
            }
        }
    }
    
}
