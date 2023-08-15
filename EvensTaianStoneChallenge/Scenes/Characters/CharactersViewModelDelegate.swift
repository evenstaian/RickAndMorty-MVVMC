//
//  CharactersDelegate.swift
//  EvensTaianStoneChallenge
//
//  Created by Evens Taian on 11/08/23.
//

import Foundation

// I created a delegate to return comunicate between ViewModel and ViewController
// and avoid retain cyle
// NSObject was used to allow operator weak and afirm that protocol will used by a class
protocol CharactersViewModelDelegate : NSObject {
    func showProgress()
    func updateFooterMessage(message: String)
    func updateCharacterData(characters: [Characters])
    func searchCharacter(name: String, status: String?)
}
