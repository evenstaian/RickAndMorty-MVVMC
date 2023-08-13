//
//  CharactersCoordinator.swift
//  EvensTaianStoneChallenge
//
//  Created by Evens Taian on 10/08/23.
//

import Foundation
import UIKit

protocol CharactersCoordinating : AnyObject {
    var controller: UIViewController? { get set }
    func goToDetails(character: Characters)
    func goToFilter(listDelegate: CharactersViewModelDelegate?)
}

class CharactersCoordinator : CharactersCoordinating {
    weak var controller: UIViewController?
    
    func goToDetails(character: Characters) {
        let characterDetailsViewController = CharacterDetailsFactory.makeModule(character: character)
        self.controller?.navigationController?.pushViewController(characterDetailsViewController, animated: true)
    }
    
    func goToFilter(listDelegate: CharactersViewModelDelegate?) {
        let characterDetailsViewController = CharacterFilterFactory.makeModule(listDelegate: listDelegate)
        self.controller?.navigationController?.pushViewController(characterDetailsViewController, animated: true)
    }
    
}
