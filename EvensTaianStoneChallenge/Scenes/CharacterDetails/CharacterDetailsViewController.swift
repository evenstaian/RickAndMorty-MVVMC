//
//  CharacterDetailsViewController.swift
//  EvensTaianStoneChallenge
//
//  Created by Evens Taian on 11/08/23.
//

import UIKit

class CharacterDetailsViewController: UIViewController, ViewCode {

    private let viewModel : CharacterDetailsViewModel
    private let coordinator: CharacterDetailsCoordinator
    
    private var portraitConstraints : [NSLayoutConstraint]?
    private var landscapeConstraints : [NSLayoutConstraint]?
    
    lazy var detailsHeader : DetailsHeaderComponent = {
        let view = DetailsHeaderComponent()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var characterImage : CharacterImageComponent  = {
        let view = CharacterImageComponent()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var mainInfo : MainInfoComponent = {
        let view = MainInfoComponent()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var secondaryInfo : SecondaryInfoComponent = {
        let view = SecondaryInfoComponent()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    init(viewModel: CharacterDetailsViewModel, coordinator: CharacterDetailsCoordinator){
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.coordinator.controller = self
        self.view.backgroundColor = .backgroundColor
        setupView()
        setupConstraints()
        updateAligments()
    }
    
    override func willRotate(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        if let _ = portraitConstraints, let _ = landscapeConstraints {
            updateConstraintsWithOrientation(portraitConstraints!, landscapeConstraints!)
            updateAligments()
        }
    }
    
    private func updateAligments() {
        if isPortrait() {
            mainInfo.nameLabel.textAlignment = .center
            mainInfo.specieLabel.textAlignment = .center
            mainInfo.statusLabel.textAlignment = .center
            
            secondaryInfo.genderComponent.label.textAlignment = .left
            secondaryInfo.originComponent.label.textAlignment = .left
            secondaryInfo.lastLocComponent.label.textAlignment = .left
            secondaryInfo.genderComponent.value.textAlignment = .left
            secondaryInfo.originComponent.value.textAlignment = .left
            secondaryInfo.lastLocComponent.value.textAlignment = .left
        } else {
            mainInfo.nameLabel.textAlignment = .left
            mainInfo.specieLabel.textAlignment = .left
            mainInfo.statusLabel.textAlignment = .left
            
            secondaryInfo.genderComponent.label.textAlignment = .center
            secondaryInfo.originComponent.label.textAlignment = .center
            secondaryInfo.lastLocComponent.label.textAlignment = .center
            secondaryInfo.genderComponent.value.textAlignment = .center
            secondaryInfo.originComponent.value.textAlignment = .center
            secondaryInfo.lastLocComponent.value.textAlignment = .center
        }
    }
    
    func setupView() {
        self.view.addSubview(detailsHeader)
        self.view.addSubview(characterImage)
        self.view.addSubview(mainInfo)
        self.view.addSubview(secondaryInfo)
    }
    
    func setupConstraints() {
        portraitConstraints = [
            detailsHeader.topAnchor.constraint(equalTo: self.view.topAnchor),
            detailsHeader.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            detailsHeader.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            detailsHeader.heightAnchor.constraint(equalToConstant: max(UIScreen.main.bounds.height, UIScreen.main.bounds.width) * 0.3),
            
            characterImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            characterImage.centerYAnchor.constraint(equalTo: detailsHeader.bottomAnchor),
            characterImage.widthAnchor.constraint(equalToConstant: 180),
            characterImage.heightAnchor.constraint(equalToConstant: 180),
            
            mainInfo.topAnchor.constraint(equalTo: characterImage.bottomAnchor),
            mainInfo.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            mainInfo.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            
            secondaryInfo.topAnchor.constraint(equalTo: mainInfo.bottomAnchor, constant: 20),
            secondaryInfo.leadingAnchor.constraint(equalTo: mainInfo.leadingAnchor),
            secondaryInfo.trailingAnchor.constraint(equalTo: mainInfo.trailingAnchor),
            secondaryInfo.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ]
        
        landscapeConstraints = [
            detailsHeader.topAnchor.constraint(equalTo: self.view.topAnchor),
            detailsHeader.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            detailsHeader.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            detailsHeader.widthAnchor.constraint(equalToConstant: max(UIScreen.main.bounds.height, UIScreen.main.bounds.width) * 0.3),
            
            characterImage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20),
            characterImage.centerXAnchor.constraint(equalTo: detailsHeader.trailingAnchor),
            characterImage.widthAnchor.constraint(equalToConstant: 180),
            characterImage.heightAnchor.constraint(equalToConstant: 180),
            
            mainInfo.centerYAnchor.constraint(equalTo:  characterImage.centerYAnchor),
            mainInfo.leadingAnchor.constraint(equalTo: characterImage.trailingAnchor, constant: 20),
            mainInfo.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            
            secondaryInfo.topAnchor.constraint(equalTo: mainInfo.bottomAnchor, constant: 30),
            secondaryInfo.leadingAnchor.constraint(equalTo: detailsHeader.trailingAnchor),
            secondaryInfo.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            secondaryInfo.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ]
        
        if let _ = portraitConstraints, let _ = landscapeConstraints {
            updateConstraintsWithOrientation(portraitConstraints!, landscapeConstraints!)
        }
    }
}

extension CharacterDetailsViewController : CharactersDetailsViewModelDelegate {
    func updateData(image: UIImage?, character: Characters) {
        characterImage.imageView.image = image
        mainInfo.nameLabel.text = character.name
        mainInfo.specieLabel.text = character.species
        mainInfo.statusLabel.text = character.status
        
        secondaryInfo.genderComponent.value.text = character.gender
        secondaryInfo.originComponent.value.text = character.origin.name
        secondaryInfo.lastLocComponent.value.text = character.location.name
        
        switch character.status.lowercased() {
        case CharacterStatusType.alive.rawValue:
            mainInfo.statusLabel.textColor = .aliveColor
        case CharacterStatusType.dead.rawValue:
            mainInfo.statusLabel.textColor = .deadColor
        default:
            mainInfo.statusLabel.textColor = .unknownColor
        }
    }
}
