//
//  ImageStore.swift
//  EvensTaianStoneChallenge
//
//  Created by Evens Taian on 11/08/23.
//

import Foundation
import UIKit

class ImageStore {

    typealias IsCached = Bool

    fileprivate let imageCache = NSCache<NSString, UIImage>()

    func fetch(for url:URL, completion: @escaping (UIImage?, IsCached) -> Void) {

        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {

            completion(cachedImage, true)
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in

            if error != nil {

                print(error!)
                completion(nil, false)
                return
            }

            if let data = data {

                if let image = UIImage(data: data) {

                    self.imageCache.setObject(image, forKey: url.absoluteString as NSString)
                    completion(image, false)
                    return
                }

                completion(nil, false)
            }
            
        }.resume()
    }

    func invalidate() {

        self.imageCache.removeAllObjects()
    }

    fileprivate func inject(image: UIImage, forKey key: String) {

        imageCache.setObject(image, forKey: key as NSString)
    }
}
