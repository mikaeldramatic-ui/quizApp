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
                Text("Fråga \(currentQuestionIndex + 1) / \(questions.count)")
                    .font(.headline)
                    .foregroundColor(.white)
                
                Text(questions[currentQuestionIndex].emojis)
                    .font(.system(size: 80))
                
                TextField("Skriv ditt svar...", text: $userAnswer)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                
                VStack(spacing: 15) {
                    Button("Nästa") {
                        checkAnswer()
                        nextQuestion()
                    }
                    .buttonStyle(.borderedProminent)
                    
                    Button("Hoppa över") {
                        nextQuestion()
                    }
                    .buttonStyle(.bordered)
                    
                    Button("Avbryt") {
                        print("Quiz avbruten")
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
        }
    }
    func nextQuestion () {
        
        userAnswer = ""
        
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
        } else {
            print ("Quiz klart! Poäng: \(score)")
        }
    }
}

#Preview {
    QuizView()
}
