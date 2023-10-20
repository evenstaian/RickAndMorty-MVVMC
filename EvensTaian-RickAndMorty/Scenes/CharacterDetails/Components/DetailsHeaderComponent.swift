//
//  DetailsHeaderComponent.swift
//  EvensTaianStoneChallenge
//
//  Created by Evens Taian on 12/08/23.
//

import Foundation
import UIKit

class DetailsHeaderComponent : UIView, ViewCode {
    
     lazy var bannerImage : UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "wall_rick_and_morty-2")
        img.backgroundColor = .gray
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        return img
    }()
    
    lazy var unfocusView : UIView = {
        let img = UIView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.backgroundColor = .black
        img.layer.opacity = 0.5
        return img
   }()

    init(){
        super.init(frame: .zero)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupView() {
        self.addSubview(bannerImage)
        self.addSubview(unfocusView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            bannerImage.topAnchor.constraint(equalTo: self.topAnchor),
            bannerImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bannerImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bannerImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            unfocusView.topAnchor.constraint(equalTo: self.topAnchor),
            unfocusView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            unfocusView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            unfocusView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
}
