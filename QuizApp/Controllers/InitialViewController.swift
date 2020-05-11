//
//  InitialViewController.swift
//  QuizApp
//
//  Created by Fran Grgić on 11/05/2020.
//  Copyright © 2020 Fran Grgic. All rights reserved.
//

import Foundation
import UIKit

class InitialViewController: UIViewController {
    
    private final let quizService = QuizService()
    private final let imageService = ImageService()
    
    var questionView: QuestionView?
    
    @IBOutlet weak var funFactLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var coverImage: UIImageView!
    
    @IBOutlet var questionViewContainer: UIView!
    
    @IBAction func FetchButtonAction(_ sender: UIButton) {
        fetchQuizzesFromApi()
    }
    
    func fetchQuizzesFromApi() {
        quizService.fetchQuizzes( completion: { (quizzes) in
            DispatchQueue.main.async {
                if let quizzes = quizzes, let quiz = quizzes.randomElement() {
                    self.setFunFact(quizzes: quizzes)
                    self.setQuizData(quiz: quiz)
                    self.setQuestionData(question: quiz.questions.randomElement()!)
                    
                    Toast.show(message: "Fetched", view: self.view, error: false)
                    self.funFactLabel.isHidden = false;
                    self.coverImage.isHidden = false;
                    self.questionViewContainer.isHidden = false;
                    self.titleLabel.isHidden = false;
                } else {
                    Toast.show(message: "Internal server error", view: self.view, error: true)
                    self.funFactLabel.isHidden = true;
                    self.coverImage.isHidden = true;
                    self.questionViewContainer.isHidden = true;
                    self.titleLabel.isHidden = true;
                }
            }
        })
    }
    
    func setQuestionData(question: Question) {
        self.questionView = QuestionView(
            frame: CGRect(origin: CGPoint(x: 0, y: 0),
                          size: self.questionViewContainer.frame.size))
        if let questionView = self.questionView {
            self.questionViewContainer.addSubview(questionView)
        }
        
        if let questionView = self.questionView {
            questionView.question = question
        }
    }
    
    
    func setQuizData(quiz: Quiz) {
        titleLabel.text = quiz.title
        titleLabel.textColor = quiz.category.color
        
        if let imageUrl = quiz.imageUrl {
            imageService.fetchImage(urlString: imageUrl, completion: { (image) in
                DispatchQueue.main.async {
                    self.coverImage.image = image
                    self.coverImage.center.x = self.view.center.x
                }
            })
        }
    }
    
    
    func setFunFact(quizzes arr: [Quiz]) {
        // get all questions that contain "NBA" string
        let NBAQuestionCount = arr.map{$0.questions}.flatMap{$0}.filter{$0.question.contains("NBA")}.count
        
        self.funFactLabel.text = "There are \(NBAQuestionCount) questions about NBA in these quizzes"
        self.funFactLabel.sizeToFit()
    }
    
    
}
