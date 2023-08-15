//
//  CharacterDetailsFactory.swift
//  EvensTaianStoneChallenge
//
//  Created by Evens Taian on 11/08/23.
//

import Foundation
import UIKit

enum CharacterDetailsFactory {
    static func makeModule(character: Characters) -> UIViewController {
        let coordinator = CharacterDetailsCoordinator()
        let viewModel = CharacterDetailsViewModel(character: character)
        let controller = CharacterDetailsViewController(viewModel: viewModel, coordinator: coordinator)
        
        viewModel.delegate = controller
        
        return controller
    }
}
