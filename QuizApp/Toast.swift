//
//  Toast.swift
//  QuizApp
//
//  Created by Fran Grgić on 12/05/2020.
//  Copyright © 2020 Fran Grgic. All rights reserved.
//

import Foundation
import UIKit

class Toast {
    
    static func show(message: String, view: UIView, error: Bool) {
        let toastLabel = UILabel(
            frame: CGRect(x: view.frame.size.width / 2 - 100,
                          y:  100,
                          width: 200, height: 35))
        
        toastLabel.backgroundColor = error ? UIColor.red : UIColor.green
        toastLabel.text = message
//        toastLabel.backgroundColor = UIColor.red
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center
        toastLabel.alpha = 0.0
        toastLabel.clipsToBounds = true
        
        view.addSubview(toastLabel)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            toastLabel.alpha = 1.0
        }, completion: {(isCompleted) in
            UIView.animate(withDuration: 0.5, delay: 2, options: .curveEaseInOut, animations: {
                toastLabel.alpha = 0.0
            }, completion: {(isCompleted) in
                toastLabel.removeFromSuperview()
            })
        })
    }
    
    
    
    static func error(message: String, view: UIView) {
        let toastLabel = UILabel(
            frame: CGRect(x: view.frame.size.width / 2 - 100,
                          y:  100,
                          width: 200, height: 35))
        toastLabel.text = message
        toastLabel.backgroundColor = UIColor.red
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center
        toastLabel.alpha = 0.0
        toastLabel.clipsToBounds = true
        
        view.addSubview(toastLabel)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            toastLabel.alpha = 1.0
        }, completion: {(isCompleted) in
            UIView.animate(withDuration: 0.5, delay: 2, options: .curveEaseInOut, animations: {
                toastLabel.alpha = 0.0
            }, completion: {(isCompleted) in
                toastLabel.removeFromSuperview()
            })
        })
    }
    
    static func success(message: String, view: UIView) {
        let toastLabel = UILabel(
            frame: CGRect(x: view.frame.size.width / 2 - 100,
                          y:  100,
                          width: 200, height: 35))
        toastLabel.text = message
        toastLabel.backgroundColor = UIColor.green
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center
        toastLabel.alpha = 0.0
        toastLabel.clipsToBounds = true
        
        view.addSubview(toastLabel)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            toastLabel.alpha = 1.0
        }, completion: {(isCompleted) in
            UIView.animate(withDuration: 0.5, delay: 2, options: .curveEaseInOut, animations: {
                toastLabel.alpha = 0.0
            }, completion: {(isCompleted) in
                toastLabel.removeFromSuperview()
            })
        })
    }
    
}
