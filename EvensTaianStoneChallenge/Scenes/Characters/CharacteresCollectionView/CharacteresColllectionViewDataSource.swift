//
//  CharacteresColllectionViewDataSource.swift
//  EvensTaianStoneChallenge
//
//  Created by Evens Taian on 11/08/23.
//

import Foundation
import UIKit

class CharactersCollectionViewDataSource: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let charactersData : [Characters] = [
        Characters(
            name: "Ricky Sanches",
            status: "Alive",
            image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"),
        Characters(
            name: "Morty Smith",
            status: "Alive",
            image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg"),
        Characters(
            name: "Summer Smith",
            status: "Alive",
            image: "https://rickandmortyapi.com/api/character/avatar/3.jpeg"),
        Characters(
            name: "Beth Smith",
            status: "Alive",
            image: "https://rickandmortyapi.com/api/character/avatar/4.jpeg"),
        Characters(
            name: "Ricky Sanches",
            status: "Alive",
            image: "https://rickandmortyapi.com/api/character/avatar/5.jpeg"),
        Characters(
            name: "Morty Smith",
            status: "Alive",
            image: "https://rickandmortyapi.com/api/character/avatar/6.jpeg"),
        Characters(
            name: "Summer Smith",
            status: "Alive",
            image: "https://rickandmortyapi.com/api/character/avatar/7.jpeg"),
        Characters(
            name: "Beth Smith",
            status: "Alive",
            image: "https://rickandmortyapi.com/api/character/avatar/8.jpeg")
    ]
    
    var didClick: ((_ character: Characters) -> Void)?
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let layout = collectionViewLayout as? UICollectionViewFlowLayout
        let space: CGFloat = (layout?.minimumInteritemSpacing ?? 0.0) + (layout?.sectionInset.left ?? 0.0) + (layout?.sectionInset.right ?? 0.0)
        let size:CGFloat = (min(collectionView.frame.size.width, collectionView.frame.size.height) - space) / 2.0
        return CGSize(width: size, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        charactersData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didClick?(charactersData[ indexPath.row ])
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! CharacterCell
        
        cell.character = charactersData[ indexPath.row ]

        return cell
    }
    
}
