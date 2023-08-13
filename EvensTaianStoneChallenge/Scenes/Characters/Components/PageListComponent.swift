//
//  PageListComponent.swift
//  EvensTaianStoneChallenge
//
//  Created by Evens Taian on 11/08/23.
//

import Foundation
import UIKit

class PageListComponent: UIView, ViewCode {
    
    lazy var layout : UICollectionViewLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        return layout
    }()
    
    lazy var collectionView : UICollectionView = {
        let cv = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        cv.register(CharacterCell.self, forCellWithReuseIdentifier: "cell")
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.collectionViewLayout = layout
        cv.backgroundColor = .none
        return cv
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        self.addSubview(collectionView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }

}
