//
//  ViewController.swift
//  onoApps
//
//  Created by Golan Shoval Gil on 10/03/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "OnO Assignment"
        
        viewModel.fruitsBox.bind { [weak self] fruits in
            if let fruits = fruits, !fruits.isEmpty {
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }
        
        setupTableView()
        viewModel.fetchData()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FruitTableViewCell.self, forCellReuseIdentifier: FruitTableViewCell.identifier)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.fruitsBox.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FruitTableViewCell.identifier, for: indexPath) as? FruitTableViewCell else { return UITableViewCell() }
        
        let item = viewModel.fruitsBox.value?[indexPath.row]
        cell.setCell(with: item)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "FruitDetailsViewController") as? FruitDetailsViewController else { return }
        let item = viewModel.fruitsBox.value?[indexPath.row]

        viewController.model = item
        navigationController?.pushViewController(viewController, animated: true)
    }
}
