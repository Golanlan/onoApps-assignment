//
//  FruitTableViewCell.swift
//  onoApps
//
//  Created by Golan Shoval Gil on 10/03/2022.
//

import Foundation
import UIKit
import SDWebImage

class FruitTableViewCell: UITableViewCell {
    static let identifier = "FruitTableViewCell"
    
    private let fruitImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private let fruitNameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(fruitImageView)
        contentView.addSubview(fruitNameLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        fruitImageView.frame = CGRect(x: 0,
                                      y: 0,
                                      width: 100,
                                      height: 100)
        fruitNameLabel.frame = CGRect(x: fruitImageView.frame.width + 10,
                                      y: 0,
                                      width: contentView.frame.width - fruitImageView.frame.width - 10,
                                      height: 100)
    }
    
    func setCell(with model: Fruit?) {
        if let imageString = model?.image, let imageURL = URL(string: imageString) {
            fruitImageView.sd_setImage(with: imageURL, completed: nil)
        }
        
        fruitNameLabel.text = model?.name
    }
}
