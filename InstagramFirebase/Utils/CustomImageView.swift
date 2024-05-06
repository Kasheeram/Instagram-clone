//
//  CustomImageView.swift
//  InstagramFirebase
//
//  Created by Kashee on 28/05/23.
//

import UIKit

var imageCache = [String: UIImage]()

class CustomImageView: UIImageView {
    
    var lastUrlUsedToLoadImage: String?
    
    func loadImage(urlString: String) {
        lastUrlUsedToLoadImage = urlString
        
        self.image = nil
        if let cachedImage = imageCache[urlString] {
            self.image = cachedImage
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        
        // Its like a image cache, downloading image using url or we can use SDWebImage
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            if let err = err {
                print("Faild to fetch profile image:", err)
                return
            }
            
            if url.absoluteString != self.lastUrlUsedToLoadImage {
                return
            }
            
            guard let data = data else { return }
            let image = UIImage(data: data)
            imageCache[url.absoluteString] = image
            
            DispatchQueue.main.async {
                self.image = image
            }
            
        }.resume()
    }
}
