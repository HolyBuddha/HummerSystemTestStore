//
//  BannerCell.swift
//  HummerSystemTestStore
//
//  Created by Vladimir Izmaylov on 17.10.2022.
//

import UIKit

class BannerCell: UICollectionViewCell {
    
    @IBOutlet weak var bannerImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bannerImage.contentMode = .scaleToFill
        clipsToBounds = true
        layer.cornerRadius = 8
    }
}
