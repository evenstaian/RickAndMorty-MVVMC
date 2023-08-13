//
//  CharactersCell.swift
//  EvensTaianStoneChallenge
//
//  Created by Evens Taian on 11/08/23.
//

import Foundation
import UIKit

class CharacterCell: UICollectionViewCell {
    
    var character : Characters? {
        didSet {
            name.text = character?.name
            status.text = character?.status
            let imageStore = ImageStore()
            guard let character = character else { return }
            if let imageUrl = URL(string: character.image) {
                imageStore.fetch(for: imageUrl) { [weak self] imageData, _ in
                    DispatchQueue.main.async {
                        self?.image.image = imageData
                    }
                }
            }
        }
    }
    
    lazy var card : UIView = {
        let card = UIView()
        card.translatesAutoresizingMaskIntoConstraints = false
        card.clipsToBounds = true
        card.layer.cornerRadius = 15
        card.layer.borderWidth = 1
        card.layer.borderColor = UIColor.secundaryColor.cgColor
        return card
    }()
    
    lazy var  name : UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.textAlignment = .center
        name.textColor = .primaryColor
        name.font = .systemFont(ofSize: 14)
        name.numberOfLines = 2
        return name
    }()
    
    lazy var status : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .center
        lbl.textColor = .primaryColor
        lbl.font = .systemFont(ofSize: 12)
        lbl.numberOfLines = 2
        return lbl
    }()
    
    lazy var image : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 50
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        self.addSubview(card)
        card.addSubview(image)
        card.addSubview(name)
        card.addSubview(status)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            card.topAnchor.constraint(equalTo: self.topAnchor),
            card.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            card.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            card.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            image.topAnchor.constraint(equalTo: card.topAnchor, constant: 20),
            image.widthAnchor.constraint(equalToConstant: 100),
            image.heightAnchor.constraint(equalToConstant: 100),
            image.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            name.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 20),
            name.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -5),
            name.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 5),
            
            status.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 5),
            status.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -20),
            status.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -5),
            status.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 5),
        ])
    }
}
