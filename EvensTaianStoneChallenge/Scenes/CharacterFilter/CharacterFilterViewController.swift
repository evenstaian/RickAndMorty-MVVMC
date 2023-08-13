//
//  CharacterFilterViewController.swift
//  EvensTaianStoneChallenge
//
//  Created by Evens Taian on 12/08/23.
//

import UIKit

class CharacterFilterViewController: UIViewController, ViewCode {
    
    private let viewModel : CharacterFilterViewModeling
    
    private var portraitConstraints : [NSLayoutConstraint]?
    private var landscapeConstraints : [NSLayoutConstraint]?
    
    lazy var filterBanner : FilterBannerComponent = {
        let view = FilterBannerComponent()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var filterContent : FilterContentComponent = {
        let view = FilterContentComponent()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init(viewModel : CharacterFilterViewModeling){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .filterBackgroundColor
        viewModel.viewDidLoad()
        setupView()
        setupConstraints()
        setupClicks()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let _ = portraitConstraints, let _ = landscapeConstraints {
            updateConstraintsWithOrientation(portraitConstraints!, landscapeConstraints!)
        }
    }
    
    override func willRotate(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        if let _ = portraitConstraints, let _ = landscapeConstraints {
            updateConstraintsWithOrientation(portraitConstraints!, landscapeConstraints!)
        }
    }
    
    func setupClicks(){
        filterContent.filterBtn.addTarget(self, action: #selector(searchCharacter), for: .touchUpInside)
    }
    
    @objc
    func searchCharacter(){
        let inputedName = filterContent.nameInput.text ?? ""
        let inputedStatus = "alived"
        viewModel.searchCharacter(name: inputedName, status: inputedStatus)
    }
    
    func setupView() {
        self.view.addSubview(filterBanner)
        self.view.addSubview(filterContent)
    }
    
    func setupConstraints() {
        portraitConstraints = [
            filterBanner.topAnchor.constraint(equalTo: self.view.topAnchor),
            filterBanner.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            filterBanner.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            filterBanner.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            filterContent.topAnchor.constraint(equalTo: self.view.topAnchor),
            filterContent.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            filterContent.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            filterContent.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ]
        
        landscapeConstraints = [
            filterBanner.topAnchor.constraint(equalTo: self.view.topAnchor),
            filterBanner.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            filterBanner.widthAnchor.constraint(equalToConstant: max(UIScreen.main.bounds.height, UIScreen.main.bounds.width)  * 0.4),
            filterBanner.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            filterContent.topAnchor.constraint(equalTo: self.view.topAnchor),
            filterContent.leadingAnchor.constraint(equalTo: filterBanner.trailingAnchor),
            filterContent.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor),
            filterContent.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ]
        
        if let _ = portraitConstraints, let _ = landscapeConstraints {
            updateConstraintsWithOrientation(portraitConstraints!, landscapeConstraints!)
        }
    }

}
