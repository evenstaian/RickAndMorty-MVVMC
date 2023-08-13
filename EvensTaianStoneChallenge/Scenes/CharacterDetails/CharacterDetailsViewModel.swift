//
//  CharacterDetailsViewModel.swift
//  EvensTaianStoneChallenge
//
//  Created by Evens Taian on 11/08/23.
//

import Foundation

class CharacterDetailsViewModel {
    
    // Here im using weak to avoid retain cycle
    weak var controller: CharacterDetailsViewController?
    
    private let character : Characters
    
    init(character: Characters){
        self.character = character
        setupDetailsInfos()
    }
    
    func setupDetailsInfos() {
        let imageStore = ImageStore()
        
        if let imageUrl = URL(string: character.image) {
            imageStore.fetch(for: imageUrl) { image, _ in
                DispatchQueue.main.async {
                    self.controller?.characterImage.imageView.image = image
                }
            }
        }
    }
    
}
