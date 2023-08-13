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
    
    lazy var pageName : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Character Details"
        lbl.textColor = .white
        return lbl
    }()
    
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
    }
    
    override func willRotate(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        if let _ = portraitConstraints, let _ = landscapeConstraints {
            updateConstraintsWithOrientation(portraitConstraints!, landscapeConstraints!)
        }
    }
    
    func setupView() {
        self.view.addSubview(detailsHeader)
        self.view.addSubview(characterImage)
        self.view.addSubview(pageName)
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
            
            pageName.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            pageName.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
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
            
            pageName.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            pageName.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ]
        
        if let _ = portraitConstraints, let _ = landscapeConstraints {
            updateConstraintsWithOrientation(portraitConstraints!, landscapeConstraints!)
        }
    }
}
