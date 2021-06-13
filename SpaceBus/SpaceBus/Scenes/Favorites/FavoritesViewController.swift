//
//  FavoritesViewController.swift
//  SpaceBus
//
//  Created by Ebubekir Sezer on 13.06.2021.
//

import UIKit

final class FavoritesViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView?
    
    var viewModel: FavoritesViewModelProtocol? {
        didSet {
            viewModel?.delegate = self
        }
    }
    
    var spaceships: [Spaceship]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = .purple
        self.navigationItem.title = "Favorites"
        viewModel = FavoriteViewModel()
        registerCell()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        spaceships = HomeViewController.favorites
        tableView?.reloadData()
    }
    
    private func registerCell() {
        let favoriteCell = UINib(nibName: "FavoriteCell", bundle: nil)
        tableView?.register(favoriteCell, forCellReuseIdentifier: "FavoriteCell")
    }
}

extension FavoritesViewController: FavoritesViewModelDelegate {
    func handleViewModelOutput(_ output: FavoritesViewModelOutput) {
        switch output {
        case .setFavorites(let spaceships):
            self.spaceships = spaceships
        }
    }
}

extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return spaceships?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath) as! FavoriteCell
        
        if let ship = spaceships?[indexPath.row] {
            cell.setupCell(with: ship)
        }
        
        return cell
    }
}
