//
//  CharactersViewController.swift
//  EvensTaianStoneChallenge
//
//  Created by Evens Taian on 10/08/23.
//

import UIKit

class CharactersViewController: UIViewController, ViewCode {
    
    private let viewModel : CharactersViewmodeling
    private let charactersCollectionDataSource = CharactersCollectionViewDataSource();
    private var portraitConstraints : [NSLayoutConstraint]?
    private var landscapeConstraints : [NSLayoutConstraint]?
    
    let kPortraitBannerContentHeightMultiply = 0.3
    let kPortraitPageDescriptionTopMargin : CGFloat = 20
    let kPortraitPageDescriptionLeadingMargin : CGFloat = 20
    let kPortraitPageDescriptionTrailingMargin : CGFloat = -20
    let kPortraitErrorComponentLeadingMargin : CGFloat = 20
    let kPortraitErrorComponentTrailingMargin : CGFloat = -20
    let kPortraitPageListTopMargin : CGFloat = 20
    let kPortraitPageListLeadingMargin : CGFloat = 20
    let kPortraitPageListTrailingMargin : CGFloat = -20
    
    lazy var bannerContent : BannerContent = {
        let view = BannerContent()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var pageDescription : PageDescriptionComponent = {
        let view = PageDescriptionComponent()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var errorComponent : ServiceErrorComponent = {
        let view = ServiceErrorComponent()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var pageList : PageListComponent = {
        let view = PageListComponent()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.collectionView.delegate = charactersCollectionDataSource
        view.collectionView.dataSource = charactersCollectionDataSource
        return view
    }()

    init(viewModel: CharactersViewmodeling){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .backgroundColor
        self.navigationController?.navigationBar.tintColor = .white
        self.viewModel.delegate = self
        self.viewModel.viewDidLoad()
        setupView()
        setupConstraints()
        setupClicks()
        showProgress()
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
        pageDescription.filterBtn.addTarget(self, action: #selector(goToFilter), for: .touchUpInside)
        pageList.refresher.addTarget(self, action: #selector(refreshList), for: .valueChanged)
        errorComponent.retryButton.addTarget(self, action: #selector(refreshList), for: .touchUpInside)
        charactersCollectionDataSource.didClick = {
            character in
            self.viewModel.goToDetails(character: character)
        }
        charactersCollectionDataSource.didListFinishScroll = {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.viewModel.getCharactersData(paginate: true, name: nil, status: nil)
            }
        }
    }
    
    @objc
    func goToFilter() {
        viewModel.goToFilter()
    }
    
    @objc
    func refreshList() {
        viewModel.setupFilterCase(isFilter: false)
        viewModel.getCharactersData(paginate: false, name: nil, status: nil)
    }
    
    func scrollToTop() {
        if !pageList.collectionView.isHidden {
            let indexPath = IndexPath(item: 0, section: 0)
            pageList.collectionView.scrollToItem(at: indexPath, at: .top, animated: true)
        }
    }

    func setupView() {
        self.view.addSubview(bannerContent)
        self.view.addSubview(pageDescription)
        self.view.addSubview(errorComponent)
        self.view.addSubview(pageList)
    }
    
    func setupConstraints() {
        portraitConstraints = [
            bannerContent.topAnchor.constraint(equalTo: self.view.topAnchor),
            bannerContent.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            bannerContent.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            bannerContent.heightAnchor.constraint(equalToConstant: max(UIScreen.main.bounds.height, UIScreen.main.bounds.width) * kPortraitBannerContentHeightMultiply),
            
            pageDescription.topAnchor.constraint(equalTo: self.bannerContent.bottomAnchor, constant: kPortraitPageDescriptionTopMargin),
            pageDescription.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: kPortraitPageDescriptionLeadingMargin),
            pageDescription.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: kPortraitPageDescriptionTrailingMargin),
            
            errorComponent.topAnchor.constraint(equalTo: self.pageDescription.bottomAnchor),
            errorComponent.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: kPortraitErrorComponentLeadingMargin),
            errorComponent.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: kPortraitErrorComponentTrailingMargin),
            errorComponent.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            pageList.topAnchor.constraint(equalTo: self.pageDescription.bottomAnchor, constant: kPortraitPageListTopMargin),
            pageList.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: kPortraitPageListLeadingMargin),
            pageList.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: kPortraitPageListTrailingMargin),
            pageList.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ]
        
        landscapeConstraints = [
            bannerContent.topAnchor.constraint(equalTo: self.view.topAnchor),
            bannerContent.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            bannerContent.widthAnchor.constraint(equalToConstant: max(UIScreen.main.bounds.height, UIScreen.main.bounds.width)  * 0.4),
            bannerContent.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            pageDescription.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            pageDescription.leadingAnchor.constraint(equalTo: bannerContent.trailingAnchor, constant: 20),
            pageDescription.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            errorComponent.topAnchor.constraint(equalTo: pageDescription.bottomAnchor),
            errorComponent.leadingAnchor.constraint(equalTo: bannerContent.trailingAnchor, constant: max(UIScreen.main.bounds.height, UIScreen.main.bounds.width)  * 0.05),
            errorComponent.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -(max(UIScreen.main.bounds.height, UIScreen.main.bounds.width)  * 0.05)),
            errorComponent.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            pageList.topAnchor.constraint(equalTo: pageDescription.bottomAnchor, constant: 20),
            pageList.leadingAnchor.constraint(equalTo: bannerContent.trailingAnchor, constant: max(UIScreen.main.bounds.height, UIScreen.main.bounds.width)  * 0.05),
            pageList.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -(max(UIScreen.main.bounds.height, UIScreen.main.bounds.width)  * 0.05)),
            pageList.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ]
        
        if let _ = portraitConstraints, let _ = landscapeConstraints {
            updateConstraintsWithOrientation(portraitConstraints!, landscapeConstraints!)
        }
    }

}

extension CharactersViewController : CharactersViewModelDelegate {
    func showProgress() {
        pageList.startRefresher()
    }
    
    func showError(message: String) {
        errorComponent.messageLabel.text = message
        errorComponent.isHidden = false
        errorComponent.retryButton.isHidden = false
        pageList.isHidden = true
    }
    
    func updateFooterMessage(message: String) {
        if let footerView = pageList.collectionView.supplementaryView(forElementKind: UICollectionView.elementKindSectionFooter, at: IndexPath(item: 0, section: 0)) as? ServiceMessageComponent {
            footerView.messageLabel.text = message
        }
    }
    
    func updateCharacterData(characters: [Characters]){
        pageList.isHidden = false
        errorComponent.isHidden = true
        errorComponent.retryButton.isHidden = true
        charactersCollectionDataSource.reloadCollectionView(with: characters)
        pageList.stopRefresher()
        pageList.collectionView.reloadData()
    }
    
    func searchCharacter(name: String, status: String?) {
        scrollToTop()
        let isFilter = !name.isEmpty() || status != nil ? true : false
        viewModel.setupFilterCase(isFilter: isFilter)
        viewModel.getCharactersData(paginate: false, name: name, status: status)
    }
}
