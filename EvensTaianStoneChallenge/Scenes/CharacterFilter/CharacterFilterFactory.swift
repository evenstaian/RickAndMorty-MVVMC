//
//  CharacterFilterFactory.swift
//  EvensTaianStoneChallenge
//
//  Created by Evens Taian on 12/08/23.
//

import Foundation
import UIKit

enum CharacterFilterFactory {
    static func makeModule(listDelegate: CharactersViewModelDelegate?) -> UIViewController {
        let coordinator = CharacterFilterCoordinator()
        let service = CharactersService()
        let viewModel = CharacterFilterViewModel(service: service, coordinator: coordinator)
        let controller = CharacterFilterViewController(viewModel: viewModel)
        coordinator.controller = controller
        viewModel.delegate = listDelegate
        return controller
    }
}
