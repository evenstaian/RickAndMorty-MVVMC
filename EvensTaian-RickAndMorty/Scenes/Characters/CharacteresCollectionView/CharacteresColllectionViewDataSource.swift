//
//  CharacteresColllectionViewDataSource.swift
//  EvensTaianStoneChallenge
//
//  Created by Evens Taian on 11/08/23.
//

import Foundation
import UIKit

class CharactersCollectionViewDataSource: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private var charactersData : [Characters] = []
    
    func reloadCollectionView(with content: [Characters]) {
        self.charactersData = content
    }
    
    var didClick: ((_ character: Characters) -> Void)?
    var didListFinishScroll: (() -> Void)?
    
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
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == charactersData.count - 1 {
            didListFinishScroll?()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            if kind == UICollectionView.elementKindSectionFooter {
                let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "FooterViewIdentifier", for: indexPath) as! ServiceMessageComponent
                footerView.messageLabel.text = "Buscando mais personagens..."
                return footerView
            }
            return UICollectionReusableView()
        }
    
}
