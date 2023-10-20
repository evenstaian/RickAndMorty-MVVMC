//
//  CharacterDetailsService.swift
//  EvensTaianStoneChallenge
//
//  Created by Evens Taian on 15/08/23.
//

import Foundation
import UIKit

protocol CharacterDetailsServicing {
    func getImage(for url:URL, completion: @escaping (UIImage?) -> Void)
}

class CharacterDetailsService : CharacterDetailsServicing {
    let imageStore = ImageStore()
    
    func getImage(for url: URL, completion: @escaping (UIImage?) -> Void) {
        imageStore.fetch(for: url) { image, _ in
            completion(image)
        }
    }
}
