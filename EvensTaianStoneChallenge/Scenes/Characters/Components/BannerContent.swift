//
//  BannerContent.swift
//  EvensTaianStoneChallenge
//
//  Created by Evens Taian on 11/08/23.
//

import Foundation
import UIKit

class BannerContent : UIView, ViewCode {
    
    lazy var image : UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "wall_rick_and_morty-1")
        img.backgroundColor = .gray
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        return img
    }()
    
    
    // MARK: Inits Methods
    init() {
        super.init(frame: .zero)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setups
    func setupView(){
        self.addSubview(image)
    }
    
    func setupConstraints(){
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: self.topAnchor),
            image.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            image.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
