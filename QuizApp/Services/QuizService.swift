//
//  QuizService.swift
//  QuizApp
//
//  Created by Fran Grgić on 11/05/2020.
//  Copyright © 2020 Fran Grgic. All rights reserved.
//

import Foundation
import UIKit

class QuizService{
    private final let apiURL = "https://iosquiz.herokuapp.com/api/quizzes"
    
    func fetchQuizzes(completion: @escaping (([Quiz]?) -> Void)) {
        if let URL = URL(string: apiURL) {
            var request = URLRequest(url: URL)
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let data = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        
                        if let respJSON = json as? [String: Any],
                            let respQuizzes = respJSON["quizzes"] as? [Any] {
                            let quizzes = respQuizzes.compactMap{ Quiz(json: $0) }
                            
                            completion(quizzes)
                        } else {
                            completion(nil)
                        }
                    } catch {
                        completion(nil)
                    }
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
