//
//  HomeViewController.swift
//  SpaceBus
//
//  Created by Ebubekir Sezer on 13.06.2021.
//

import UIKit

final class HomeViewController: BaseViewController {
    
    @IBOutlet private weak var spaceshipsCollectionView: UICollectionView? {
        didSet {
            spaceshipsCollectionView?.delegate = self
            spaceshipsCollectionView?.dataSource = self
        }
    }
    @IBOutlet private weak var searchBar: UISearchBar? {
        didSet {
            searchBar?.delegate = self
        }
    }
    @IBOutlet private weak var ugsLabel: UILabel?
    @IBOutlet private weak var eusLabel: UILabel?
    @IBOutlet private weak var dsLabel: UILabel?
    @IBOutlet private weak var spaceshipNameLabel: UILabel?
    @IBOutlet private weak var damageLabel: UILabel?
    @IBOutlet private weak var timeLabel: UILabel?
    @IBOutlet private weak var loading: UIActivityIndicatorView?
    
    private var spaceships: [Spaceship]?
    var filteredSpaceships: [Spaceship]?
    static var favorites: [Spaceship]? = []
    
    var viewModel: HomeViewModelProtocol? {
        didSet {
            viewModel?.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filteredSpaceships = spaceships
        viewModel = HomeViewModel()
        viewModel?.load()
        registerCells()
    }
    
    private func registerCells() {
        let spaceshipCell = UINib(nibName: "SpaceshipCell", bundle: nil)
        spaceshipsCollectionView?.register(spaceshipCell, forCellWithReuseIdentifier: "SpaceshipCell")
    }
}

extension HomeViewController: HomeViewModelDelegate {
    func handleViewModelOutput(_ output: HomeViewModelOutput) {
        switch output {
        case .updateNavigationTitle(let title):
            self.navigationController?.navigationBar.tintColor = BaseColor.shared.TextOnPrimaryColor
            self.navigationItem.title = title
        case .setSpaceships(let spaceships):
            self.spaceships = spaceships
            self.filteredSpaceships = spaceships
            self.spaceshipsCollectionView?.reloadData()
        case .setInformations(let name, let ugs, let eus, let ds, let damage, let time):
            spaceshipNameLabel?.text = name
            ugsLabel?.text = ugs
            eusLabel?.text = eus
            dsLabel?.text = ds
            damageLabel?.text = damage
            timeLabel?.text = time
        case .setLoading(let isLoading):
            if isLoading {
                loading?.isHidden = false
                loading?.startAnimating()
            } else {
                loading?.isHidden = true
                loading?.stopAnimating()
            }
        }
    }
    
    func navigate(to route: HomeRouter) {
        switch route {
        case .alert(let viewModel, let message):
            let viewController = AlertBuilder.make(with: viewModel, message: message)
            self.goToAlert(with: viewController)
        }
    }
}


extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredSpaceships?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SpaceshipCell", for: indexPath) as! SpaceshipCell
        
        cell.delegate = self
        let spaceship = filteredSpaceships?[indexPath.row]
        cell.setupCell(with: spaceship, index: indexPath.row)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let columnSize: CGFloat = 1
        //let spacing = self.collectionView(collectionView, layout: collectionViewLayout, minimumLineSpacingForSectionAt: indexPath.row)
        return CGSize(width: collectionView.bounds.size.width / columnSize, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension HomeViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredSpaceships = []
        if searchText.isEmpty {
            filteredSpaceships = spaceships
        } else {
            filteredSpaceships = viewModel?.filterSpaceships(with: searchText)
        }
        
        spaceshipsCollectionView?.reloadData()
    }
}
