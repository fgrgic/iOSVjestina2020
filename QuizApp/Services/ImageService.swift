//
//  ImageService.swift
//  QuizApp
//
//  Created by Fran Grgić on 11/05/2020.
//  Copyright © 2020 Fran Grgic. All rights reserved.
//

import Foundation
import UIKit

class ImageService {
    
    func fetchImage(urlString: String, completion: @escaping ((UIImage?) -> Void)) {
        if let URL = URL(string: urlString) {
            let req = URLRequest(url: URL)
            
            let dataTask = URLSession.shared.dataTask(with: req) { (data, resp, err) in
                if let data = data {
                    let image = UIImage(data: data)
                    completion(image)
                } else {
                    completion(nil)
                }
            }
            dataTask.resume()
        } else {
            completion(nil)
        }
        
    }
}
