//
//  CategoryCell.swift
//  HummerSystemTestStore
//
//  Created by Vladimir Izmaylov on 17.10.2022.
//

import UIKit

class CategoryCell: UICollectionViewCell {

    @IBOutlet weak var categoryLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        clipsToBounds = true
        layer.cornerRadius = 16
    }
    
    func setLabel(_ category: String) {
        categoryLabel.text = category
    }
}
