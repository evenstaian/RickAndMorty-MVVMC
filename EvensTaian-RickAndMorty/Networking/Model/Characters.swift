//
//  Characters.swift
//  EvensTaianStoneChallenge
//
//  Created by Evens Taian on 13/08/23.
//

import Foundation

struct Characters : Decodable, Equatable {
    let id : Int
    let name : String
    let status : String
    let species : String
    let gender : String
    let image : String
    let origin : CharacterLocation
    let location : CharacterLocation
}

struct CharacterLocation : Decodable, Equatable {
    let name : String
    let url : String
}
