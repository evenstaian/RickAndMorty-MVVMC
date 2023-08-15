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
        let service = CharacterDetailsService()
        let viewModel = CharacterDetailsViewModel(service: service, character: character)
        let controller = CharacterDetailsViewController(viewModel: viewModel)
        
        viewModel.delegate = controller
        
        return controller
    }
}
