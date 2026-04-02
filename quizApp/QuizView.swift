//
//  QuizView.swift
//  quizApp
//
//  Created by Mikael Engvall on 2026-03-29.
//

import SwiftUI

struct QuizView: View {

    let questions = quizQuestions
    
    // Array of quiz-related emojis for background
    private let emojis = ["🎯", "🎮", "🎲", "🎪", "🎨", "🎭", "🎬", "🎤", "🎧", "🎸",
                          "🎹", "🎺", "🎻", "🎼", "🎵", "🎶", "🏆", "🥇", "🥈", "🥉",
                          "💯", "✨", "⭐️", "🌟", "💫", "🔥", "🎉", "🎊", "🎈", "🎁"]
    
    @State private var currentQuestionIndex = 0
    @State private var userAnswer = ""
    @State private var score = 0
    
    private var questionProgressText: String {
        String(
            format: NSLocalizedString("question_progress", comment: ""),
            currentQuestionIndex + 1,
            questions.count
        )
    }
    
    var body: some View {
        
        ZStack {
            EmojiBackgroundView(emojis: emojis, isAnimating: false)
            
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.black.opacity(0.3),
                    Color.black.opacity(0.5),
                    Color.black.opacity(0.3)
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
         
            //UI quiz
            VStack(spacing: 30) {
                Text(questionProgressText)
                    .font(.headline)
                    .foregroundColor(.white)
                
                Text(questions[currentQuestionIndex].emojis)
                    .font(.system(size: 80))
                
                TextField("write_answer", text: $userAnswer)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                
                VStack(spacing: 15) {
                    Button("next_button") {
                        checkAnswer()
                        nextQuestion()
                    }
                    .buttonStyle(.borderedProminent)
                    
                    Button("skip_button") {
                        nextQuestion()
                    }
                    .buttonStyle(.bordered)
                    
                    Button("cancel_button") {
                        print(String(localized: "quiz_cancelled"))
                    }
                    .foregroundColor(.red)
                }
                Spacer()
            }
            .padding()
            
        }
    }
    
    func checkAnswer() {
        let currentQuestion = questions[currentQuestionIndex]
        let trimmedAnswer = userAnswer.trimmingCharacters(in: .whitespaces).lowercased()
        
        // Check if answer matches correct answer or any alternate answers
        if trimmedAnswer == currentQuestion.correctAnswer.lowercased() ||
           currentQuestion.alternateAnswers.contains(where: { $0.lowercased() == trimmedAnswer }) {
            score += 1
            print(String(localized: "correct"))
        } else {
            print(String(localized: "wrong"))
        }
    }
    
    func nextQuestion() {
        
        userAnswer = ""
        
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
        } else {
            print(String(format: NSLocalizedString("quiz_finished", comment: ""), score))
        }
    }
}

#Preview {
    QuizView()
}
