//
//  PageListComponent.swift
//  EvensTaianStoneChallenge
//
//  Created by Evens Taian on 11/08/23.
//

import Foundation
import UIKit

class PageListComponent: UIView, ViewCode {
    
    let klayoutLineSpacing : CGFloat = 10
    let klayoutInterItmSpacing : CGFloat = 10
    
    lazy var layout : UICollectionViewLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = klayoutLineSpacing
        layout.minimumInteritemSpacing = klayoutInterItmSpacing
        return layout
    }()
    
    lazy var refresher : UIRefreshControl = {
        let view = UIRefreshControl()
        view.tintColor = .secundaryColor
        return view
    }()
    
    lazy var collectionView : UICollectionView = {
        let cv = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        cv.register(CharacterCell.self, forCellWithReuseIdentifier: "cell")
        cv.register(ServiceMessageComponent.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "FooterViewIdentifier")
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.collectionViewLayout = layout
        cv.backgroundColor = .none
        cv.addSubview(refresher)
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
    
    func startRefresher() {
       refresher.beginRefreshing()
     }
    
    func stopRefresher() {
        refresher.endRefreshing()
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
