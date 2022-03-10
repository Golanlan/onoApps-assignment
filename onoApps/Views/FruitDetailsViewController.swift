//
//  FruitDetailsViewController.swift
//  onoApps
//
//  Created by Golan Shoval Gil on 10/03/2022.
//

import Foundation
import UIKit
import SDWebImage

class FruitDetailsViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var model: Fruit?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = model?.name
        
        let url = URL(string: model?.image ?? "")
        imageView.sd_setImage(with: url, completed: nil)
        
        nameLabel.text = "Fruit name: \(model?.name ?? "")"
        descriptionLabel.text = "Fruit description: \(model?.fruitDescription ?? "")"
        priceLabel.text = "Price per unit: \(model?.price ?? 0)"
    }
}
