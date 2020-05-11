//
//  QuestionView.swift
//  QuizApp
//
//  Created by Fran Grgić on 11/05/2020.
//  Copyright © 2020 Fran Grgic. All rights reserved.
//

import Foundation
import UIKit

class QuestionView: UIView {
    
    private var currentQuestion: Question!
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var answerButtons: [UIButton]!
    
    @IBAction func questionTapped(_ sender: UIButton) {
        if let button = sender as? UIButton {
            button.backgroundColor =
                button.tag == self.question.correctAnswer ? .green : .red
            self.answerButtons.forEach({$0.isEnabled = false})
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("QuestionView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    var question: Question {
        get {
            return self.currentQuestion
        }
        set(question) {
            self.currentQuestion = question
            self.questionLabel.text = question.question
            self.answerButtons.enumerated().forEach{
                $1.setTitle(question.answers[$0], for: .normal)
                $1.isEnabled = true
            }
        }
    }
    
    
    
}
