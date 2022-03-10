//
//  ViewModel.swift
//  onoApps
//
//  Created by Golan Shoval Gil on 10/03/2022.
//

import Foundation
import SDWebImage

enum ViewModelErrors: Error {
    case failedToFetch
}

class ViewModel {
    
    let dataLink = "https://dev-api.com/fruitsBT/getFruits"
    
    let fruitsBox: Box<[Fruit]?> = Box(nil)
    
    func fetchData() {
        guard let url = URL(string: dataLink) else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                self?.fruitsBox.value = nil
                return

            }
            
            do {
                let mainModel = try JSONDecoder().decode(MainModel.self, from: data)
                self?.fruitsBox.value = mainModel.fruits
                
            } catch {
                self?.fruitsBox.value = nil
            }
        }
        task.resume()
    }
}
