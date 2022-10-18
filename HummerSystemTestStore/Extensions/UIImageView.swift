//
//  UIImageView.swift
//  HummerSystemTestStore
//
//  Created by Vladimir Izmaylov on 17.10.2022.
//

import Foundation
import Kingfisher

extension UIImageView {
    
    func setKfImage(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        self.kf.setImage(
            with: url,
            options: [
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
    }
    
    func cancelDownload() {
        self.image = nil
        self.kf.cancelDownloadTask()
    }
}
