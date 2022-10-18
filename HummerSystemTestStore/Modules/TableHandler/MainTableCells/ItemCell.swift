//
//  ItemCell.swift
//  HummerSystemTestStore
//
//  Created by Vladimir Izmaylov on 17.10.2022.
//

import UIKit
import Kingfisher

class ItemCell: UITableViewCell {
    
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        buyButton.clipsToBounds = true
        buyButton.layer.cornerRadius = 8
        buyButton.layer.borderColor = UIColor(
            red: 0.992,
            green: 0.227,
            blue: 0.412,
            alpha: 1
        ).cgColor
        buyButton.layer.borderWidth = 1.2
    }
    
    override func prepareForReuse() {
        imageImageView.cancelDownload()
        descriptionLabel.isHidden = false
    }
    
    func setData(_ data: FakeStoreModel) {
        
        let buttonText = "Buy for \(String(data.price))$"
        
        titleLabel.text = data.title
        if data.description != "" {
            descriptionLabel.text = data.description
        } else {
            descriptionLabel.isHidden = true
        }
        
        buyButton.setTitle(buttonText, for: .normal)
        buyButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        imageImageView.setKfImage(urlString: data.image)
    }
    @objc func buttonAction() {
        print(buyButton.titleLabel?.text ?? "0")
    }
}
